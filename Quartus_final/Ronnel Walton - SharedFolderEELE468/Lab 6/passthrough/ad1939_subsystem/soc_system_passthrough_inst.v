	soc_system_passthrough u0 (
		.ad1939_physical_asdata2         (<connected-to-ad1939_physical_asdata2>),         //        ad1939_physical.asdata2
		.ad1939_physical_dsdata1         (<connected-to-ad1939_physical_dsdata1>),         //                       .dsdata1
		.ad1939_physical_dbclk           (<connected-to-ad1939_physical_dbclk>),           //                       .dbclk
		.ad1939_physical_dlrclk          (<connected-to-ad1939_physical_dlrclk>),          //                       .dlrclk
		.ad1939_physical_abclk_clk       (<connected-to-ad1939_physical_abclk_clk>),       //  ad1939_physical_abclk.clk
		.ad1939_physical_alrclk_clk      (<connected-to-ad1939_physical_alrclk_clk>),      // ad1939_physical_alrclk.clk
		.ad1939_physical_mclk_clk        (<connected-to-ad1939_physical_mclk_clk>),        //   ad1939_physical_mclk.clk
		.fabric_reset_reset              (<connected-to-fabric_reset_reset>),              //           fabric_reset.reset
		.hps_and_fabric_reset_reset      (<connected-to-hps_and_fabric_reset_reset>),      //   hps_and_fabric_reset.reset
		.hps_clk_clk                     (<connected-to-hps_clk_clk>),                     //                hps_clk.clk
		.hps_i2c0_out_data               (<connected-to-hps_i2c0_out_data>),               //               hps_i2c0.out_data
		.hps_i2c0_sda                    (<connected-to-hps_i2c0_sda>),                    //                       .sda
		.hps_i2c0_clk_clk                (<connected-to-hps_i2c0_clk_clk>),                //           hps_i2c0_clk.clk
		.hps_i2c0_scl_in_clk             (<connected-to-hps_i2c0_scl_in_clk>),             //        hps_i2c0_scl_in.clk
		.hps_io_hps_io_emac1_inst_TX_CLK (<connected-to-hps_io_hps_io_emac1_inst_TX_CLK>), //                 hps_io.hps_io_emac1_inst_TX_CLK
		.hps_io_hps_io_emac1_inst_TXD0   (<connected-to-hps_io_hps_io_emac1_inst_TXD0>),   //                       .hps_io_emac1_inst_TXD0
		.hps_io_hps_io_emac1_inst_TXD1   (<connected-to-hps_io_hps_io_emac1_inst_TXD1>),   //                       .hps_io_emac1_inst_TXD1
		.hps_io_hps_io_emac1_inst_TXD2   (<connected-to-hps_io_hps_io_emac1_inst_TXD2>),   //                       .hps_io_emac1_inst_TXD2
		.hps_io_hps_io_emac1_inst_TXD3   (<connected-to-hps_io_hps_io_emac1_inst_TXD3>),   //                       .hps_io_emac1_inst_TXD3
		.hps_io_hps_io_emac1_inst_RXD0   (<connected-to-hps_io_hps_io_emac1_inst_RXD0>),   //                       .hps_io_emac1_inst_RXD0
		.hps_io_hps_io_emac1_inst_MDIO   (<connected-to-hps_io_hps_io_emac1_inst_MDIO>),   //                       .hps_io_emac1_inst_MDIO
		.hps_io_hps_io_emac1_inst_MDC    (<connected-to-hps_io_hps_io_emac1_inst_MDC>),    //                       .hps_io_emac1_inst_MDC
		.hps_io_hps_io_emac1_inst_RX_CTL (<connected-to-hps_io_hps_io_emac1_inst_RX_CTL>), //                       .hps_io_emac1_inst_RX_CTL
		.hps_io_hps_io_emac1_inst_TX_CTL (<connected-to-hps_io_hps_io_emac1_inst_TX_CTL>), //                       .hps_io_emac1_inst_TX_CTL
		.hps_io_hps_io_emac1_inst_RX_CLK (<connected-to-hps_io_hps_io_emac1_inst_RX_CLK>), //                       .hps_io_emac1_inst_RX_CLK
		.hps_io_hps_io_emac1_inst_RXD1   (<connected-to-hps_io_hps_io_emac1_inst_RXD1>),   //                       .hps_io_emac1_inst_RXD1
		.hps_io_hps_io_emac1_inst_RXD2   (<connected-to-hps_io_hps_io_emac1_inst_RXD2>),   //                       .hps_io_emac1_inst_RXD2
		.hps_io_hps_io_emac1_inst_RXD3   (<connected-to-hps_io_hps_io_emac1_inst_RXD3>),   //                       .hps_io_emac1_inst_RXD3
		.hps_io_hps_io_sdio_inst_CMD     (<connected-to-hps_io_hps_io_sdio_inst_CMD>),     //                       .hps_io_sdio_inst_CMD
		.hps_io_hps_io_sdio_inst_D0      (<connected-to-hps_io_hps_io_sdio_inst_D0>),      //                       .hps_io_sdio_inst_D0
		.hps_io_hps_io_sdio_inst_D1      (<connected-to-hps_io_hps_io_sdio_inst_D1>),      //                       .hps_io_sdio_inst_D1
		.hps_io_hps_io_sdio_inst_CLK     (<connected-to-hps_io_hps_io_sdio_inst_CLK>),     //                       .hps_io_sdio_inst_CLK
		.hps_io_hps_io_sdio_inst_D2      (<connected-to-hps_io_hps_io_sdio_inst_D2>),      //                       .hps_io_sdio_inst_D2
		.hps_io_hps_io_sdio_inst_D3      (<connected-to-hps_io_hps_io_sdio_inst_D3>),      //                       .hps_io_sdio_inst_D3
		.hps_io_hps_io_usb1_inst_D0      (<connected-to-hps_io_hps_io_usb1_inst_D0>),      //                       .hps_io_usb1_inst_D0
		.hps_io_hps_io_usb1_inst_D1      (<connected-to-hps_io_hps_io_usb1_inst_D1>),      //                       .hps_io_usb1_inst_D1
		.hps_io_hps_io_usb1_inst_D2      (<connected-to-hps_io_hps_io_usb1_inst_D2>),      //                       .hps_io_usb1_inst_D2
		.hps_io_hps_io_usb1_inst_D3      (<connected-to-hps_io_hps_io_usb1_inst_D3>),      //                       .hps_io_usb1_inst_D3
		.hps_io_hps_io_usb1_inst_D4      (<connected-to-hps_io_hps_io_usb1_inst_D4>),      //                       .hps_io_usb1_inst_D4
		.hps_io_hps_io_usb1_inst_D5      (<connected-to-hps_io_hps_io_usb1_inst_D5>),      //                       .hps_io_usb1_inst_D5
		.hps_io_hps_io_usb1_inst_D6      (<connected-to-hps_io_hps_io_usb1_inst_D6>),      //                       .hps_io_usb1_inst_D6
		.hps_io_hps_io_usb1_inst_D7      (<connected-to-hps_io_hps_io_usb1_inst_D7>),      //                       .hps_io_usb1_inst_D7
		.hps_io_hps_io_usb1_inst_CLK     (<connected-to-hps_io_hps_io_usb1_inst_CLK>),     //                       .hps_io_usb1_inst_CLK
		.hps_io_hps_io_usb1_inst_STP     (<connected-to-hps_io_hps_io_usb1_inst_STP>),     //                       .hps_io_usb1_inst_STP
		.hps_io_hps_io_usb1_inst_DIR     (<connected-to-hps_io_hps_io_usb1_inst_DIR>),     //                       .hps_io_usb1_inst_DIR
		.hps_io_hps_io_usb1_inst_NXT     (<connected-to-hps_io_hps_io_usb1_inst_NXT>),     //                       .hps_io_usb1_inst_NXT
		.hps_io_hps_io_spim1_inst_CLK    (<connected-to-hps_io_hps_io_spim1_inst_CLK>),    //                       .hps_io_spim1_inst_CLK
		.hps_io_hps_io_spim1_inst_MOSI   (<connected-to-hps_io_hps_io_spim1_inst_MOSI>),   //                       .hps_io_spim1_inst_MOSI
		.hps_io_hps_io_spim1_inst_MISO   (<connected-to-hps_io_hps_io_spim1_inst_MISO>),   //                       .hps_io_spim1_inst_MISO
		.hps_io_hps_io_spim1_inst_SS0    (<connected-to-hps_io_hps_io_spim1_inst_SS0>),    //                       .hps_io_spim1_inst_SS0
		.hps_io_hps_io_uart0_inst_RX     (<connected-to-hps_io_hps_io_uart0_inst_RX>),     //                       .hps_io_uart0_inst_RX
		.hps_io_hps_io_uart0_inst_TX     (<connected-to-hps_io_hps_io_uart0_inst_TX>),     //                       .hps_io_uart0_inst_TX
		.hps_io_hps_io_i2c1_inst_SDA     (<connected-to-hps_io_hps_io_i2c1_inst_SDA>),     //                       .hps_io_i2c1_inst_SDA
		.hps_io_hps_io_i2c1_inst_SCL     (<connected-to-hps_io_hps_io_i2c1_inst_SCL>),     //                       .hps_io_i2c1_inst_SCL
		.hps_io_hps_io_gpio_inst_GPIO09  (<connected-to-hps_io_hps_io_gpio_inst_GPIO09>),  //                       .hps_io_gpio_inst_GPIO09
		.hps_io_hps_io_gpio_inst_GPIO35  (<connected-to-hps_io_hps_io_gpio_inst_GPIO35>),  //                       .hps_io_gpio_inst_GPIO35
		.hps_io_hps_io_gpio_inst_GPIO40  (<connected-to-hps_io_hps_io_gpio_inst_GPIO40>),  //                       .hps_io_gpio_inst_GPIO40
		.hps_io_hps_io_gpio_inst_GPIO53  (<connected-to-hps_io_hps_io_gpio_inst_GPIO53>),  //                       .hps_io_gpio_inst_GPIO53
		.hps_io_hps_io_gpio_inst_GPIO54  (<connected-to-hps_io_hps_io_gpio_inst_GPIO54>),  //                       .hps_io_gpio_inst_GPIO54
		.hps_io_hps_io_gpio_inst_GPIO61  (<connected-to-hps_io_hps_io_gpio_inst_GPIO61>),  //                       .hps_io_gpio_inst_GPIO61
		.hps_spim0_txd                   (<connected-to-hps_spim0_txd>),                   //              hps_spim0.txd
		.hps_spim0_rxd                   (<connected-to-hps_spim0_rxd>),                   //                       .rxd
		.hps_spim0_ss_in_n               (<connected-to-hps_spim0_ss_in_n>),               //                       .ss_in_n
		.hps_spim0_ssi_oe_n              (<connected-to-hps_spim0_ssi_oe_n>),              //                       .ssi_oe_n
		.hps_spim0_ss_0_n                (<connected-to-hps_spim0_ss_0_n>),                //                       .ss_0_n
		.hps_spim0_ss_1_n                (<connected-to-hps_spim0_ss_1_n>),                //                       .ss_1_n
		.hps_spim0_ss_2_n                (<connected-to-hps_spim0_ss_2_n>),                //                       .ss_2_n
		.hps_spim0_ss_3_n                (<connected-to-hps_spim0_ss_3_n>),                //                       .ss_3_n
		.hps_spim0_sclk_out_clk          (<connected-to-hps_spim0_sclk_out_clk>),          //     hps_spim0_sclk_out.clk
		.memory_mem_a                    (<connected-to-memory_mem_a>),                    //                 memory.mem_a
		.memory_mem_ba                   (<connected-to-memory_mem_ba>),                   //                       .mem_ba
		.memory_mem_ck                   (<connected-to-memory_mem_ck>),                   //                       .mem_ck
		.memory_mem_ck_n                 (<connected-to-memory_mem_ck_n>),                 //                       .mem_ck_n
		.memory_mem_cke                  (<connected-to-memory_mem_cke>),                  //                       .mem_cke
		.memory_mem_cs_n                 (<connected-to-memory_mem_cs_n>),                 //                       .mem_cs_n
		.memory_mem_ras_n                (<connected-to-memory_mem_ras_n>),                //                       .mem_ras_n
		.memory_mem_cas_n                (<connected-to-memory_mem_cas_n>),                //                       .mem_cas_n
		.memory_mem_we_n                 (<connected-to-memory_mem_we_n>),                 //                       .mem_we_n
		.memory_mem_reset_n              (<connected-to-memory_mem_reset_n>),              //                       .mem_reset_n
		.memory_mem_dq                   (<connected-to-memory_mem_dq>),                   //                       .mem_dq
		.memory_mem_dqs                  (<connected-to-memory_mem_dqs>),                  //                       .mem_dqs
		.memory_mem_dqs_n                (<connected-to-memory_mem_dqs_n>),                //                       .mem_dqs_n
		.memory_mem_odt                  (<connected-to-memory_mem_odt>),                  //                       .mem_odt
		.memory_mem_dm                   (<connected-to-memory_mem_dm>),                   //                       .mem_dm
		.memory_oct_rzqin                (<connected-to-memory_oct_rzqin>)                 //                       .oct_rzqin
	);

