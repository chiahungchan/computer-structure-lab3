module MUX_4to2(
	data_00,
	data_01,
	data_10,
	select,
	data_o
	);

input  [31:0] data_00,data_01,data_10;
input  [1:0]  select;
output [31:0] data_o;

reg    [31:0] data_o;

always@(*)begin
	case(select)
		0: data_o <= data_00;
		1: data_o <= data_01;
		2: data_o <= data_10;
		default: data_o <= 32'd0;
	endcase
end

endmodule