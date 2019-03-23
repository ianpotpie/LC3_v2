module NZP_Logic (
		 Clk,
		 Reset,
		 Bus_In,
		 Load_NZP_Logic,
		 N,
		 Z,
		 P); //This Module Loads the bus when the load signal is on, and detects whether the loaded value is negative (N), zero (Z), or positive (P)
//init
	input Clk;
	input Reset; //resets Logic register
	input [15:0]Bus_In; //Connects to Bus 
	input Load_NZP_Logic;//loads thevalue on the bus into the Logic Register 
	
	output N; //loaded value is negative
	output Z; //loaded value is zero
	output P; //loaded value is positive

//Structural Verilog
	//Register
		wire [15:0]Logic_Reg;
		Negedge_DSwitch_16Reg Logic (Clk,Reset,Bus_In,Load_NZP_Logic,Logic_Reg);
		
	//Negative
		assign N = Logic_Reg[15];
		
	//Zero
		assign Z = ~Logic_Reg[15]&~Logic_Reg[14]&~Logic_Reg[13]&~Logic_Reg[12]&
					  ~Logic_Reg[11]&~Logic_Reg[10]&~Logic_Reg[9]&~Logic_Reg[8]&
					  ~Logic_Reg[7]&~Logic_Reg[6]&~Logic_Reg[5]&~Logic_Reg[4]&
					  ~Logic_Reg[3]&~Logic_Reg[2]&~Logic_Reg[1]&~Logic_Reg[0];
	
	//Positive
		assign P = ~Logic_Reg[15]&(Logic_Reg[14]|Logic_Reg[13]|Logic_Reg[12]|
					  Logic_Reg[11]|Logic_Reg[10]|Logic_Reg[9]|Logic_Reg[8]|
					  Logic_Reg[7]|Logic_Reg[6]|Logic_Reg[5]|Logic_Reg[4]|
					  Logic_Reg[3]|Logic_Reg[2]|Logic_Reg[1]|Logic_Reg[0]);
					  
endmodule