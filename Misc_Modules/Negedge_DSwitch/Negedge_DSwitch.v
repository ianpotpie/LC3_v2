module Negedge_DSwitch (Clk,Reset,D,WE,Q);
//init 
	input Clk; //Clock
	input Reset; //resets no matter state of D
	input D;  //Data input 
	input WE; //Write Enable 
	
	output Q; //state of the switch

//Behavioral Verilog
	reg Q;

	always @(negedge Clk) begin
		if (Reset)
			Q <= 0;
		else if (WE)
			Q <= D;
	end

endmodule