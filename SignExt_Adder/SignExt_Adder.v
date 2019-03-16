module SignExt_Adder (IR,PC,SR1,ADR2MUX_Control,ADR1MUX_Control,Adder);
//init
	input [15:0]IR;					//inputs the current value of IR
	input [15:0]PC;					//Inputs the current value of hte PC
	input [15:0]SR1;					//inputs the current value of register SR2
	input [1:0]ADR2MUX_Control;	//control signal for the ADR2 Mux
	input ADR1MUX_Control;			//control signal for the ADR1 Mux
	
	output [15:0]Adder;						//outputs the result of the adder, muxes, and sign extensions
	
//Structural Verilog
	//Sign Extending 11 bits
		wire [15:0]SEXT_11;
		assign SEXT_11 = {{5{IR[10]}},IR[10:0]};
	
	//Sign Extending 9 bits
		wire [15:0]SEXT_9;
		assign SEXT_9 = {{7{IR[8]}},IR[8:0]};
	
	//Sign Extending 6 bits
		wire [15:0]SEXT_6;
		assign SEXT_6 = {{10{IR[5]}},IR[5:0]};
		
	//ADR2MUX
		wire [15:0]ADR2MUX;
		assign ADR2MUX = 	({16{~ADR2MUX_Control[1]&~ADR2MUX_Control[0]}}&16'b0000000000000000)|
								({16{~ADR2MUX_Control[1]&ADR2MUX_Control[0]}}&SEXT_6)|
								({16{ADR2MUX_Control[1]&~ADR2MUX_Control[0]}}&SEXT_9)|
								({16{ADR2MUX_Control[1]&ADR2MUX_Control[0]}}&SEXT_11);
								
	//ADR1MUX
		wire [15:0]ADR1MUX;
		assign ADR1MUX = ADR1MUX_Control? SR1 : PC;
		
	//Adder
	wire [15:0]Adder;
	assign Adder = ADR1MUX + ADR2MUX;
						  
endmodule