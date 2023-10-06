# TCL File Generated by Component Editor 21.1
# Tue May 10 17:53:26 MDT 2022
# DO NOT MODIFY


# 
# Pitch_Shift "Pitch Shift" v1.0
#  2022.05.10.17:53:26
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module Pitch_Shift
# 
set_module_property DESCRIPTION ""
set_module_property NAME Pitch_Shift
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "Pitch Shift"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL pitchshiftprocessor
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file pitchShiftProcessor.vhd VHDL PATH pitchShiftProcessor.vhd TOP_LEVEL_FILE
add_fileset_file pitchShift.vhd VHDL PATH pitchShift.vhd
add_fileset_file pitchShift_tc.vhd VHDL PATH pitchShift_tc.vhd
add_fileset_file DualPortRAM_generic.vhd VHDL PATH DualPortRAM_generic.vhd
add_fileset_file ast2lr.vhd VHDL PATH ast2lr.vhd
add_fileset_file lr2ast.vhd VHDL PATH lr2ast.vhd


# 
# parameters
# 


# 
# display items
# 


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point avalon_mm
# 
add_interface avalon_mm avalon end
set_interface_property avalon_mm addressUnits WORDS
set_interface_property avalon_mm associatedClock clock
set_interface_property avalon_mm associatedReset reset
set_interface_property avalon_mm bitsPerSymbol 8
set_interface_property avalon_mm burstOnBurstBoundariesOnly false
set_interface_property avalon_mm burstcountUnits WORDS
set_interface_property avalon_mm explicitAddressSpan 0
set_interface_property avalon_mm holdTime 0
set_interface_property avalon_mm linewrapBursts false
set_interface_property avalon_mm maximumPendingReadTransactions 0
set_interface_property avalon_mm maximumPendingWriteTransactions 0
set_interface_property avalon_mm readLatency 0
set_interface_property avalon_mm readWaitTime 1
set_interface_property avalon_mm setupTime 0
set_interface_property avalon_mm timingUnits Cycles
set_interface_property avalon_mm writeWaitTime 0
set_interface_property avalon_mm ENABLED true
set_interface_property avalon_mm EXPORT_OF ""
set_interface_property avalon_mm PORT_NAME_MAP ""
set_interface_property avalon_mm CMSIS_SVD_VARIABLES ""
set_interface_property avalon_mm SVD_ADDRESS_GROUP ""

add_interface_port avalon_mm avalon_mm_address address Input 2
add_interface_port avalon_mm avalon_mm_read read Input 1
add_interface_port avalon_mm avalon_mm_readdata readdata Output 32
add_interface_port avalon_mm avalon_mm_write write Input 1
add_interface_port avalon_mm avalon_mm_writedata writedata Input 32
set_interface_assignment avalon_mm embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_mm embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_mm embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_mm embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 98304000
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point avalon_streaming_sink
# 
add_interface avalon_streaming_sink avalon_streaming end
set_interface_property avalon_streaming_sink associatedClock clock
set_interface_property avalon_streaming_sink associatedReset reset
set_interface_property avalon_streaming_sink dataBitsPerSymbol 24
set_interface_property avalon_streaming_sink errorDescriptor ""
set_interface_property avalon_streaming_sink firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_sink maxChannel 1
set_interface_property avalon_streaming_sink readyLatency 0
set_interface_property avalon_streaming_sink ENABLED true
set_interface_property avalon_streaming_sink EXPORT_OF ""
set_interface_property avalon_streaming_sink PORT_NAME_MAP ""
set_interface_property avalon_streaming_sink CMSIS_SVD_VARIABLES ""
set_interface_property avalon_streaming_sink SVD_ADDRESS_GROUP ""

add_interface_port avalon_streaming_sink avalon_st_sink_channel channel Input 1
add_interface_port avalon_streaming_sink avalon_st_sink_data data Input 24
add_interface_port avalon_streaming_sink avalon_st_sink_valid valid Input 1


# 
# connection point avalon_streaming_source
# 
add_interface avalon_streaming_source avalon_streaming start
set_interface_property avalon_streaming_source associatedClock clock
set_interface_property avalon_streaming_source associatedReset reset
set_interface_property avalon_streaming_source dataBitsPerSymbol 24
set_interface_property avalon_streaming_source errorDescriptor ""
set_interface_property avalon_streaming_source firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_source maxChannel 1
set_interface_property avalon_streaming_source readyLatency 0
set_interface_property avalon_streaming_source ENABLED true
set_interface_property avalon_streaming_source EXPORT_OF ""
set_interface_property avalon_streaming_source PORT_NAME_MAP ""
set_interface_property avalon_streaming_source CMSIS_SVD_VARIABLES ""
set_interface_property avalon_streaming_source SVD_ADDRESS_GROUP ""

add_interface_port avalon_streaming_source avalon_st_source_channel channel Output 1
add_interface_port avalon_streaming_source avalon_st_source_data data Output 24
add_interface_port avalon_streaming_source avalon_st_source_valid valid Output 1


# 
# connection point export
# 
add_interface export conduit end
set_interface_property export associatedClock clock
set_interface_property export associatedReset ""
set_interface_property export ENABLED true
set_interface_property export EXPORT_OF ""
set_interface_property export PORT_NAME_MAP ""
set_interface_property export CMSIS_SVD_VARIABLES ""
set_interface_property export SVD_ADDRESS_GROUP ""

add_interface_port export enable_switch switch Input 1

