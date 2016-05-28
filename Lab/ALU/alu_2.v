module alu(sel,a,b,res);
	input [1:0] sel;
	input [1:0] a;
	input [1:0] b;
	output reg [0:1] res;
	always @(sel)
	begin
		if(sel==0)
		begin
			res=a&b;
		end
		if(sel==1)
		begin 
			res=a|b;
		end
		if(sel==2)
		begin
			res=a^b;
		end
		if(sel==3)
		begin
			res=~a;
		end
	end
endmodule
module tg(sel,a,b,res);
	input [0:1] res;
	output reg [0:1] sel,a,b;
	initial begin
		$monitor($time,,,"a=%b%b b=%b%b sel=%b%b res=%b%b",a[1],a[0],b[1],b[0],sel[1],sel[0],res[1],res[0]);
		a=2'b11;b=2'b01;
		sel=2'b01;
		#5 sel=2'b01;
		#5 sel=2'b10;
		#5 sel=2'b11;
	end
endmodule
module tb;
	wire [1:0] sel,a,b,res;
	tg t(sel,a,b,res);
	alu al(sel,a,b,res);
endmodule
