//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:    0316331_0316031  
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	BranchType_o,
	Jump_o,
	MemRead_o,
	MemWrite_o,
	MemtoReg_o,
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output [1:0]   BranchType_o,MemtoReg_o;
output         Jump_o;
output         MemRead_o;
output         MemWrite_o;
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg    [1:0]   BranchType_o,MemtoReg_o;
reg            Jump_o;
reg            MemRead_o;
reg            MemWrite_o;

//Parameter


//Main function
always@(*)begin
	case(instr_op_i)
	
		0:begin  // r-type
			RegWrite_o <= 1'b1;
			RegDst_o <= 1'b1;
			Branch_o <= 1'b0;
			ALUSrc_o <= 1'b0;
			ALU_op_o <= 3'd2;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		1:begin  // bltz  branch type: 11
			RegWrite_o <= 1'b0;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b1;
			ALUSrc_o <= 1'b0;
			ALU_op_o <= ;
			BranchType_o <= 2'b11;
			MemtoReg_o <=
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		2:begin  // jump
			RegWrite_o <= 1'b0;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b0;
			ALUSrc_o <= 1'b0;
			ALU_op_o <= ;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b0;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		3:begin  // jal
			RegWrite_o <= ;
			RegDst_o <= ;
			Branch_o <= 1'b0;
			ALUSrc_o <= ;
			ALU_op_o <= ;
			BranchType_o <= 2'b00;
			MemtoReg_o <=
			Jump_o <= 1'b0;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		4:begin  // beq  branch type: 00
			RegWrite_o <= 1'b0;
			RegDst_o <= 1'b1;  // don't care
			Branch_o <= 1'b1;
			ALUSrc_o <= 1'b0;
			ALU_op_o <= 3'd1;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		5:begin  // bne  branch type: 10
			RegWrite_o <= 1'b0;
			RegDst_o <= 1'b0;  // don't care
			Branch_o <= 1'b1;
			ALUSrc_o <= 1'b0;
			ALU_op_o <= 3'd3;
			BranchType_o <= 2'b10;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		6:begin  // ble  branch type: 01
			RegWrite_o <= 1'b0;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b1;
			ALUSrc_o <= 1'b0;
			ALU_op_o <= ;
			BranchType_o <= 2'b01;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		8:begin  // addi
			RegWrite_o <= 1'b1;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b0;
			ALUSrc_o <= 1'b1;
			ALU_op_o <= 3'd4;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		9:begin  // sltiu
			RegWrite_o <= 1'b1;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b0;
			ALUSrc_o <= 1'b1;
			ALU_op_o <= 3'd5;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		13:begin  // ori
			RegWrite_o <= 1'b1;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b0;
			ALUSrc_o <= 1'b1;
			ALU_op_o <= 3'd6;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		//15:begin  // lui
			RegWrite_o <= 1'b1;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b0;
			ALUSrc_o <= 1'b1;
			ALU_op_o <= 3'd7;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
		35:begin  // lw
			RegWrite_o <= 1'b1;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b0;
			ALUSrc_o <= 1'b1;
			ALU_op_o <= ;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b01;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b1;
			MemWrite_o <= 1'b0;
		end
		43:begin  // sw
			RegWrite_o <= 1'b0;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b0;
			ALUSrc_o <= 1'b1;
			ALU_op_o <= ;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b1;
		end
		default:begin
			RegWrite_o <= 1'b0;
			RegDst_o <= 1'b0;
			Branch_o <= 1'b0;
			ALUSrc_o <= 1'b0;
			ALU_op_o <= 3'b0;
			BranchType_o <= 2'b00;
			MemtoReg_o <= 2'b00;
			Jump_o <= 1'b1;
			MemRead_o <= 1'b0;
			MemWrite_o <= 1'b0;
		end
	endcase
end

endmodule





                    
                    