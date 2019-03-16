module Posedge_DSwitch_16Reg (Clk,Reset,D,WE,Q);
//init
	input Clk;			//Clock input
	input Reset;		//Reset (ingnores Data input) 
	input [15:0]D;		//Data input
	input WE;			//Write Enable

	output [15:0]Q;	//state of the register

//Structural  Verilog
		Posedge_DSwitch Switch_15 (Clk,Reset,D[15],WE,Q[15]); //Instances of Switches in the register
		Posedge_DSwitch Switch_14 (Clk,Reset,D[14],WE,Q[14]);
		Posedge_DSwitch Switch_13 (Clk,Reset,D[13],WE,Q[13]);
		Posedge_DSwitch Switch_12 (Clk,Reset,D[12],WE,Q[12]);
		Posedge_DSwitch Switch_11 (Clk,Reset,D[11],WE,Q[11]);
		Posedge_DSwitch Switch_10 (Clk,Reset,D[10],WE,Q[10]);
		Posedge_DSwitch Switch_9 (Clk,Reset,D[9],WE,Q[9]);
		Posedge_DSwitch Switch_8 (Clk,Reset,D[8],WE,Q[8]);
		Posedge_DSwitch Switch_7 (Clk,Reset,D[7],WE,Q[7]);
		Posedge_DSwitch Switch_6 (Clk,Reset,D[6],WE,Q[6]);
		Posedge_DSwitch Switch_5 (Clk,Reset,D[5],WE,Q[5]);
		Posedge_DSwitch Switch_4 (Clk,Reset,D[4],WE,Q[4]);
		Posedge_DSwitch Switch_3 (Clk,Reset,D[3],WE,Q[3]);
		Posedge_DSwitch Switch_2 (Clk,Reset,D[2],WE,Q[2]);
		Posedge_DSwitch Switch_1 (Clk,Reset,D[1],WE,Q[1]);
		Posedge_DSwitch Switch_0 (Clk,Reset,D[0],WE,Q[0]);
		
endmodule