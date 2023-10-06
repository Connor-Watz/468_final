entity pitchshiftprocessor is
	port (
		clk : in std_logic ;
		reset : in std_logic ;
		avalon_st_sink_valid : in std_logic ;
		avalon_st_sink_data : in std_logic_vector (23 downto 0);
		avalon_st_sink_channel : in std_logic_vector (0 downto 0);
		avalon_st_source_valid : out std_logic ;
		avalon_st_source_data : out std_logic_vector (23 downto 0);
		avalon_st_source_channel : out std_logic_vector (0 downto 0);
		avalon_mm_address : in std_logic_vector (1 downto 0);
		avalon_mm_read : in std_logic ;
		avalon_mm_readdata : out std_logic_vector (31 downto 0);
		avalon_mm_write : in std_logic ;
		avalon_mm_writedata : in std_logic_vector (31 downto 0)
	);
end entity pitchshiftprocessor ;

architecture pitchshiftprocessor_arch of pitchshiftprocessor is

	u_ast2lr : component ast2lr
		port map (
			clk => clk ,
			avalon_sink_data => avalon_st_sink_data ,
			avalon_sink_channel => avalon_st_sink_channel (0) ,
			avalon_sink_valid => avalon_st_sink_valid ,
			data_left => left_data_sink ,
			data_right => right_data_sink
		);
	left_pitchshiftsystem : component combfiltersystem
		port map (
			clk => clk ,
			reset => reset ,
			clk_enable => '1',
			audioin => left_data_sink ,
			delaym => delaym ,
			b0 => b0 ,
			bm => bm ,
			wetdrymix => wetdrymix ,
			ce_out => open ,
			audioout => left_data_source
			);
			
	ENTITY pitchShift IS
	  PORT( clk                               :   IN    std_logic;
			  reset                             :   IN    std_logic;
			  clk_enable                        :   IN    std_logic;
			  AudioIn                           :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
			  ce_out                            :   OUT   std_logic;
			  PitchShiftOut                     :   OUT   std_logic_vector(48 DOWNTO 0)  -- sfix49_En47
			  );
	END pitchShift;
			
	u_lr2ast : component lr2ast
		port map (
			clk => clk ,
			avalon_sink_channel => avalon_st_sink_channel (0) ,
			avalon_sink_valid => avalon_st_sink_valid ,
			data_left => left_data_source ,
			data_right => right_data_source ,
			avalon_source_data => avalon_st_source_data ,
			avalon_source_channel => avalon_st_source_channel (0) ,
			avalon_source_valid => avalon_st_source_valid
			);
			
	--  - uint16 - default value = "00000000110101110100" =~ 3444 (0.840820312500000)
	signal delta1 : std_logic_vector (16 downto 0) := "00000000110101110100";
	-- b0 - sfix16_En16 - default value = "00000000101101010000" =~ 2896 (0.707031250000000)
	signal delta2 : std_logic_vector (16 downto 0) := "00000000101101010000";
	-- bm - sfix16_En16 - default value = "0111111111111111" =
	signal enable : std_logic_vector (0 downto 0) := "1";

	begin
	bus_write : process (clk , reset) is
		begin
			if reset = '1' then
				delaym <= "0101110111000000"; -- 24000
				b0 <= "0111111111111111"; -- ~0.5
				bm <= "0111111111111111"; -- ~0.5
				wetdrymix <= "1111111111111111"; -- ~1
			elsif rising_edge (clk) and avalon_mm_write = '1' then
				case avalon_mm_address is
					when "00" =>
						delta1 <= std_logic_vector (resize( unsigned(avalon_mm_writedata ), 32));
					when "01" =>
						delta2 <= std_logic_vector (resize(signed(avalon_mm_writedata ), 32));
					when "10" =>
						enable <= std_logic_vector (resize(signed(avalon_mm_writedata ), 32));
					when others =>
						null;
				end case;
			end if;
		end process bus_write ;
	bus_read : process (clk) is
		begin
			if rising_edge (clk) and avalon_mm_read = '1' then
				case avalon_mm_address is
					when "00" =>
						avalon_mm_readdata <= std_logic_vector (resize(unsigned(delta1), 32));
					when "01" =>
						avalon_mm_readdata <= std_logic_vector (resize(signed(delta2), 32));
					when "10" =>
						avalon_mm_readdata <= std_logic_vector (resize(signed(enable), 32));
					when others =>
						avalon_mm_readdata <= (others => '0');
				end case;
			end if;
			end process bus_read;
end architecture pitchshiftprocessor_arch;
