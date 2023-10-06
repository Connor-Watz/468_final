	component soc_system_passthrough is
		port (
			ad1939_physical_asdata2         : in    std_logic                     := 'X';             -- asdata2
			ad1939_physical_dsdata1         : out   std_logic;                                        -- dsdata1
			ad1939_physical_dbclk           : out   std_logic;                                        -- dbclk
			ad1939_physical_dlrclk          : out   std_logic;                                        -- dlrclk
			ad1939_physical_abclk_clk       : in    std_logic                     := 'X';             -- clk
			ad1939_physical_alrclk_clk      : in    std_logic                     := 'X';             -- clk
			ad1939_physical_mclk_clk        : in    std_logic                     := 'X';             -- clk
			audio_mini_leds_export          : out   std_logic_vector(3 downto 0);                     -- export
			fabric_reset_reset              : in    std_logic                     := 'X';             -- reset
			hps_and_fabric_reset_reset      : in    std_logic                     := 'X';             -- reset
			hps_clk_clk                     : in    std_logic                     := 'X';             -- clk
			hps_i2c0_out_data               : out   std_logic;                                        -- out_data
			hps_i2c0_sda                    : in    std_logic                     := 'X';             -- sda
			hps_i2c0_clk_clk                : out   std_logic;                                        -- clk
			hps_i2c0_scl_in_clk             : in    std_logic                     := 'X';             -- clk
			hps_io_hps_io_emac1_inst_TX_CLK : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0   : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1   : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2   : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3   : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO   : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC    : out   std_logic;                                        -- hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
			hps_io_hps_io_sdio_inst_CMD     : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK     : out   std_logic;                                        -- hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK     : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP     : out   std_logic;                                        -- hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR     : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT     : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
			hps_io_hps_io_spim1_inst_CLK    : out   std_logic;                                        -- hps_io_spim1_inst_CLK
			hps_io_hps_io_spim1_inst_MOSI   : out   std_logic;                                        -- hps_io_spim1_inst_MOSI
			hps_io_hps_io_spim1_inst_MISO   : in    std_logic                     := 'X';             -- hps_io_spim1_inst_MISO
			hps_io_hps_io_spim1_inst_SS0    : out   std_logic;                                        -- hps_io_spim1_inst_SS0
			hps_io_hps_io_uart0_inst_RX     : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
			hps_io_hps_io_uart0_inst_TX     : out   std_logic;                                        -- hps_io_uart0_inst_TX
			hps_io_hps_io_i2c1_inst_SDA     : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SDA
			hps_io_hps_io_i2c1_inst_SCL     : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SCL
			hps_io_hps_io_gpio_inst_GPIO09  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO09
			hps_io_hps_io_gpio_inst_GPIO35  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO35
			hps_io_hps_io_gpio_inst_GPIO40  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO40
			hps_io_hps_io_gpio_inst_GPIO53  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO53
			hps_io_hps_io_gpio_inst_GPIO54  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO54
			hps_io_hps_io_gpio_inst_GPIO61  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO61
			hps_spim0_txd                   : out   std_logic;                                        -- txd
			hps_spim0_rxd                   : in    std_logic                     := 'X';             -- rxd
			hps_spim0_ss_in_n               : in    std_logic                     := 'X';             -- ss_in_n
			hps_spim0_ssi_oe_n              : out   std_logic;                                        -- ssi_oe_n
			hps_spim0_ss_0_n                : out   std_logic;                                        -- ss_0_n
			hps_spim0_ss_1_n                : out   std_logic;                                        -- ss_1_n
			hps_spim0_ss_2_n                : out   std_logic;                                        -- ss_2_n
			hps_spim0_ss_3_n                : out   std_logic;                                        -- ss_3_n
			hps_spim0_sclk_out_clk          : out   std_logic;                                        -- clk
			memory_mem_a                    : out   std_logic_vector(14 downto 0);                    -- mem_a
			memory_mem_ba                   : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck                   : out   std_logic;                                        -- mem_ck
			memory_mem_ck_n                 : out   std_logic;                                        -- mem_ck_n
			memory_mem_cke                  : out   std_logic;                                        -- mem_cke
			memory_mem_cs_n                 : out   std_logic;                                        -- mem_cs_n
			memory_mem_ras_n                : out   std_logic;                                        -- mem_ras_n
			memory_mem_cas_n                : out   std_logic;                                        -- mem_cas_n
			memory_mem_we_n                 : out   std_logic;                                        -- mem_we_n
			memory_mem_reset_n              : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq                   : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs                  : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n                : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			memory_mem_odt                  : out   std_logic;                                        -- mem_odt
			memory_mem_dm                   : out   std_logic_vector(3 downto 0);                     -- mem_dm
			memory_oct_rzqin                : in    std_logic                     := 'X'              -- oct_rzqin
		);
	end component soc_system_passthrough;

	u0 : component soc_system_passthrough
		port map (
			ad1939_physical_asdata2         => CONNECTED_TO_ad1939_physical_asdata2,         --        ad1939_physical.asdata2
			ad1939_physical_dsdata1         => CONNECTED_TO_ad1939_physical_dsdata1,         --                       .dsdata1
			ad1939_physical_dbclk           => CONNECTED_TO_ad1939_physical_dbclk,           --                       .dbclk
			ad1939_physical_dlrclk          => CONNECTED_TO_ad1939_physical_dlrclk,          --                       .dlrclk
			ad1939_physical_abclk_clk       => CONNECTED_TO_ad1939_physical_abclk_clk,       --  ad1939_physical_abclk.clk
			ad1939_physical_alrclk_clk      => CONNECTED_TO_ad1939_physical_alrclk_clk,      -- ad1939_physical_alrclk.clk
			ad1939_physical_mclk_clk        => CONNECTED_TO_ad1939_physical_mclk_clk,        --   ad1939_physical_mclk.clk
			audio_mini_leds_export          => CONNECTED_TO_audio_mini_leds_export,          --        audio_mini_leds.export
			fabric_reset_reset              => CONNECTED_TO_fabric_reset_reset,              --           fabric_reset.reset
			hps_and_fabric_reset_reset      => CONNECTED_TO_hps_and_fabric_reset_reset,      --   hps_and_fabric_reset.reset
			hps_clk_clk                     => CONNECTED_TO_hps_clk_clk,                     --                hps_clk.clk
			hps_i2c0_out_data               => CONNECTED_TO_hps_i2c0_out_data,               --               hps_i2c0.out_data
			hps_i2c0_sda                    => CONNECTED_TO_hps_i2c0_sda,                    --                       .sda
			hps_i2c0_clk_clk                => CONNECTED_TO_hps_i2c0_clk_clk,                --           hps_i2c0_clk.clk
			hps_i2c0_scl_in_clk             => CONNECTED_TO_hps_i2c0_scl_in_clk,             --        hps_i2c0_scl_in.clk
			hps_io_hps_io_emac1_inst_TX_CLK => CONNECTED_TO_hps_io_hps_io_emac1_inst_TX_CLK, --                 hps_io.hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0   => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD0,   --                       .hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1   => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD1,   --                       .hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2   => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD2,   --                       .hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3   => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD3,   --                       .hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0   => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD0,   --                       .hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO   => CONNECTED_TO_hps_io_hps_io_emac1_inst_MDIO,   --                       .hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC    => CONNECTED_TO_hps_io_hps_io_emac1_inst_MDC,    --                       .hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL => CONNECTED_TO_hps_io_hps_io_emac1_inst_RX_CTL, --                       .hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL => CONNECTED_TO_hps_io_hps_io_emac1_inst_TX_CTL, --                       .hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK => CONNECTED_TO_hps_io_hps_io_emac1_inst_RX_CLK, --                       .hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1   => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD1,   --                       .hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2   => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD2,   --                       .hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3   => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD3,   --                       .hps_io_emac1_inst_RXD3
			hps_io_hps_io_sdio_inst_CMD     => CONNECTED_TO_hps_io_hps_io_sdio_inst_CMD,     --                       .hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0      => CONNECTED_TO_hps_io_hps_io_sdio_inst_D0,      --                       .hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1      => CONNECTED_TO_hps_io_hps_io_sdio_inst_D1,      --                       .hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK     => CONNECTED_TO_hps_io_hps_io_sdio_inst_CLK,     --                       .hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2      => CONNECTED_TO_hps_io_hps_io_sdio_inst_D2,      --                       .hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3      => CONNECTED_TO_hps_io_hps_io_sdio_inst_D3,      --                       .hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D0,      --                       .hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D1,      --                       .hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D2,      --                       .hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D3,      --                       .hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D4,      --                       .hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D5,      --                       .hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D6,      --                       .hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D7,      --                       .hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK     => CONNECTED_TO_hps_io_hps_io_usb1_inst_CLK,     --                       .hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP     => CONNECTED_TO_hps_io_hps_io_usb1_inst_STP,     --                       .hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR     => CONNECTED_TO_hps_io_hps_io_usb1_inst_DIR,     --                       .hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT     => CONNECTED_TO_hps_io_hps_io_usb1_inst_NXT,     --                       .hps_io_usb1_inst_NXT
			hps_io_hps_io_spim1_inst_CLK    => CONNECTED_TO_hps_io_hps_io_spim1_inst_CLK,    --                       .hps_io_spim1_inst_CLK
			hps_io_hps_io_spim1_inst_MOSI   => CONNECTED_TO_hps_io_hps_io_spim1_inst_MOSI,   --                       .hps_io_spim1_inst_MOSI
			hps_io_hps_io_spim1_inst_MISO   => CONNECTED_TO_hps_io_hps_io_spim1_inst_MISO,   --                       .hps_io_spim1_inst_MISO
			hps_io_hps_io_spim1_inst_SS0    => CONNECTED_TO_hps_io_hps_io_spim1_inst_SS0,    --                       .hps_io_spim1_inst_SS0
			hps_io_hps_io_uart0_inst_RX     => CONNECTED_TO_hps_io_hps_io_uart0_inst_RX,     --                       .hps_io_uart0_inst_RX
			hps_io_hps_io_uart0_inst_TX     => CONNECTED_TO_hps_io_hps_io_uart0_inst_TX,     --                       .hps_io_uart0_inst_TX
			hps_io_hps_io_i2c1_inst_SDA     => CONNECTED_TO_hps_io_hps_io_i2c1_inst_SDA,     --                       .hps_io_i2c1_inst_SDA
			hps_io_hps_io_i2c1_inst_SCL     => CONNECTED_TO_hps_io_hps_io_i2c1_inst_SCL,     --                       .hps_io_i2c1_inst_SCL
			hps_io_hps_io_gpio_inst_GPIO09  => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO09,  --                       .hps_io_gpio_inst_GPIO09
			hps_io_hps_io_gpio_inst_GPIO35  => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO35,  --                       .hps_io_gpio_inst_GPIO35
			hps_io_hps_io_gpio_inst_GPIO40  => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO40,  --                       .hps_io_gpio_inst_GPIO40
			hps_io_hps_io_gpio_inst_GPIO53  => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO53,  --                       .hps_io_gpio_inst_GPIO53
			hps_io_hps_io_gpio_inst_GPIO54  => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO54,  --                       .hps_io_gpio_inst_GPIO54
			hps_io_hps_io_gpio_inst_GPIO61  => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO61,  --                       .hps_io_gpio_inst_GPIO61
			hps_spim0_txd                   => CONNECTED_TO_hps_spim0_txd,                   --              hps_spim0.txd
			hps_spim0_rxd                   => CONNECTED_TO_hps_spim0_rxd,                   --                       .rxd
			hps_spim0_ss_in_n               => CONNECTED_TO_hps_spim0_ss_in_n,               --                       .ss_in_n
			hps_spim0_ssi_oe_n              => CONNECTED_TO_hps_spim0_ssi_oe_n,              --                       .ssi_oe_n
			hps_spim0_ss_0_n                => CONNECTED_TO_hps_spim0_ss_0_n,                --                       .ss_0_n
			hps_spim0_ss_1_n                => CONNECTED_TO_hps_spim0_ss_1_n,                --                       .ss_1_n
			hps_spim0_ss_2_n                => CONNECTED_TO_hps_spim0_ss_2_n,                --                       .ss_2_n
			hps_spim0_ss_3_n                => CONNECTED_TO_hps_spim0_ss_3_n,                --                       .ss_3_n
			hps_spim0_sclk_out_clk          => CONNECTED_TO_hps_spim0_sclk_out_clk,          --     hps_spim0_sclk_out.clk
			memory_mem_a                    => CONNECTED_TO_memory_mem_a,                    --                 memory.mem_a
			memory_mem_ba                   => CONNECTED_TO_memory_mem_ba,                   --                       .mem_ba
			memory_mem_ck                   => CONNECTED_TO_memory_mem_ck,                   --                       .mem_ck
			memory_mem_ck_n                 => CONNECTED_TO_memory_mem_ck_n,                 --                       .mem_ck_n
			memory_mem_cke                  => CONNECTED_TO_memory_mem_cke,                  --                       .mem_cke
			memory_mem_cs_n                 => CONNECTED_TO_memory_mem_cs_n,                 --                       .mem_cs_n
			memory_mem_ras_n                => CONNECTED_TO_memory_mem_ras_n,                --                       .mem_ras_n
			memory_mem_cas_n                => CONNECTED_TO_memory_mem_cas_n,                --                       .mem_cas_n
			memory_mem_we_n                 => CONNECTED_TO_memory_mem_we_n,                 --                       .mem_we_n
			memory_mem_reset_n              => CONNECTED_TO_memory_mem_reset_n,              --                       .mem_reset_n
			memory_mem_dq                   => CONNECTED_TO_memory_mem_dq,                   --                       .mem_dq
			memory_mem_dqs                  => CONNECTED_TO_memory_mem_dqs,                  --                       .mem_dqs
			memory_mem_dqs_n                => CONNECTED_TO_memory_mem_dqs_n,                --                       .mem_dqs_n
			memory_mem_odt                  => CONNECTED_TO_memory_mem_odt,                  --                       .mem_odt
			memory_mem_dm                   => CONNECTED_TO_memory_mem_dm,                   --                       .mem_dm
			memory_oct_rzqin                => CONNECTED_TO_memory_oct_rzqin                 --                       .oct_rzqin
		);

