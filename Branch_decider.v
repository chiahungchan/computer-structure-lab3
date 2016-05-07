module Branch_decider(
	BranchType_i,
	zero_i,
	result31_i,
	branch_o
);

input    [1:0] BranchType_i;
input          zero_i;
input          result31_i;
output         branch_o;

reg            branch_o;

always@(*)begin
	case(BranchType_i)
		0:  branch_o <= zero_i ? 1'b1 : 1'b0; // beq
		1:  branch_o <= result31_i | zero_i ? 1'b1 : 1'b0; // ble
		2:  branch_o <= zero_i ? 1'b0 : 1'b1; // bne
		3:  branch_o <= result31_i ? 1'b1 : 1'b0; // bltz
		default: branch_o <= 1'b0;
	endcase
end
endmodule