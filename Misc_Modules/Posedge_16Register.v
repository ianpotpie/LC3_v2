module Posedge_16Register (Clk,Reset,D,WE,Q); //16 bit register updates on the positive edge of the clock
//init
	input Clk;		  //Clock signal
	input Reset;     //Reset Signal
	input [15:0]D;   //Data to be implemented
	input WE;        //Write Enable Signal
	
	output [15:0]Q;  //State of the Register (output)
	
//Structural Verilog
	Posedge_DFF Pos_DFF_15 (Clk,Reset,D[15],WE,Q[15]); //implementation of all Flip-Flops
	Posedge_DFF Pos_DFF_14 (Clk,Reset,D[14],WE,Q[14]);
	Posedge_DFF Pos_DFF_13 (Clk,Reset,D[13],WE,Q[13]);
	Posedge_DFF Pos_DFF_12 (Clk,Reset,D[12],WE,Q[12]);
	Posedge_DFF Pos_DFF_11 (Clk,Reset,D[11],WE,Q[11]);
	Posedge_DFF Pos_DFF_10 (Clk,Reset,D[10],WE,Q[10]);
	Posedge_DFF Pos_DFF_9 (Clk,Reset,D[9],WE,Q[9]);
	Posedge_DFF Pos_DFF_8 (Clk,Reset,D[8],WE,Q[8]);
	Posedge_DFF Pos_DFF_7 (Clk,Reset,D[7],WE,Q[7]);
	Posedge_DFF Pos_DFF_6 (Clk,Reset,D[6],WE,Q[6]);
	Posedge_DFF Pos_DFF_5 (Clk,Reset,D[5],WE,Q[5]);
	Posedge_DFF Pos_DFF_4 (Clk,Reset,D[4],WE,Q[4]);
	Posedge_DFF Pos_DFF_3 (Clk,Reset,D[3],WE,Q[3]);
	Posedge_DFF Pos_DFF_2 (Clk,Reset,D[2],WE,Q[2]);
	Posedge_DFF Pos_DFF_1 (Clk,Reset,D[1],WE,Q[1]);
	Posedge_DFF Pos_DFF_0 (Clk,Reset,D[0],WE,Q[0]);
	
endmodule