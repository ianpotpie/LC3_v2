module PC (Clk,
		 Reset,
		 Load_PC,
		 PCMUX_Control,
		 PCMUX_Bus,
		 PCMUX_Adder,
		 PC);

//init
	input Clk; 						//Clock input
	input Reset; 					//Resets PC Reg
	input Load_PC; 				//Loads PC Reg
	input [1:0]PCMUX_Control; 	//Control Signal Entering PCMUX
	input [15:0]PCMUX_Bus;		//Signal coming from the Bus into the PC MUX
	input [15:0]PCMUX_Adder;	//Signal coming from the Adder to the PC MUX
	
	output [15:0]PC; 			//This is the value of the PC

//Structural Verilog
	//PC Register
		wire [15:0]PC;
		Negedge_DSwitch_16Reg PC_Reg (Clk,Reset,PCMUX,Load_PC,PC);
	
	//PC incrementer
		wire [15:0]PC_Increment;
		assign PC_Increment = PC + 16'b0000000000000001;
		
	//PCMUX
		wire [15:0]PCMUX;
		assign PCMUX = ({16{(~PCMUX_Control[1]&~PCMUX_Control[0])}}&PC_Increment)|
							({16{(~PCMUX_Control[1]&PCMUX_Control[0])}}&PCMUX_Adder)|
							({16{(PCMUX_Control[1]&~PCMUX_Control[0])}}&PCMUX_Bus)|
							({16{(PCMUX_Control[1]&PCMUX_Control[0])}}&16'b0000000000000000);

endmodule