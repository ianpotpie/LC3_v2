module Register_Mod (
		 Clk,
		 Reset,
		 Bus_In,
		 DR_Control,
		 Load_Reg,
		 SR2_Control,
		 SR1_Control,
		 Reg_View_Control,
		 SR2,
		 SR1,
		 Reg_View);
//init
	input Clk;				//Clock signal
	input Reset;			//Resets the all Registers
	input [15:0]Bus_In;	//lets the Bus in
	input [2:0]DR_Control;			//address of register to be written to
	input Load_Reg;		//Loads value on the Bus to DR
	input [2:0]SR2_Control;	//address of register to be read from 
	input [2:0]SR1_Control;	//address of register to be read from 
	input [2:0]Reg_View_Control; //ddress of a register whose value is to be viewed
	
	output [15:0]SR2;				//The value of the Register at SR2
	output [15:0]SR1;				//The value of the Register at SR1
	output [15:0]Reg_View;		//The value of a Register to be viewed
	
//Structural Verilog
	//Register Instances
		wire [7:0]DR_Load;
		
		wire [15:0]Reg0_Out;
		Negedge_DSwitch_16Reg Reg0 (Clk,Reset,Bus_In,DR_Load[0],Reg0_Out);
		
		wire [15:0]Reg1_Out;
		Negedge_DSwitch_16Reg Reg1 (Clk,Reset,Bus_In,DR_Load[1],Reg1_Out);
		
		wire [15:0]Reg2_Out;
		Negedge_DSwitch_16Reg Reg2 (Clk,Reset,Bus_In,DR_Load[2],Reg2_Out);
		
		wire [15:0]Reg3_Out;
		Negedge_DSwitch_16Reg Reg3 (Clk,Reset,Bus_In,DR_Load[3],Reg3_Out);
		
		wire [15:0]Reg4_Out;
		Negedge_DSwitch_16Reg Reg4 (Clk,Reset,Bus_In,DR_Load[4],Reg4_Out);
		
		wire [15:0]Reg5_Out;
		Negedge_DSwitch_16Reg Reg5 (Clk,Reset,Bus_In,DR_Load[5],Reg5_Out);
		
		wire [15:0]Reg6_Out;
		Negedge_DSwitch_16Reg Reg6 (Clk,Reset,Bus_In,DR_Load[6],Reg6_Out);
		
		wire [15:0]Reg7_Out;
		Negedge_DSwitch_16Reg Reg7 (Clk,Reset,Bus_In,DR_Load[7],Reg7_Out);
		
	//SR2
		assign SR2 = ({16{~SR2_Control[2]&~SR2_Control[1]&~SR2_Control[0]}}&Reg0_Out)|
						 ({16{~SR2_Control[2]&~SR2_Control[1]&SR2_Control[0]}}&Reg1_Out)|
						 ({16{~SR2_Control[2]&SR2_Control[1]&~SR2_Control[0]}}&Reg2_Out)|
						 ({16{~SR2_Control[2]&SR2_Control[1]&SR2_Control[0]}}&Reg3_Out)|
						 ({16{SR2_Control[2]&~SR2_Control[1]&~SR2_Control[0]}}&Reg4_Out)|
						 ({16{SR2_Control[2]&~SR2_Control[1]&SR2_Control[0]}}&Reg5_Out)|
						 ({16{SR2_Control[2]&SR2_Control[1]&~SR2_Control[0]}}&Reg6_Out)|
						 ({16{SR2_Control[2]&SR2_Control[1]&SR2_Control[0]}}&Reg7_Out);
		
	//SR1
		assign SR1 = ({16{~SR1_Control[2]&~SR1_Control[1]&~SR1_Control[0]}}&Reg0_Out)|
						 ({16{~SR1_Control[2]&~SR1_Control[1]&SR1_Control[0]}}&Reg1_Out)|
						 ({16{~SR1_Control[2]&SR1_Control[1]&~SR1_Control[0]}}&Reg2_Out)|
						 ({16{~SR1_Control[2]&SR1_Control[1]&SR1_Control[0]}}&Reg3_Out)|
						 ({16{SR1_Control[2]&~SR1_Control[1]&~SR1_Control[0]}}&Reg4_Out)|
						 ({16{SR1_Control[2]&~SR1_Control[1]&SR1_Control[0]}}&Reg5_Out)|
						 ({16{SR1_Control[2]&SR1_Control[1]&~SR1_Control[0]}}&Reg6_Out)|
						 ({16{SR1_Control[2]&SR1_Control[1]&SR1_Control[0]}}&Reg7_Out);
						 
	//Register View
		assign Reg_View = ({16{~Reg_View_Control[2]&~Reg_View_Control[1]&~Reg_View_Control[0]}}&Reg0_Out)|
								({16{~Reg_View_Control[2]&~Reg_View_Control[1]&Reg_View_Control[0]}}&Reg1_Out)|
								({16{~Reg_View_Control[2]&Reg_View_Control[1]&~Reg_View_Control[0]}}&Reg2_Out)|
								({16{~Reg_View_Control[2]&Reg_View_Control[1]&Reg_View_Control[0]}}&Reg3_Out)|
								({16{Reg_View_Control[2]&~Reg_View_Control[1]&~Reg_View_Control[0]}}&Reg4_Out)|
								({16{Reg_View_Control[2]&~Reg_View_Control[1]&Reg_View_Control[0]}}&Reg5_Out)|
								({16{Reg_View_Control[2]&Reg_View_Control[1]&~Reg_View_Control[0]}}&Reg6_Out)|
								({16{Reg_View_Control[2]&Reg_View_Control[1]&Reg_View_Control[0]}}&Reg7_Out);
								
	//DR Input
	assign DR_Load = {8{Load_Reg}}&
						  (({8{~DR_Control[2]&~DR_Control[1]&~DR_Control[0]}}&8'b00000001)|
						  ({8{~DR_Control[2]&~DR_Control[1]&DR_Control[0]}}&8'b00000010)|
						  ({8{~DR_Control[2]&DR_Control[1]&~DR_Control[0]}}&8'b00000100)|
						  ({8{~DR_Control[2]&DR_Control[1]&DR_Control[0]}}&8'b00001000)|
						  ({8{DR_Control[2]&~DR_Control[1]&~DR_Control[0]}}&8'b00010000)|
						  ({8{DR_Control[2]&~DR_Control[1]&DR_Control[0]}}&8'b00100000)|
						  ({8{DR_Control[2]&DR_Control[1]&~DR_Control[0]}}&8'b01000000)|
						  ({8{DR_Control[2]&DR_Control[1]&DR_Control[0]}}&8'b10000000));
	
endmodule