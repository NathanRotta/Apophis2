// hps_sdram.v

// This file was auto-generated from altera_mem_if_hps_emif_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 20.1 711

`timescale 1 ps / 1 ps
module hps_sdram (
		input  wire        pll_ref_clk,    //  pll_ref_clk.clk
		input  wire        global_reset_n, // global_reset.reset_n
		input  wire        soft_reset_n,   //   soft_reset.reset_n
		output wire [14:0] mem_a,          //       memory.mem_a
		output wire [2:0]  mem_ba,         //             .mem_ba
		output wire [0:0]  mem_ck,         //             .mem_ck
		output wire [0:0]  mem_ck_n,       //             .mem_ck_n
		output wire [0:0]  mem_cke,        //             .mem_cke
		output wire [0:0]  mem_cs_n,       //             .mem_cs_n
		output wire [3:0]  mem_dm,         //             .mem_dm
		output wire [0:0]  mem_ras_n,      //             .mem_ras_n
		output wire [0:0]  mem_cas_n,      //             .mem_cas_n
		output wire [0:0]  mem_we_n,       //             .mem_we_n
		output wire        mem_reset_n,    //             .mem_reset_n
		inout  wire [31:0] mem_dq,         //             .mem_dq
		inout  wire [3:0]  mem_dqs,        //             .mem_dqs
		inout  wire [3:0]  mem_dqs_n,      //             .mem_dqs_n
		output wire [0:0]  mem_odt,        //             .mem_odt
		input  wire        oct_rzqin       //          oct.rzqin
	);

	wire         pll_afi_clk_clk;                            // pll:afi_clk -> [c0:afi_clk, p0:afi_clk]
	wire         pll_afi_half_clk_clk;                       // pll:afi_half_clk -> [c0:afi_half_clk, p0:afi_half_clk]
	wire   [4:0] p0_afi_afi_rlat;                            // p0:afi_rlat -> c0:afi_rlat
	wire         p0_afi_afi_cal_success;                     // p0:afi_cal_success -> c0:afi_cal_success
	wire  [79:0] p0_afi_afi_rdata;                           // p0:afi_rdata -> c0:afi_rdata
	wire   [3:0] p0_afi_afi_wlat;                            // p0:afi_wlat -> c0:afi_wlat
	wire         p0_afi_afi_cal_fail;                        // p0:afi_cal_fail -> c0:afi_cal_fail
	wire   [0:0] p0_afi_afi_rdata_valid;                     // p0:afi_rdata_valid -> c0:afi_rdata_valid
	wire         p0_afi_reset_reset;                         // p0:afi_reset_n -> c0:afi_reset_n
	wire   [4:0] c0_afi_afi_rdata_en_full;                   // c0:afi_rdata_en_full -> p0:afi_rdata_en_full
	wire   [0:0] c0_afi_afi_rst_n;                           // c0:afi_rst_n -> p0:afi_rst_n
	wire   [4:0] c0_afi_afi_dqs_burst;                       // c0:afi_dqs_burst -> p0:afi_dqs_burst
	wire  [19:0] c0_afi_afi_addr;                            // c0:afi_addr -> p0:afi_addr
	wire   [9:0] c0_afi_afi_dm;                              // c0:afi_dm -> p0:afi_dm
	wire   [0:0] c0_afi_afi_mem_clk_disable;                 // c0:afi_mem_clk_disable -> p0:afi_mem_clk_disable
	wire   [0:0] c0_afi_afi_we_n;                            // c0:afi_we_n -> p0:afi_we_n
	wire   [4:0] c0_afi_afi_rdata_en;                        // c0:afi_rdata_en -> p0:afi_rdata_en
	wire   [1:0] c0_afi_afi_odt;                             // c0:afi_odt -> p0:afi_odt
	wire   [0:0] c0_afi_afi_ras_n;                           // c0:afi_ras_n -> p0:afi_ras_n
	wire   [1:0] c0_afi_afi_cke;                             // c0:afi_cke -> p0:afi_cke
	wire   [4:0] c0_afi_afi_wdata_valid;                     // c0:afi_wdata_valid -> p0:afi_wdata_valid
	wire  [79:0] c0_afi_afi_wdata;                           // c0:afi_wdata -> p0:afi_wdata
	wire   [2:0] c0_afi_afi_ba;                              // c0:afi_ba -> p0:afi_ba
	wire   [0:0] c0_afi_afi_cas_n;                           // c0:afi_cas_n -> p0:afi_cas_n
	wire   [1:0] c0_afi_afi_cs_n;                            // c0:afi_cs_n -> p0:afi_cs_n
	wire   [7:0] c0_hard_phy_cfg_cfg_tmrd;                   // c0:cfg_tmrd -> p0:cfg_tmrd
	wire  [23:0] c0_hard_phy_cfg_cfg_dramconfig;             // c0:cfg_dramconfig -> p0:cfg_dramconfig
	wire   [7:0] c0_hard_phy_cfg_cfg_rowaddrwidth;           // c0:cfg_rowaddrwidth -> p0:cfg_rowaddrwidth
	wire   [7:0] c0_hard_phy_cfg_cfg_devicewidth;            // c0:cfg_devicewidth -> p0:cfg_devicewidth
	wire  [15:0] c0_hard_phy_cfg_cfg_trefi;                  // c0:cfg_trefi -> p0:cfg_trefi
	wire   [7:0] c0_hard_phy_cfg_cfg_tcl;                    // c0:cfg_tcl -> p0:cfg_tcl
	wire   [7:0] c0_hard_phy_cfg_cfg_csaddrwidth;            // c0:cfg_csaddrwidth -> p0:cfg_csaddrwidth
	wire   [7:0] c0_hard_phy_cfg_cfg_coladdrwidth;           // c0:cfg_coladdrwidth -> p0:cfg_coladdrwidth
	wire   [7:0] c0_hard_phy_cfg_cfg_trfc;                   // c0:cfg_trfc -> p0:cfg_trfc
	wire   [7:0] c0_hard_phy_cfg_cfg_addlat;                 // c0:cfg_addlat -> p0:cfg_addlat
	wire   [7:0] c0_hard_phy_cfg_cfg_bankaddrwidth;          // c0:cfg_bankaddrwidth -> p0:cfg_bankaddrwidth
	wire   [7:0] c0_hard_phy_cfg_cfg_interfacewidth;         // c0:cfg_interfacewidth -> p0:cfg_interfacewidth
	wire   [7:0] c0_hard_phy_cfg_cfg_twr;                    // c0:cfg_twr -> p0:cfg_twr
	wire   [7:0] c0_hard_phy_cfg_cfg_caswrlat;               // c0:cfg_caswrlat -> p0:cfg_caswrlat
	wire         p0_ctl_clk_clk;                             // p0:ctl_clk -> c0:ctl_clk
	wire         p0_ctl_reset_reset;                         // p0:ctl_reset_n -> c0:ctl_reset_n
	wire         p0_io_int_io_intaficalfail;                 // p0:io_intaficalfail -> c0:io_intaficalfail
	wire         p0_io_int_io_intaficalsuccess;              // p0:io_intaficalsuccess -> c0:io_intaficalsuccess
	wire  [15:0] oct_oct_sharing_parallelterminationcontrol; // oct:parallelterminationcontrol -> p0:parallelterminationcontrol
	wire  [15:0] oct_oct_sharing_seriesterminationcontrol;   // oct:seriesterminationcontrol -> p0:seriesterminationcontrol
	wire         pll_pll_sharing_pll_write_clk;              // pll:pll_write_clk -> p0:pll_write_clk
	wire         pll_pll_sharing_pll_avl_clk;                // pll:pll_avl_clk -> p0:pll_avl_clk
	wire         pll_pll_sharing_pll_write_clk_pre_phy_clk;  // pll:pll_write_clk_pre_phy_clk -> p0:pll_write_clk_pre_phy_clk
	wire         pll_pll_sharing_pll_addr_cmd_clk;           // pll:pll_addr_cmd_clk -> p0:pll_addr_cmd_clk
	wire         pll_pll_sharing_pll_config_clk;             // pll:pll_config_clk -> p0:pll_config_clk
	wire         pll_pll_sharing_pll_avl_phy_clk;            // pll:pll_avl_phy_clk -> p0:pll_avl_phy_clk
	wire         pll_pll_sharing_afi_phy_clk;                // pll:afi_phy_clk -> p0:afi_phy_clk
	wire         pll_pll_sharing_pll_mem_clk;                // pll:pll_mem_clk -> p0:pll_mem_clk
	wire         pll_pll_sharing_pll_locked;                 // pll:pll_locked -> p0:pll_locked
	wire         pll_pll_sharing_pll_mem_phy_clk;            // pll:pll_mem_phy_clk -> p0:pll_mem_phy_clk
	wire         p0_dll_clk_clk;                             // p0:dll_clk -> dll:clk
	wire         p0_dll_sharing_dll_pll_locked;              // p0:dll_pll_locked -> dll:dll_pll_locked
	wire   [6:0] dll_dll_sharing_dll_delayctrl;              // dll:dll_delayctrl -> p0:dll_delayctrl

	hps_sdram_pll pll (
		.global_reset_n            (global_reset_n),                            // global_reset.reset_n
		.pll_ref_clk               (pll_ref_clk),                               //  pll_ref_clk.clk
		.afi_clk                   (pll_afi_clk_clk),                           //      afi_clk.clk
		.afi_half_clk              (pll_afi_half_clk_clk),                      // afi_half_clk.clk
		.pll_mem_clk               (pll_pll_sharing_pll_mem_clk),               //  pll_sharing.pll_mem_clk
		.pll_write_clk             (pll_pll_sharing_pll_write_clk),             //             .pll_write_clk
		.pll_locked                (pll_pll_sharing_pll_locked),                //             .pll_locked
		.pll_write_clk_pre_phy_clk (pll_pll_sharing_pll_write_clk_pre_phy_clk), //             .pll_write_clk_pre_phy_clk
		.pll_addr_cmd_clk          (pll_pll_sharing_pll_addr_cmd_clk),          //             .pll_addr_cmd_clk
		.pll_avl_clk               (pll_pll_sharing_pll_avl_clk),               //             .pll_avl_clk
		.pll_config_clk            (pll_pll_sharing_pll_config_clk),            //             .pll_config_clk
		.pll_mem_phy_clk           (pll_pll_sharing_pll_mem_phy_clk),           //             .pll_mem_phy_clk
		.afi_phy_clk               (pll_pll_sharing_afi_phy_clk),               //             .afi_phy_clk
		.pll_avl_phy_clk           (pll_pll_sharing_pll_avl_phy_clk)            //             .pll_avl_phy_clk
	);

	hps_sdram_p0 p0 (
		.global_reset_n             (global_reset_n),                                                                                                                                                                            //        global_reset.reset_n
		.soft_reset_n               (soft_reset_n),                                                                                                                                                                              //          soft_reset.reset_n
		.afi_reset_n                (p0_afi_reset_reset),                                                                                                                                                                        //           afi_reset.reset_n
		.afi_reset_export_n         (),                                                                                                                                                                                          //    afi_reset_export.reset_n
		.ctl_reset_n                (p0_ctl_reset_reset),                                                                                                                                                                        //           ctl_reset.reset_n
		.afi_clk                    (pll_afi_clk_clk),                                                                                                                                                                           //             afi_clk.clk
		.afi_half_clk               (pll_afi_half_clk_clk),                                                                                                                                                                      //        afi_half_clk.clk
		.ctl_clk                    (p0_ctl_clk_clk),                                                                                                                                                                            //             ctl_clk.clk
		.avl_clk                    (),                                                                                                                                                                                          //             avl_clk.clk
		.avl_reset_n                (),                                                                                                                                                                                          //           avl_reset.reset_n
		.scc_clk                    (),                                                                                                                                                                                          //             scc_clk.clk
		.scc_reset_n                (),                                                                                                                                                                                          //           scc_reset.reset_n
		.avl_address                (),                                                                                                                                                                                          //                 avl.address
		.avl_write                  (),                                                                                                                                                                                          //                    .write
		.avl_writedata              (),                                                                                                                                                                                          //                    .writedata
		.avl_read                   (),                                                                                                                                                                                          //                    .read
		.avl_readdata               (),                                                                                                                                                                                          //                    .readdata
		.avl_waitrequest            (),                                                                                                                                                                                          //                    .waitrequest
		.dll_clk                    (p0_dll_clk_clk),                                                                                                                                                                            //             dll_clk.clk
		.afi_addr                   (c0_afi_afi_addr),                                                                                                                                                                           //                 afi.afi_addr
		.afi_ba                     (c0_afi_afi_ba),                                                                                                                                                                             //                    .afi_ba
		.afi_cke                    (c0_afi_afi_cke),                                                                                                                                                                            //                    .afi_cke
		.afi_cs_n                   (c0_afi_afi_cs_n),                                                                                                                                                                           //                    .afi_cs_n
		.afi_ras_n                  (c0_afi_afi_ras_n),                                                                                                                                                                          //                    .afi_ras_n
		.afi_we_n                   (c0_afi_afi_we_n),                                                                                                                                                                           //                    .afi_we_n
		.afi_cas_n                  (c0_afi_afi_cas_n),                                                                                                                                                                          //                    .afi_cas_n
		.afi_rst_n                  (c0_afi_afi_rst_n),                                                                                                                                                                          //                    .afi_rst_n
		.afi_odt                    (c0_afi_afi_odt),                                                                                                                                                                            //                    .afi_odt
		.afi_dqs_burst              (c0_afi_afi_dqs_burst),                                                                                                                                                                      //                    .afi_dqs_burst
		.afi_wdata_valid            (c0_afi_afi_wdata_valid),                                                                                                                                                                    //                    .afi_wdata_valid
		.afi_wdata                  (c0_afi_afi_wdata),                                                                                                                                                                          //                    .afi_wdata
		.afi_dm                     (c0_afi_afi_dm),                                                                                                                                                                             //                    .afi_dm
		.afi_rdata                  (p0_afi_afi_rdata),                                                                                                                                                                          //                    .afi_rdata
		.afi_rdata_en               (c0_afi_afi_rdata_en),                                                                                                                                                                       //                    .afi_rdata_en
		.afi_rdata_en_full          (c0_afi_afi_rdata_en_full),                                                                                                                                                                  //                    .afi_rdata_en_full
		.afi_rdata_valid            (p0_afi_afi_rdata_valid),                                                                                                                                                                    //                    .afi_rdata_valid
		.afi_wlat                   (p0_afi_afi_wlat),                                                                                                                                                                           //                    .afi_wlat
		.afi_rlat                   (p0_afi_afi_rlat),                                                                                                                                                                           //                    .afi_rlat
		.afi_cal_success            (p0_afi_afi_cal_success),                                                                                                                                                                    //                    .afi_cal_success
		.afi_cal_fail               (p0_afi_afi_cal_fail),                                                                                                                                                                       //                    .afi_cal_fail
		.scc_data                   (),                                                                                                                                                                                          //                 scc.scc_data
		.scc_dqs_ena                (),                                                                                                                                                                                          //                    .scc_dqs_ena
		.scc_dqs_io_ena             (),                                                                                                                                                                                          //                    .scc_dqs_io_ena
		.scc_dq_ena                 (),                                                                                                                                                                                          //                    .scc_dq_ena
		.scc_dm_ena                 (),                                                                                                                                                                                          //                    .scc_dm_ena
		.capture_strobe_tracking    (),                                                                                                                                                                                          //                    .capture_strobe_tracking
		.scc_upd                    (),                                                                                                                                                                                          //                    .scc_upd
		.cfg_addlat                 (c0_hard_phy_cfg_cfg_addlat),                                                                                                                                                                //        hard_phy_cfg.cfg_addlat
		.cfg_bankaddrwidth          (c0_hard_phy_cfg_cfg_bankaddrwidth),                                                                                                                                                         //                    .cfg_bankaddrwidth
		.cfg_caswrlat               (c0_hard_phy_cfg_cfg_caswrlat),                                                                                                                                                              //                    .cfg_caswrlat
		.cfg_coladdrwidth           (c0_hard_phy_cfg_cfg_coladdrwidth),                                                                                                                                                          //                    .cfg_coladdrwidth
		.cfg_csaddrwidth            (c0_hard_phy_cfg_cfg_csaddrwidth),                                                                                                                                                           //                    .cfg_csaddrwidth
		.cfg_devicewidth            (c0_hard_phy_cfg_cfg_devicewidth),                                                                                                                                                           //                    .cfg_devicewidth
		.cfg_dramconfig             (c0_hard_phy_cfg_cfg_dramconfig),                                                                                                                                                            //                    .cfg_dramconfig
		.cfg_interfacewidth         (c0_hard_phy_cfg_cfg_interfacewidth),                                                                                                                                                        //                    .cfg_interfacewidth
		.cfg_rowaddrwidth           (c0_hard_phy_cfg_cfg_rowaddrwidth),                                                                                                                                                          //                    .cfg_rowaddrwidth
		.cfg_tcl                    (c0_hard_phy_cfg_cfg_tcl),                                                                                                                                                                   //                    .cfg_tcl
		.cfg_tmrd                   (c0_hard_phy_cfg_cfg_tmrd),                                                                                                                                                                  //                    .cfg_tmrd
		.cfg_trefi                  (c0_hard_phy_cfg_cfg_trefi),                                                                                                                                                                 //                    .cfg_trefi
		.cfg_trfc                   (c0_hard_phy_cfg_cfg_trfc),                                                                                                                                                                  //                    .cfg_trfc
		.cfg_twr                    (c0_hard_phy_cfg_cfg_twr),                                                                                                                                                                   //                    .cfg_twr
		.afi_mem_clk_disable        (c0_afi_afi_mem_clk_disable),                                                                                                                                                                // afi_mem_clk_disable.afi_mem_clk_disable
		.pll_mem_clk                (pll_pll_sharing_pll_mem_clk),                                                                                                                                                               //         pll_sharing.pll_mem_clk
		.pll_write_clk              (pll_pll_sharing_pll_write_clk),                                                                                                                                                             //                    .pll_write_clk
		.pll_locked                 (pll_pll_sharing_pll_locked),                                                                                                                                                                //                    .pll_locked
		.pll_write_clk_pre_phy_clk  (pll_pll_sharing_pll_write_clk_pre_phy_clk),                                                                                                                                                 //                    .pll_write_clk_pre_phy_clk
		.pll_addr_cmd_clk           (pll_pll_sharing_pll_addr_cmd_clk),                                                                                                                                                          //                    .pll_addr_cmd_clk
		.pll_avl_clk                (pll_pll_sharing_pll_avl_clk),                                                                                                                                                               //                    .pll_avl_clk
		.pll_config_clk             (pll_pll_sharing_pll_config_clk),                                                                                                                                                            //                    .pll_config_clk
		.pll_mem_phy_clk            (pll_pll_sharing_pll_mem_phy_clk),                                                                                                                                                           //                    .pll_mem_phy_clk
		.afi_phy_clk                (pll_pll_sharing_afi_phy_clk),                                                                                                                                                               //                    .afi_phy_clk
		.pll_avl_phy_clk            (pll_pll_sharing_pll_avl_phy_clk),                                                                                                                                                           //                    .pll_avl_phy_clk
		.dll_pll_locked             (p0_dll_sharing_dll_pll_locked),                                                                                                                                                             //         dll_sharing.dll_pll_locked
		.dll_delayctrl              (dll_dll_sharing_dll_delayctrl),                                                                                                                                                             //                    .dll_delayctrl
		.seriesterminationcontrol   (oct_oct_sharing_seriesterminationcontrol),                                                                                                                                                  //         oct_sharing.seriesterminationcontrol
		.parallelterminationcontrol (oct_oct_sharing_parallelterminationcontrol),                                                                                                                                                //                    .parallelterminationcontrol
		.mem_a                      (mem_a),                                                                                                                                                                                     //              memory.mem_a
		.mem_ba                     (mem_ba),                                                                                                                                                                                    //                    .mem_ba
		.mem_ck                     (mem_ck),                                                                                                                                                                                    //                    .mem_ck
		.mem_ck_n                   (mem_ck_n),                                                                                                                                                                                  //                    .mem_ck_n
		.mem_cke                    (mem_cke),                                                                                                                                                                                   //                    .mem_cke
		.mem_cs_n                   (mem_cs_n),                                                                                                                                                                                  //                    .mem_cs_n
		.mem_dm                     (mem_dm),                                                                                                                                                                                    //                    .mem_dm
		.mem_ras_n                  (mem_ras_n),                                                                                                                                                                                 //                    .mem_ras_n
		.mem_cas_n                  (mem_cas_n),                                                                                                                                                                                 //                    .mem_cas_n
		.mem_we_n                   (mem_we_n),                                                                                                                                                                                  //                    .mem_we_n
		.mem_reset_n                (mem_reset_n),                                                                                                                                                                               //                    .mem_reset_n
		.mem_dq                     (mem_dq),                                                                                                                                                                                    //                    .mem_dq
		.mem_dqs                    (mem_dqs),                                                                                                                                                                                   //                    .mem_dqs
		.mem_dqs_n                  (mem_dqs_n),                                                                                                                                                                                 //                    .mem_dqs_n
		.mem_odt                    (mem_odt),                                                                                                                                                                                   //                    .mem_odt
		.io_intaficalfail           (p0_io_int_io_intaficalfail),                                                                                                                                                                //              io_int.io_intaficalfail
		.io_intaficalsuccess        (p0_io_int_io_intaficalsuccess),                                                                                                                                                             //                    .io_intaficalsuccess
		.csr_soft_reset_req         (1'b0),                                                                                                                                                                                      //         (terminated)
		.io_intaddrdout             (64'b0000000000000000000000000000000000000000000000000000000000000000),                                                                                                                      //         (terminated)
		.io_intbadout               (12'b000000000000),                                                                                                                                                                          //         (terminated)
		.io_intcasndout             (4'b0000),                                                                                                                                                                                   //         (terminated)
		.io_intckdout               (4'b0000),                                                                                                                                                                                   //         (terminated)
		.io_intckedout              (8'b00000000),                                                                                                                                                                               //         (terminated)
		.io_intckndout              (4'b0000),                                                                                                                                                                                   //         (terminated)
		.io_intcsndout              (8'b00000000),                                                                                                                                                                               //         (terminated)
		.io_intdmdout               (20'b00000000000000000000),                                                                                                                                                                  //         (terminated)
		.io_intdqdin                (),                                                                                                                                                                                          //         (terminated)
		.io_intdqdout               (180'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000), //         (terminated)
		.io_intdqoe                 (90'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000),                                                                                            //         (terminated)
		.io_intdqsbdout             (20'b00000000000000000000),                                                                                                                                                                  //         (terminated)
		.io_intdqsboe               (10'b0000000000),                                                                                                                                                                            //         (terminated)
		.io_intdqsdout              (20'b00000000000000000000),                                                                                                                                                                  //         (terminated)
		.io_intdqslogicdqsena       (10'b0000000000),                                                                                                                                                                            //         (terminated)
		.io_intdqslogicfiforeset    (5'b00000),                                                                                                                                                                                  //         (terminated)
		.io_intdqslogicincrdataen   (10'b0000000000),                                                                                                                                                                            //         (terminated)
		.io_intdqslogicincwrptr     (10'b0000000000),                                                                                                                                                                            //         (terminated)
		.io_intdqslogicoct          (10'b0000000000),                                                                                                                                                                            //         (terminated)
		.io_intdqslogicrdatavalid   (),                                                                                                                                                                                          //         (terminated)
		.io_intdqslogicreadlatency  (25'b0000000000000000000000000),                                                                                                                                                             //         (terminated)
		.io_intdqsoe                (10'b0000000000),                                                                                                                                                                            //         (terminated)
		.io_intodtdout              (8'b00000000),                                                                                                                                                                               //         (terminated)
		.io_intrasndout             (4'b0000),                                                                                                                                                                                   //         (terminated)
		.io_intresetndout           (4'b0000),                                                                                                                                                                                   //         (terminated)
		.io_intwendout              (4'b0000),                                                                                                                                                                                   //         (terminated)
		.io_intafirlat              (),                                                                                                                                                                                          //         (terminated)
		.io_intafiwlat              ()                                                                                                                                                                                           //         (terminated)
	);

	altera_mem_if_hhp_qseq_synth_top #(
		.MEM_IF_DM_WIDTH  (4),
		.MEM_IF_DQS_WIDTH (4),
		.MEM_IF_CS_WIDTH  (1),
		.MEM_IF_DQ_WIDTH  (32)
	) seq (
	);



endmodule