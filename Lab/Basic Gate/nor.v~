module operate(input a, input b, output c);
	nor(c,a,b);
endmodule
module test_gen(output reg a,b,input c);
	initial // simulating
	begin
		$dumpfile("and.vcd");
		$dumpvars(a,b,c);
		$monitor($time,,,"a=%b, b=%b, c=%b",a,b,c);
		a=1;
		b=0;
		#5 a=0;b=1;
		#5 a=1;b=1;
		#5 a=0;b=0;
	end
endmodule
module testBench;
	wire a,b,c;
	test_gen tg(a,b,c);
	operate l(a,b,c);
endmodule
