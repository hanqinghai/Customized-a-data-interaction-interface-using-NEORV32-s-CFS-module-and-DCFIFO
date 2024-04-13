module clk_ctrl
(
	input				wire				clk_i					,
	input				wire				rstn_i				,	
	input				wire	[15:0]	freq						,
	
	output			reg				dds1_o					,
	output			reg				dds_o						
);

		
reg	[31:0]	cnt;
wire	[63:0]	add;
																 
assign add =freq*32'd4294967295/16'd30000;
						
always@(posedge clk_i or negedge rstn_i)
	if(rstn_i ==1'b0)
		cnt <=32'd0;
	else
		cnt <=cnt +add;//64'd2_336_587_582_669_876_54;//64'd12_236_340_235_560_669;//frequency_regulator

always@(posedge clk_i or negedge rstn_i)
	if(rstn_i ==1'b0)
		dds_o <=1'b0;
	else if(cnt >=32'd2147483648)
		dds_o <=1'b1;
	else
		dds_o <=1'b0;		



reg	[31:0]	cnt1;
wire	[63:0]	add1;
																 
assign add1 =(freq/8'd36)*32'd4294967295/16'd3000;
						
always@(posedge clk_i or negedge rstn_i)
	if(rstn_i ==1'b0)
		cnt1 <=32'd0;
	else
		cnt1 <=cnt1 +add1;//64'd2_336_587_582_669_876_54;//64'd12_236_340_235_560_669;//frequency_regulator

always@(posedge clk_i or negedge rstn_i)
	if(rstn_i ==1'b0)
		dds1_o <=1'b0;
	else if(cnt1 >=32'd2147483648)
		dds1_o <=1'b1;
	else
		dds1_o <=1'b0;		
		
endmodule
