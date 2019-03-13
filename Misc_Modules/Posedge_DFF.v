module Posedge_DFF (Clk,Reset,D,WE,Q); //this D Flip-Flop is set on the rising edge of the clock and includes a reset signal
//init
	input Clk;     //Clock Signal
	input Reset;   //Reset Signal
	input D;			//Data Signal
	input WE;		//Write-Enable Signal
	
	output Q;      //The State of the Flip-Flop
	
//Behavioral Verilog
	
	reg Q;
	
	always @ (posedge Clk)
		if (Reset) begin // Reset sets the register to 0 whether WE is 0 or 1
			
			Q <= 0;
		
		end
		else if (WE)
			if (D) begin // WE and D must both be on for Q to be flipped
				
				Q <= ~Q;
				
			end	

endmodule