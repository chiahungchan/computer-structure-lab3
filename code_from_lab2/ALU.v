//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer: 0316331_0316031     
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	shamt_for_sra,
	result_o,
	zero_o
	);
     
//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;
input  [4:0]     shamt_for_sra;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
wire             zero_o;

//Parameter
wire [31:0] orim ;
wire signed[31:0] s2;

//Main function
always@(*)begin
	case(ctrl_i)
		4'b0000: result_o <= src1_i & src2_i;
		4'b0001: result_o <= src1_i | src2_i;
		4'b0010: result_o <= src1_i + src2_i;
		4'b0110: result_o <= src1_i - src2_i;
		4'b0111: result_o <= (src1_i < src2_i) ? 32'd1 : 32'd0;
		4'b1100: result_o <= ~(src1_i | src2_i);
		4'b1001: result_o <= (src1_i == src2_i) ? 32'd1 : 32'd0;
		4'b1011: result_o <= src1_i | orim;
		4'b1000: result_o <= s2 >>> src1_i ;
		4'b1010: result_o <= src2_i << 16;
		4'b1110: result_o <= s2 >>> (shamt_for_sra);
		default: result_o <= 32'd0;
	endcase
end

assign zero_o = (result_o == 32'd0) ? 1'b1 : 1'b0;
assign orim[15:0] = src2_i[15:0];
assign orim[16] = src2_i[15];
assign orim[17] = src2_i[15];
assign orim[18] = src2_i[15];
assign orim[19] = src2_i[15];
assign orim[20] = src2_i[15];
assign orim[21] = src2_i[15];
assign orim[22] = src2_i[15];
assign orim[23] = src2_i[15];
assign orim[24] = src2_i[15];
assign orim[25] = src2_i[15];
assign orim[26] = src2_i[15];
assign orim[27] = src2_i[15];
assign orim[28] = src2_i[15];
assign orim[29] = src2_i[15];
assign orim[30] = src2_i[15];
assign orim[31] = src2_i[15];
assign s2 = src2_i;

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






                    
                    