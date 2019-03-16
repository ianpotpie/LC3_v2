module MARMUX (MARMUX_Adder,IR,MARMUX_Control,MARMUX);
//init
	input [15:0]MARMUX_Adder;			//Input of the MARMUX fromt he Adder
	input [15:0]IR;						//Input IR
	input MARMUX_Control; 				//Selects input of the MARMUX
	
	output [15:0]MARMUX;						//value passed through MARMUX

//Structural Verilog
	//Zero extending the IR input
		wire [15:0]IR_ZEXT;
		assign IR_ZEXT = {8'b00000000,IR[7:0]};
		
	//The Marmux itself
		assign MARMUX = MARMUX_Control? IR_ZEXT : MARMUX_Adder;
	
endmodule