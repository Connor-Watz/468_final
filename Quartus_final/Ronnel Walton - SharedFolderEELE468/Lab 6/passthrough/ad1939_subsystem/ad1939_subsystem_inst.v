	ad1939_subsystem u0 (
		.ad1939_physical_asdata2     (<connected-to-ad1939_physical_asdata2>),     //         ad1939_physical.asdata2
		.ad1939_physical_dsdata1     (<connected-to-ad1939_physical_dsdata1>),     //                        .dsdata1
		.ad1939_physical_dbclk       (<connected-to-ad1939_physical_dbclk>),       //                        .dbclk
		.ad1939_physical_dlrclk      (<connected-to-ad1939_physical_dlrclk>),      //                        .dlrclk
		.ad1939_physical_abclk_clk   (<connected-to-ad1939_physical_abclk_clk>),   //   ad1939_physical_abclk.clk
		.ad1939_physical_alrclk_clk  (<connected-to-ad1939_physical_alrclk_clk>),  //  ad1939_physical_alrclk.clk
		.ad1939_physical_mclk_clk    (<connected-to-ad1939_physical_mclk_clk>),    //    ad1939_physical_mclk.clk
		.audio_fabric_system_clk_clk (<connected-to-audio_fabric_system_clk_clk>), // audio_fabric_system_clk.clk
		.from_line_in_data           (<connected-to-from_line_in_data>),           //            from_line_in.data
		.from_line_in_channel        (<connected-to-from_line_in_channel>),        //                        .channel
		.from_line_in_valid          (<connected-to-from_line_in_valid>),          //                        .valid
		.subsystem_reset_reset       (<connected-to-subsystem_reset_reset>),       //         subsystem_reset.reset
		.to_headphone_out_data       (<connected-to-to_headphone_out_data>),       //        to_headphone_out.data
		.to_headphone_out_channel    (<connected-to-to_headphone_out_channel>),    //                        .channel
		.to_headphone_out_valid      (<connected-to-to_headphone_out_valid>)       //                        .valid
	);

