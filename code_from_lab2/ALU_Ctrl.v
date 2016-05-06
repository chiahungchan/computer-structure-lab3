//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:  0316331_0316031    
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter

       
//Select exact operation
always@(*)begin
	case(ALUOp_i)
		2:begin  // r-type
			case(funct_i)
				32: ALUCtrl_o <= 4'b0010;  // ADD
				34: ALUCtrl_o <= 4'b0110;  // SUB
				36:	ALUCtrl_o <= 4'b0000;  // AND
				37: ALUCtrl_o <= 4'b0001;  // OR
				42:	ALUCtrl_o <= 4'b0111;  // SLT
				 3:	ALUCtrl_o <= 4'b1110;  // SRA
				 7: ALUCtrl_o <= 4'b1000;  // SRAV
				default: ALUCtrl_o <= 4'b1111; // unused
			endcase
		end
		4: ALUCtrl_o <= 4'b0010;  // ADDI
		5: ALUCtrl_o <= 4'b0111;  // SLTIU
		1: ALUCtrl_o <= 4'b0110;  // BEQ
		3: ALUCtrl_o <= 4'b1001;  // BNE
		6: ALUCtrl_o <= 4'b1011;  // ORI
		7: ALUCtrl_o <= 4'b1010;  // LUI
		default: ALUCtrl_o <= 4'b1111;  // unused
	endcase
end

endmodule     
// 0000: AND
// 0001: OR
// 0010: ADD
// 0110: SUB
// 0111: SLT
// 1100: NOR
// 1001: BNE
// 1011: ORI
// 1000: SRAV
// 1010: LUI
// 1110: SRA

                    
                    