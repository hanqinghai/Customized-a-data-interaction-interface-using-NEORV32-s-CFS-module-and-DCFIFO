
module ad9226_ctrl
( 
	input		wire				clk_i				,
	input		wire				rstn_i			,
	input		wire	[11:0]	signal_i			,

	output	reg	[11:0]	wave_data_o     		
	
);

always@(negedge clk_i or negedge rstn_i)
	if(rstn_i ==1'b0)			
		wave_data_o <=16'd0;
	else 
		wave_data_o <=signal_i[11]*16'd2048 +signal_i[10]*16'd1024 +signal_i[9]*16'd512 +signal_i[8]*16'd256 +signal_i[7]*16'd128 +signal_i[6]*16'd64 +signal_i[5]*16'd32 +signal_i[4]*16'd16 +signal_i[3]*16'd8 +signal_i[2]*16'd4 +signal_i[1]*16'd2 +signal_i[0];	

endmodule
