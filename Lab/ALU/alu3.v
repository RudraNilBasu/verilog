module alu(a0,a1,a2,a3,b0,b1,b2,b3,sel1,sel2,x0,x1,x2,x3,clk);
	input a0,a1,a2,a3,b0,b1,b2,b3,sel1,sel2,clk;
	output reg x0,x1,x2,x3;
	always @(posedge clk)
	begin
	if(sel1==0)
	begin	
		if(sel2==0)
		begin
			x0=a0+b0;
			x1=a1+b1;
			x2=a2+b2;
			x3=a3+b3;
		end
		else
		begin	
			x0=a0&b0;
			x1=a1&b1;
			x2=a2&b2;
			x3=a3&b3;
		end
	end
	else
	begin
		if(sel2==0)
		begin
			 x0=a0^b0;
			 x1=a1^b1;
			 x2=a2^b2;
			 x3=a3^b3;
		end
		else
		begin
			x0=~a0;
			x1=~a1;
			x2=~a2;
			x3=~a3;
		end
	end
	end
endmodule
module ini(a0,a1,a2,a3,b0,b1,b2,b3,sel1,sel2,x0,x1,x2,x3,clk);
//reg t,t1;
	output reg a0,a1,a2,a3,b0,b1,b2,b3,sel1,sel2,clk;
	input x0,x1,x2,x3;
	initial begin
		$dumpfile("alu.vcd");
		$dumpvars(a0,a1,a2,a3,b0,b1,b2,b3,sel1,sel2,x0,x1,x2,x3,clk);
		$monitor("a=%b%b%b%b ",a0,a1,a2,a3,"b=%b%b%b%b ",b0,b1,b2,b3,"Output=%b%b%b%b",x0,x1,x2,x3,"When Select = %b%b",sel1,sel2);
		clk=1'b0;
		a0=1'b0;
		a1=1'b0;
		a2=1'b1;
		a3=1'b0;

		b0=1'b0;
		b1=1'b0;
		b2=1'b0;
		b3=1'b0;
		#5 clk=1'b1;
		sel1=1'b0;
		sel2=1'b0;
		#1 clk=1'b0;
		#1 clk=1'b1;sel2=1'b1;

		#5 clk=1'b0;
		#1 clk=1'b1;sel1=1'b1;sel2=1'b0;
		#1 clk=1'b0;
		#1 clk=1'b1;sel2=1'b1;
	

	end
//end
endmodule
module wb;
	wire a0,a1,a2,a3,b0,b1,b2,b3,sel1,sel2,x0,x1,x2,x3,clk;
	alu test(a0,a1,a2,a3,b0,b1,b2,b3,sel1,sel2,x0,x1,x2,x3,clk);
	ini test2(a0,a1,a2,a3,b0,b1,b2,b3,sel1,sel2,x0,x1,x2,x3,clk);
endmodule
