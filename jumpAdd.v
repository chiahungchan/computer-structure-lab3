module jumpAdd(
	instr_i,
	pc_plus4_i,
	jump_address_o
	);
	
input [25:0] instr_i;
input [3:0]  pc_plus4_i;
output[31:0] jump_address_o;

assign jump_address_o[ 0] = 1'b0 ;
assign jump_address_o[ 1] = 1'b0 ;
assign jump_address_o[ 2] = instr_i[ 0] ;
assign jump_address_o[ 3] = instr_i[ 1] ;
assign jump_address_o[ 4] = instr_i[ 2] ;
assign jump_address_o[ 5] = instr_i[ 3] ;
assign jump_address_o[ 6] = instr_i[ 4] ;
assign jump_address_o[ 7] = instr_i[ 5] ;
assign jump_address_o[ 8] = instr_i[ 6] ;
assign jump_address_o[ 9] = instr_i[ 7] ;
assign jump_address_o[10] = instr_i[ 8] ;
assign jump_address_o[11] = instr_i[ 9] ;
assign jump_address_o[12] = instr_i[10] ;
assign jump_address_o[13] = instr_i[11] ;
assign jump_address_o[14] = instr_i[12] ;
assign jump_address_o[15] = instr_i[13] ;
assign jump_address_o[16] = instr_i[14] ;
assign jump_address_o[17] = instr_i[15] ;
assign jump_address_o[18] = instr_i[16] ;
assign jump_address_o[19] = instr_i[17] ;
assign jump_address_o[20] = instr_i[18] ;
assign jump_address_o[21] = instr_i[19] ;
assign jump_address_o[22] = instr_i[20] ;
assign jump_address_o[23] = instr_i[21] ;
assign jump_address_o[24] = instr_i[22] ;
assign jump_address_o[25] = instr_i[23] ;
assign jump_address_o[26] = instr_i[24] ;
assign jump_address_o[27] = instr_i[25] ;
assign jump_address_o[28] = pc_plus4_i[0] ;
assign jump_address_o[29] = pc_plus4_i[1] ;
assign jump_address_o[30] = pc_plus4_i[2] ;
assign jump_address_o[31] = pc_plus4_i[3] ;

endmodule