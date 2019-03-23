module Memory (Clk,
					Clk_View,
					Reset,
					Load_MDR,
					Load_MAR,
					Memory_WE,
					Bus_In,
					Memory_Out,
					View_WE,
					View_Address,
					View_Data,
					View_Out);
//Init
	//Computer
		input Reset;
		input Clk;
		input Load_MDR;
		input Load_MAR;
		input Memory_WE;
	
		input [15:0]Bus_In;
	
		output [15:0]Memory_Out;
		
	//View
		input Clk_View;
		input View_WE;
		
		input [15:0]View_Address;
		input [15:0]View_Data;
	
		output [15:0]View_Out;
		
//Structural Verilog
	//MAR
		wire [15:0]MAR;
		Negedge_DSwitch_16Reg MAR_Register (Clk,
														Reset,
														Bus_In,
														Load_MAR,
														MAR);
		
	//MDR
		wire [15:0]MDR;
		Negedge_DSwitch_16Reg MDR_Register (Clk,
														Reset,
														Bus_In,
														Load_MDR,
														MDR);

	//Mem_Block
		Mem_Block (MAR,
					  View_Address,
					  ~Clk,
					  Clk_View,
					  MDR,
					  View_Data,
					  Memory_WE,
					  View_WE,
					  Memory_Out,
					  View_Out);
	
endmodule