module testbench;
	wire d, rw, q, qn;
	regi r(d, rw, q, qn);
	test t(d, rw, q, qn);
endmodule

module regi(input d, rw, output q, qn);
	wire w0, w1;
	nand (w0, d, rw), (w1, ~d, rw), (q, w0, qn), (qn, w1, q);
endmodule

module test(output reg d, rw, input q, qn);
	initial
	begin
		$dumpfile("D Flip Flop.vcd");
		$dumpvars(2, testbench);
		$monitor($time, " d = %b rw = %b q = %b", d, rw, q);
			{d, rw} = 2'b00;
			{d, rw} = #1 2'b01;
			{d, rw} = #1 2'b10;
			{d, rw} = #1 2'b11;
		$finish;
	end
endmodule
