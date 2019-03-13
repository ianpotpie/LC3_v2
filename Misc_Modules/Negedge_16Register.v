module Negedge_16Register (Clk,Reset,D,WE,Q); //16 bit register updates on the negative edge of the clock
//init
	input Clk;		  //Clock signal
	input Reset;     //Reset Signal
	input [15:0]D;   //Data to be implemented
	input WE;        //Write Enable Signal
	
	output [15:0]Q;  //State of the Register (output)
	
//Structural Verilog
	Negedge_DFF Neg_DFF_15 (Clk,Reset,D[15],WE,Q[15]); //implementation of all Flip-Flops
	Negedge_DFF Neg_DFF_14 (Clk,Reset,D[14],WE,Q[14]);
	Negedge_DFF Neg_DFF_13 (Clk,Reset,D[13],WE,Q[13]);
	Negedge_DFF Neg_DFF_12 (Clk,Reset,D[12],WE,Q[12]);
	Negedge_DFF Neg_DFF_11 (Clk,Reset,D[11],WE,Q[11]);
	Negedge_DFF Neg_DFF_10 (Clk,Reset,D[10],WE,Q[10]);
	Negedge_DFF Neg_DFF_9 (Clk,Reset,D[9],WE,Q[9]);
	Negedge_DFF Neg_DFF_8 (Clk,Reset,D[8],WE,Q[8]);
	Negedge_DFF Neg_DFF_7 (Clk,Reset,D[7],WE,Q[7]);
	Negedge_DFF Neg_DFF_6 (Clk,Reset,D[6],WE,Q[6]);
	Negedge_DFF Neg_DFF_5 (Clk,Reset,D[5],WE,Q[5]);
	Negedge_DFF Neg_DFF_4 (Clk,Reset,D[4],WE,Q[4]);
	Negedge_DFF Neg_DFF_3 (Clk,Reset,D[3],WE,Q[3]);
	Negedge_DFF Neg_DFF_2 (Clk,Reset,D[2],WE,Q[2]);
	Negedge_DFF Neg_DFF_1 (Clk,Reset,D[1],WE,Q[1]);
	Negedge_DFF Neg_DFF_0 (Clk,Reset,D[0],WE,Q[0]);
	
endmodule