
module dds_top
(
	input			wire						clk_i			,
	input			wire						rstn_i		,
	output		wire	[8:0]				gpio_o		,
	output		wire						uart1_txd_o	,
	input			wire						uart1_rxd_i	,
	output		wire						uart0_txd_o	,
	input			wire						uart0_rxd_i	,
	
	input			wire	[11:0]			adc_data_i	,
	output		wire						adc_clk_o		,
	
	output		wire	[13:0]			dac_b_data_o	,	
	output		wire						dac_b_clk_o		,
	output		wire	[13:0]			dac_a_data_o	,	
	output		wire						dac_a_clk_o	
 		
);

wire					clk_300M;
reg	[9:0]			addr;
wire	[15:0]		q_sin;
wire	[15:0]		q_square;
wire	[31:0]		cfs_out_o;
wire	[31:0]		cfs_in_i;

assign dac_a_clk_o =dds_o;
assign dac_a_data_o =q_sin[13:0];//

assign dac_b_clk_o =dds_o;
assign dac_b_data_o =q_square[13:0];

assign gpio_o[6] =cfs_in_i[17];
assign gpio_o[5] =cfs_in_i[20];

always@(posedge dds_o or negedge rstn_i)
	if(rstn_i ==1'b0)
		addr <=10'd0; 
	else if(addr >=10'd359) 
		addr <=10'd0;
	else
		addr <=addr +1'b1;

pll_120m pll_120m_inst //调用锁相环的IP核
(
	.refclk   (clk_i),   
	.rst      (~rstn_i),     
	.outclk_0 (clk_300M), 
	.locked   ()          
);
		
clk_ctrl clk_ctrl_inst  //分频模块用来产生所需的频率                                                                                                                                                                         
(
	.clk_i					(clk_300M),
	.rstn_i					(rstn_i),	
	.freq						(16'd10800),

	.dds1_o					(adc_clk_o),	
	.dds_o					(dds_o)	
);


cfs_read_fifo cfs_read_fifo_inst  //调用的异步FIFO的IP核
(
	.data			(adc_data_i),
	.rdclk		(cfs_out_o[18])	,
	.rdreq		(cfs_out_o[19])	,
	.wrclk		(adc_clk_o)	,
	.q				(cfs_in_i[15:0]),
	.rdempty		(cfs_in_i[20]),
	.rdusedw		(),
	.wrreq		(cfs_out_o[16]),
	.wrfull		(cfs_in_i[17])
	
);	

sin16x1024 sin16x1024_inst   //测试输出的一路正弦波
(
	.address		(addr),
	.clock		(dds_o),
	.q				(q_sin)
	
);

square16x1024 square16x1024_inst  //测试输出的一路方波
(
	.address		(addr),
	.clock		(dds_o),
	.q				(q_square)
);

neorv32_test_setup_bootloader neorv32_test_setup_bootloader_inst 
(

    .clk_i       			(clk_i)	,
    .rstn_i      			(rstn_i)	,			
//  -- GPIO --													
    .gpio_o     			(gpio_o[1:0])	,						
 
//	 -- CFS   --	
	 .cfs_in_i	 			(cfs_in_i),		
	 .cfs_out_o	 			(cfs_out_o),
	 
//	 -- UART1 --															
	 .uart1_txd_o 			(uart1_txd_o)			,													
    .uart1_rxd_i 			(uart1_rxd_i)			,													
//  -- UART0 --																
    .uart0_txd_o 			(uart0_txd_o)			,												
    .uart0_rxd_i 			(uart0_rxd_i)										
);


endmodule
