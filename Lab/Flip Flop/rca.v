module rca(a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,s0,s1,s2,s3);
	input a0,a1,a2,a3,b0,b1,b2,b3;
	output car1,car2,car3,car4,s0,s1,s2,s3;
	assign s0=a0^b0^0;
	assign car1=(a0&b0)|(0&(a0^b0));
	assign s1=a1^b1^car1;
	assign car2=(a1&b1)|(car1&(a1^b1));
	assign s2=a2^b2^car2;
	assign car3=(a2&b2)|(car2&(a2^b2));
	assign s3=a3^b3^car3;
	assign car4=(a3&b3)|(car3&(a3^b3));
endmodule
module rca1(a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,s0,s1,s2,s3);
	output reg a0,a1,a2,a3,b0,b1,b2,b3;
	input car1,car2,car3,car4,s0,s1,s2,s3;	
	initial begin		
		$dumpfile("rca.vcd");
		$dumpvars(0,a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,s0,s1,s2,s3);
		a0=1'b0;
		a1=1'b0;
		a2=1'b0;
		a3=1'b0;
		b0=1'b0;
		b1=1'b0;
		b2=1'b0;
		b3=1'b0;
		$monitor($time,,,"addend=%b %b %b %b, augend=%b %b %b %b, sum=%b %b %b %b %b",b3,b2,b1,b0,a3,a2,a1,a0,car4,s3,s2,s1,s0);
		#5 a3=1'b1;a2=1'b0;a1=1'b1;a0=1'b1;
		   b3=1'b0;b2=1'b0;b1=1'b1;b0=1'b1;
		#5 a3=1'b0;a2=1'b1;a1=1'b1;a0=1'b1;
		   b3=1'b1;b2=1'b1;b1=1'b0;b0=1'b0;
		#10 $finish;
	end
endmodule
module wb6;
	wire a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,s0,s1,s2,s3;
	rca obj(a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,s0,s1,s2,s3);
	rca1 obj1(a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,s0,s1,s2,s3);
endmodule
