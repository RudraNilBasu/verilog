module tb;
	wire clk, j, k, ps, ns;
	jk jk(clk, j, k, ps, ns);
	test test(clk, j, k, ps, ns);
endmodule

module jk(input clk, j, k, ps, output ns);
	wire w0, w1;
	//assign ns = j & ~ps + ~k & ps;
	and (w0, j, ~ps), (w1, ~k, ps);
	or (ns, w0, w1);
endmodule

module test(output reg clk, j, k, ps, input ns);
	initial begin
		$dumpfile("sr.vcd");
		$dumpvars(2, tb);
		$monitor($time,,, "clk = %b j = %b k = %b ps = %b ns = %b\n", clk, j, k, ps, ns);
		{clk, j, k, ps} = 4'b0000;
		{clk, j, k, ps} = #1 4'b0001;
		{clk, j, k, ps} = #1 4'b0010;
		{clk, j, k, ps} = #1 4'b0011;
		{clk, j, k, ps} = #1 4'b0100;
		{clk, j, k, ps} = #1 4'b0101;
		{clk, j, k, ps} = #1 4'b0110;
		{clk, j, k, ps} = #1 4'b0111;
		{clk, j, k, ps} = #1 4'b1000;
		{clk, j, k, ps} = #1 4'b1001;
		{clk, j, k, ps} = #1 4'b1010;
		{clk, j, k, ps} = #1 4'b1011;
		{clk, j, k, ps} = #1 4'b1100;
		{clk, j, k, ps} = #1 4'b1101;
		{clk, j, k, ps} = #1 4'b1110;
		{clk, j, k, ps} = #1 4'b1111;		
		$finish;
	end
endmodule
