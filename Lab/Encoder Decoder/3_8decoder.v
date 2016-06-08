module testbench;
	wire w[0:10];
	decoder d1(w[0],w[1],w[2],w[3],w[4],w[5],w[6],w[7],w[8],w[9],w[10]);
	test t1(w[8],w[9],w[10],w[0],w[1],w[2],w[3],w[4],w[5],w[6],w[7]);
endmodule

module decoder(output o0,o1,o2,o3,o4,o5,o6,o7,input a,b,c);
	and(o0,~a,~b,~c);
	and(o1,~a,~b,c);
	and(o2,~a,b,~c);
	and(o3,~a,b,c);
	and(o4,a,~b,~c);
	and(o5,a,~b,c);
	and(o6,a,b,~c);
	and(o7,a,b,c);
endmodule



module test(output reg a,b,c,input o0,o1,o2,o3,o4,o5,o6,o7);
	initial begin
		$dumpfile("3:8decodedump.vcd");
		$dumpvars(2, testbench);
		$monitor($time,,,"a = %b b = %b c = %b o0 = %b,o1 = %b,o2 = %b,o3 = %b,o4 = %b,o5 = %b,o6 = %b,o7 = %b", a,b,c,o0,o1,o2,o3,o4,o5,o6,o7);
		{a, b, c} = #1 3'b000;
		{a, b, c} = #1 3'b001;
		{a, b, c} = #1 3'b010;
		{a, b, c} = #1 3'b011;
		{a, b, c} = #1 3'b100;
		{a, b, c} = #1 3'b101;
		{a, b, c} = #1 3'b110;
		{a, b, c} = #1 3'b111;
		$finish;
	end
endmodule
	
