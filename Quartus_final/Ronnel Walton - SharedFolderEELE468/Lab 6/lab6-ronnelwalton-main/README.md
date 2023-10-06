# EELE 468 lab 6: LED Array Device Driver

This lab will have youi create a device driver for the LED array on the DE10 Nano.

The instructions are in [device_drivers_lab.pdf](device_drivers_lab.pdf).


## Demo

1. Using the character device at `/dev/led_array`, make  the binary value 0b00101011 show up on your lEDs.
2. Create a shel script that displays a pattern of your choosing on the LEDs; the pattern **can't** be the exact same as those in the handout.
3. Prove that you wrote your driver by showing the output of `modinfo led-array.ko`

## Submission

- Make sure you have comitted all the files you created or modified during this lab. Commit your updated audio mini device tree to your linux-socfpga repository.
- Create a pull request from the `main` branch into the `feedback` branch
    - @mention me in the comments
    - Include a URL/link to your audio mini device tree from your `linux-socfpga` repository.

## Directory structure

- `quartus`: This is the Quartus project you'll use for this lab
- `led-array`: This directory has the `led_array` VHDL component in it. You'll also put your `led-array.c` and Makefile in this directory. This directory will contain everything related to the LED array (VHDL and device driver).
