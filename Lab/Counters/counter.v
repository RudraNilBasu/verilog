module counter(output reg [3:0] ctr, input clk, input rst);
	always @(posedge clk)
	begin
		if(ctr==15)
			ctr<=0;
		else
			ctr<=ctr+1;
	end
	always @(rst)
	begin
		if(rst)
			ctr=0;
	end
endmodule
module tb(input [3:0] ctr, output reg clk, output reg rst);
	initial begin
			$monitor($time,,,"ctr=%d clk=%b",ctr,clk);
			rst=0;
			clk=0;
			rst=1;
			clk=1;
			#5 clk=0;rst=0;
			#1 clk=1;
			#1 clk=0;
			#1 clk=1;
	end
endmodule
module wb;
	wire clk,rst;
	wire [3:0] ctr;
	tb t(ctr,clk,rst);
	counter c(ctr,clk,rst);
endmodule
