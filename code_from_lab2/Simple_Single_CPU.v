//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     2
//--------------------------------------------------------------------------------
//Writer:      0316331_0316031
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
        clk_i,
		rst_i
		);
		
//I/O port
input         clk_i;
input         rst_i;

//Internal Signles
wire [31:0] read_addr;
wire [31:0] instr;
wire [31:0] sign_ext;
wire        RegWrite,ALUsrc,RegDest,Branch;
wire [31:0] ReadData1,ReadData2;
wire [3:0]  ALUctrl;
wire [31:0] ALUresult;
wire        zero,A_select;
wire [31:0] after_shift;
wire [31:0] PC_plus4;
wire [4:0]  WriteReg;
wire [31:0] MUX_o_ALU;
wire [31:0] PCsrc;
wire [31:0] branch_next;
wire [31:0] memData;
wire [31:0] jumpAddr;
wire [31:0] WBdata;
wire [31:0] toNextMUX;
wire [2:0]  ALUop;
wire [1:0]  branchType,memtoReg;
wire        Jump,memRead,memWrite,branchDecide;

//Greate componentes
ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_in_i(PCsrc) ,   
	    .pc_out_o(read_addr) 
	    );
	
Adder Adder1(  // PC = PC + 4
        .src1_i(32'd4),     
	    .src2_i(read_addr),     
	    .sum_o(PC_plus4)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(read_addr),  
	    .instr_o(instr)    
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr[20:16]),
        .data1_i(instr[15:11]),
        .select_i(RegDest),
        .data_o(WriteReg)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_i(rst_i) ,     
        .RSaddr_i(instr[25:21]) ,  
        .RTaddr_i(instr[20:16]) ,  
        .RDaddr_i(WriteReg) ,  
        .RDdata_i(WBdata)  , 
        .RegWrite_i (RegWrite),
        .RSdata_o(ReadData1) ,  
        .RTdata_o(ReadData2)   
        );
	
Decoder Decoder(
        .instr_op_i(instr[31:26]), 
	    .RegWrite_o(RegWrite), 
	    .ALU_op_o(ALUop),   
	    .ALUSrc_o(ALUsrc),   
	    .RegDst_o(RegDest),   
		.Branch_o(Branch),
		.BranchType_o(branchType),
		.Jump_o(Jump),
		.MemRead_o(memRead),
		.MemWrite_o(memWrite),
		.MemtoReg_o(memtoReg),
	    );

ALU_Ctrl AC(
        .funct_i(instr[5:0]),   
        .ALUOp_i(ALUop),   
        .ALUCtrl_o(ALUctrl) 
        );
	
Sign_Extend SE(
        .data_i(instr[15:0]),
        .data_o(sign_ext)
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(ReadData2),
        .data1_i(sign_ext),
        .select_i(ALUsrc),
        .data_o(MUX_o_ALU)
        );	
		
ALU ALU(
        .src1_i(ReadData1),
	    .src2_i(MUX_o_ALU),
	    .ctrl_i(ALUctrl),
		.shamt_for_sra(instr[10:6]),
	    .result_o(ALUresult),
		.zero_o(zero)
	    );
		
Adder Adder2(  // branch
        .src1_i(PC_plus4),     
	    .src2_i(after_shift),     
	    .sum_o(branch_next)      
	    );
		
Shift_Left_Two_32 Shifter(
        .data_i(sign_ext),
        .data_o(after_shift)
        );	
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(PC_plus4),
        .data1_i(branch_next),
        .select_i(A_select),
        .data_o(toNextMUX)
        );

Data_Memory DataMem(
		.clk_i(clk_i),
		.addr_i(ALUresult),
		.data_i(ReadData2),
		.MemRead_i(memRead),
		.MemWrite_i(memWrite),
		.data_o(memData)
		);

jumpAdd JumpADD(
		.instr_i(instr[25:0]),
		.pc_plus4_i(PC_plus4[31:28]),
		.jump_address_o(jumpAddr)
		);

MUX_4to2 MUX_MtoR(
		.data_00(ALUresult),
		.data_01(memData),
		.data_10(sign_ext),
		.select(memtoReg),
		.data_o(WBdata)
);

MUX_2to1 selectJMP(
		.data0_i(jumpAddr),
        .data1_i(toNextMUX),
        .select_i(Jump),
        .data_o(PCsrc)
);		

Branch_decider Branch_deci(
		.BranchType_i(branchType),
		.zero_i(zero),
		.result31_i(ALUresult[31]),
		.branch_o(branchDecide)
);

//and AND(Branch,zero,A_select);
assign A_select = Branch & branchDecide;

endmodule
		  


