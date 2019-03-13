module ALU (IR,SR2MUX_Control,ALUMUX_Control,SR1_In,SR2_In,ALU_Out); //ALU can perform Addition, bit-wise AND, and bit-wise NOT
//Init
	input [15:0]IR;		//
	input SR2MUX_Control;
	input [1:0]ALUMUX_Control;
	input [15:0]SR1_In;
	input [15:0]SR2_In;
	
	output [15:0]ALU_Out;

//Structural Verilog 
	//SR2 Mux implementation
		wire [15:0]IR_5Sext;
		assign IR_5Sext = {{11{IR[4]}},IR[4:0]};  //Sign extending the first 5 digits of the IR
		
		wire [15:0]SR2MUX;
		assign  SR2MUX = SR2MUX_Control? IR_5Sext : SR2_In; //Selects SR2 or IR to be sent to the ALU
	
	//arithmetic functions
		wire [15:0]ADD;                  //The Addition Function
		assign ADD = SR2MUX + SR1_In;
		
		wire [15:0]AND;						//The Bit-Wise AND
		assign AND = SR2MUX & SR1_In;
		
		wire [15:0]NOT;						//The Bit-Wise NOT
		assign NOT = ~SR1_In;
	
	//ALU Implementation
		assign ALU_Out = ({16{~ALUMUX_Control[1]&~ALUMUX_Control[0]}} & ADD)|
							  ({16{~ALUMUX_Control[1]&ALUMUX_Control[0]}} & AND)|
							  ({16{ALUMUX_Control[1]&~ALUMUX_Control[0]}} & NOT)|
							  ({16{ALUMUX_Control[1]&ALUMUX_Control[0]}} & SR1_In);
								
endmodule