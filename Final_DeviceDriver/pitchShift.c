#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/mod_devicetable.h>
#include <linux/io.h>
#include <linux/types.h>
#include <linux/mutex.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/kernel.h>


// Define Statements
#define REG0_AUDIO_IN_OFFSET 0x0
#define REG1_DELTA1_OFFSET 0x04                                          
#define SPAN 0x08
/**
* struct pitch_shift_dev - Private led array device struct.
* @reg: Base address of the led array component
* @value: The led array's current value
*
* An pitch_shift_dev struct gets created for each led array in the system.
*/
struct pitch_shift_dev {
	struct miscdevice miscdev;
	void __iomem *base_addr;
	struct mutex lock;
};


/**
* pitch_shift_read() - Read method for the pitch_shift char device
* @file: Pointer to the char device file struct.
* @buf: User-space buffer to read the value into.
* @count: The number of bytes being requested.
* @offset: The byte offset in the file being read from.
*
* On success, the number of bytes read is returned and @offset is advanced
* by this number. On error, a negative error value is returned.
*/
 static ssize_t delta1_show(struct device *dev,
	struct device_attribute *attr, char *buf)
{
	u8 sys_clks_sec;
	struct pitch_shift_dev *priv = dev_get_drvdata(dev);

	sys_clks_sec = ioread32(priv->base_addr + REG1_DELTA1_OFFSET);

	return scnprintf(buf, PAGE_SIZE, "%u\n", sys_clks_sec);
}

static ssize_t pitch_shift_read(struct file *file, char __user *buf,
size_t count, loff_t *offset)
{
	size_t ret;
	u32 val;
	
	loff_t pos = *offset;
/*
* Get the device's private data from the file struct's private_data
* field. The private_data field is equal to the miscdev field in the
* pitch_shift_dev struct. container_of returns the pitch_shift_dev struct
* that contains the miscdev in private_data.
*/
struct pitch_shift_dev *priv = container_of(file->private_data,
							struct pitch_shift_dev, miscdev);

if (pos < 0){
	return -EINVAL;
}
if (pos >= SPAN){
	return 0;
}
if((pos % 0x4) != 0){
	/* Prevent unaligned access. We only want to
	*  access 32-bit aligned addresses
	*/
	pr_warn("pitch_shift_read: unaligned access\n");
	return -EFAULT;
}
// If user requests no bytes, return no bytes
if (count == 0){
	return 0;
}

// Read value from hardware, in case it changed without our knowledge
val = ioread32(priv->base_addr + pos);

ret = copy_to_user(buf, &val, sizeof(val));
if(ret == sizeof(val)){
	// means that nothing was copied to user
	pr_warn("pitch_shift_read: nothing copied\n");
	return -EFAULT;
	goto unlock;
}

// Increment file offset by # bytes read
*offset = pos + sizeof(val);

return sizeof(val);
}
/*
* Copy data to user-space and return the number of bytes copied.
* Returns an error if the copy did not work.
*/
return simple_read_from_buffer(buf, count, offset,
&priv->value, sizeof(priv->value));
}

/**
* pitch_shift_write() - Write method for the pitch_shift char device
* @file: Pointer to the char device file struct.
* @buf: User-space buffer to read the value from.
* @count: The number of bytes being written.
* @offset: The byte offset in the file being written to.
*
* On success, the number of bytes written is returned and the offset @offset is
* advanced by this number. On error, a negative value is returned.
*/
static ssize_t pitch_shift_write(struct file *file, const char __user *buf,
size_t count, loff_t *offset)
{
	size_t ret;
	u32 val;
	
	struct pitch_shift_dev *priv = container_of(file->private_data,
									struct pitch_shift_dev, miscdev);
								
	if (pos < 0){
	return -EINVAL;
}
IF (pos >= SPAN){
	return 0;
}
if((pos % 0x4) != 0){
	/* Prevent unaligned access. We only want to
	*  access 32-bit aligned addresses
	*/
	pr_warn("pitch_shift_read: unaligned access\n");
	return -EFAULT;
}
// If user requests no bytes, return no bytes
if (count == 0){
	return 0;
}

if (count > sizeof(priv->value)) {
pr_notice("Input value is too large\n");
return -EINVAL;
}
mutex_lock(&priv->lock);
// Copy data from user-space into priv->value.
ret = copy_from_user(&val, sizeof(val));
if (ret == sizeof(val) {
// simple_write_to_buffer returned a negative error code
	pr_warn("pitch_shift_write: nothing copied\n");
	ret = -EFAULT;
	goto unlock;
}
	iowrite32(val, priv->base_addr + pos);
	*offset = pos + sizeof(val);
	
	ret = sizeof(val);

unlock:
mutex_unlock(&priv->lock);
return ret;
}

// File operations struct for our miscdev
static const struct file_operations pitch_shift_fops = {
.owner = THIS_MODULE,
.read = pitch_shift_read,
.write = pitch_shift_write,
};




/**
* pitch_shift_probe() - Initialize device when a match is found
* @pdev: Platform device structure associated with our led array device;
* pdev is automatically created by the driver core based upon our
* led array device tree node.
*
* When a device that is compatible with this led array driver is found, the
* driver's probe function is called. This probe function gets called by the
* kernel when an pitch_shift device is found in the device tree.
*/
static int pitch_shift_probe(struct platform_device *pdev)
{
	struct pitch_shift_dev *priv;
	int ret;
	/*
	* Allocate kernel memory for the led array device and set it to 0.
	* GFP_KERNEL specifies that we are allocating normal kernel RAM;
	* see the kmalloc documentation for more info. The allocated memory
	* is automatically freed when the device is removed.
	*/
	priv = devm_kzalloc(&pdev->dev, sizeof(struct pitch_shift_dev),
	GFP_KERNEL);
	if (!priv) {
	pr_err("Failed to allocate memory\n");
	return -ENOMEM;
	}
	/*
	* Request and remap the device's memory region. Requesting the region
	* make sure nobody else can use that memory. The memory is remapped
	* into the kernel's virtual address space becuase we don't have access
	* to physical memory locations.
	*/
	priv->reg = devm_platform_ioremap_resource(pdev, 0);
	if (IS_ERR(priv->reg)) {
	pr_err("Failed to request/remap platform device resource\n");
	return PTR_ERR(priv->reg);
	}
	// Initialize LEDs to on, just for fun.
	priv->value = 0xff;
	iowrite32(priv->value, priv->reg);

	// Initialize the misc device parameters
	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
	priv->miscdev.name = "pitch_shift";
	priv->miscdev.fops = &pitch_shift_fops;
	priv->miscdev.parent = &pdev->dev;
	// Register the misc device; this creates a char dev at /dev/pitch_shift
	ret = misc_register(&priv->miscdev);
	if (ret) {
	pr_err("Failed to register misc device\n");
	return ret;
	}

	// Attach the led array's private data to the platform device's struct.
	platform_set_drvdata(pdev, priv);
	pr_info("pitch_shift_probe successful\n");
	return 0;
}

/**
* pitch_shift_probe() - Remove an led array device.
* @pdev: Platform device structure associated with our led array device.
*
* This function is called when an led array devicee is removed or
* the driver is removed.
*/
static int pitch_shift_remove(struct platform_device *pdev)
{
	// Get the led array's private data from the platform device.
	struct pitch_shift_dev *priv = platform_get_drvdata(pdev);
	// Turn the lEDs off, just for kicks.
	iowrite32(0x00, priv->reg);

	// Deregister the misc device and remove the /dev/pitch_shift file.
	misc_deregister(&priv->miscdev);

	pr_info("pitch_shift_remove successful\n");
	return 0;
}


/**
* value_show() - Return the led array value to user-space via sysfs.
* @dev: Device structure for the led array. This device struct is embedded in
* the led array's platform device struct.
* @attr: The specific sysfs attribute being requested; this is unused since we
* only have one attribute.
* @buf: Buffer that gets returned to the led array value to user-space.
*/
static ssize_t value_show(struct device *dev,
struct device_attribute *attr, char *buf)
{
// Get the private pitch_shift data out of the dev struct
	struct pitch_shift_dev *priv = dev_get_drvdata(dev);
/*
* the value in reg should generally be equal to the "value" shadow
* register; the only exception would be when the register was modified
* directly in hardware or over jtag, thereby bypassing our driver
*/

	// Deregister the misc device and remove the /dev/pitch_shift file.
	misc_deregister(&priv->miscdev);

	pr_info("pitch_shift_remove successful\n");
return 0;
}

/**
* value_store() - Store the value that was written to the "value" attribute
* @dev: Device structure for the led array. This device struct is embedded in
* the led array's platform device struct.
* @attr: The specific sysfs attribute being requested; this is unused since we
* only have one attribute.
* @buf: Buffer that contains the led array value being written.
* @size: The number of bytes being written.
*/
static ssize_t value_store(struct device *dev,
struct device_attribute *attr, const char *buf, size_t size)
{
struct pitch_shift_dev *priv = dev_get_drvdata(dev);
int ret;
// Parse the string we were passed and put it into a u8, if possible.
ret = kstrtou8(buf, 0, &priv->value);
if (ret < 0) {
// kstrtou8 returned an error
return ret;
}
iowrite32(priv->value, priv->reg);
// Write was succesful, so we return the number of bytes we wrote.
ret = size;
return ret;
}

/*
* Define the compatible property used for matching devices to this driver,
* then add our device id structure to the kernel's device table. For a device
* to be matched with this driver, its device tree node must use the same
* compatible string as defined here.
*/
static const struct of_device_id pitch_shift_of_match[] = {
{ .compatible = "watz,pitch_shift", },
{ }
};
MODULE_DEVICE_TABLE(of, pitch_shift_of_match);
/**
* struct pitch_shift_driver - Platform driver struct for the led array driver
* @probe: Function that's called when a device is found
* @remove: Function that's called when a device is removed
* @driver.owner: Which module owns this driver
* @driver.name: Name of the led array driver
* @driver.of_match_table: Device tree match table
*/
static struct platform_driver pitch_shift_driver = {
.probe = pitch_shift_probe,
.remove = pitch_shift_remove,
.driver = {
.owner = THIS_MODULE,
.name = "pitch_shift",
.of_match_table = pitch_shift_of_match,
.dev_groups = pitch_shift_groups,
},
};
/*
* We don't need to do anything special in module init/exit.
* This macro automatically handles module init/exit.
*/
module_platform_driver(pitch_shift_driver);
MODULE_LICENSE("Dual MIT/GPL");
MODULE_AUTHOR("Connor Watz");
MODULE_DESCRIPTION("Pitch Shift Driver");
MODULE_VERSION("1.0");
