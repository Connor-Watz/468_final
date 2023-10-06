
module ad1939_subsystem (
	ad1939_physical_asdata2,
	ad1939_physical_dsdata1,
	ad1939_physical_dbclk,
	ad1939_physical_dlrclk,
	ad1939_physical_abclk_clk,
	ad1939_physical_alrclk_clk,
	ad1939_physical_mclk_clk,
	audio_fabric_system_clk_clk,
	from_line_in_data,
	from_line_in_channel,
	from_line_in_valid,
	subsystem_reset_reset,
	to_headphone_out_data,
	to_headphone_out_channel,
	to_headphone_out_valid);	

	input		ad1939_physical_asdata2;
	output		ad1939_physical_dsdata1;
	output		ad1939_physical_dbclk;
	output		ad1939_physical_dlrclk;
	input		ad1939_physical_abclk_clk;
	input		ad1939_physical_alrclk_clk;
	input		ad1939_physical_mclk_clk;
	output		audio_fabric_system_clk_clk;
	output	[23:0]	from_line_in_data;
	output		from_line_in_channel;
	output		from_line_in_valid;
	input		subsystem_reset_reset;
	input	[23:0]	to_headphone_out_data;
	input		to_headphone_out_channel;
	input		to_headphone_out_valid;
endmodule
