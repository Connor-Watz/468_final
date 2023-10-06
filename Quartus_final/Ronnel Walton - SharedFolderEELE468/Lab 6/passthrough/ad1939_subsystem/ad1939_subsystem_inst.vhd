	component ad1939_subsystem is
		port (
			ad1939_physical_asdata2     : in  std_logic                     := 'X';             -- asdata2
			ad1939_physical_dsdata1     : out std_logic;                                        -- dsdata1
			ad1939_physical_dbclk       : out std_logic;                                        -- dbclk
			ad1939_physical_dlrclk      : out std_logic;                                        -- dlrclk
			ad1939_physical_abclk_clk   : in  std_logic                     := 'X';             -- clk
			ad1939_physical_alrclk_clk  : in  std_logic                     := 'X';             -- clk
			ad1939_physical_mclk_clk    : in  std_logic                     := 'X';             -- clk
			audio_fabric_system_clk_clk : out std_logic;                                        -- clk
			from_line_in_data           : out std_logic_vector(23 downto 0);                    -- data
			from_line_in_channel        : out std_logic;                                        -- channel
			from_line_in_valid          : out std_logic;                                        -- valid
			subsystem_reset_reset       : in  std_logic                     := 'X';             -- reset
			to_headphone_out_data       : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data
			to_headphone_out_channel    : in  std_logic                     := 'X';             -- channel
			to_headphone_out_valid      : in  std_logic                     := 'X'              -- valid
		);
	end component ad1939_subsystem;

	u0 : component ad1939_subsystem
		port map (
			ad1939_physical_asdata2     => CONNECTED_TO_ad1939_physical_asdata2,     --         ad1939_physical.asdata2
			ad1939_physical_dsdata1     => CONNECTED_TO_ad1939_physical_dsdata1,     --                        .dsdata1
			ad1939_physical_dbclk       => CONNECTED_TO_ad1939_physical_dbclk,       --                        .dbclk
			ad1939_physical_dlrclk      => CONNECTED_TO_ad1939_physical_dlrclk,      --                        .dlrclk
			ad1939_physical_abclk_clk   => CONNECTED_TO_ad1939_physical_abclk_clk,   --   ad1939_physical_abclk.clk
			ad1939_physical_alrclk_clk  => CONNECTED_TO_ad1939_physical_alrclk_clk,  --  ad1939_physical_alrclk.clk
			ad1939_physical_mclk_clk    => CONNECTED_TO_ad1939_physical_mclk_clk,    --    ad1939_physical_mclk.clk
			audio_fabric_system_clk_clk => CONNECTED_TO_audio_fabric_system_clk_clk, -- audio_fabric_system_clk.clk
			from_line_in_data           => CONNECTED_TO_from_line_in_data,           --            from_line_in.data
			from_line_in_channel        => CONNECTED_TO_from_line_in_channel,        --                        .channel
			from_line_in_valid          => CONNECTED_TO_from_line_in_valid,          --                        .valid
			subsystem_reset_reset       => CONNECTED_TO_subsystem_reset_reset,       --         subsystem_reset.reset
			to_headphone_out_data       => CONNECTED_TO_to_headphone_out_data,       --        to_headphone_out.data
			to_headphone_out_channel    => CONNECTED_TO_to_headphone_out_channel,    --                        .channel
			to_headphone_out_valid      => CONNECTED_TO_to_headphone_out_valid       --                        .valid
		);

