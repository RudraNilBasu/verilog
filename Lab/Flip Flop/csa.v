module csa(a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,car5,car6,car7,car8,s0,s1,s2,s3,s4,s5,s6,s7,cin,cout,sum0,sum1,sum2,sum3);
	input a0,a1,a2,a3,b0,b1,b2,b3,cin;
	output car1,car2,car3,car4,car5,car6,car7,car8,s0,s1,s2,s3,s4,s5,s6,s7,cout,sum0,sum1,sum2,sum3;
	assign s0=a0^b0^0;
	assign car1=(a0&b0)|(0&(a0^b0));
	assign s1=a1^b1^car1;
	assign car2=(a1&b1)|(car1&(a1^b1));
	assign s2=a2^b2^car2;
	assign car3=(a2&b2)|(car2&(a2^b2));
	assign s3=a3^b3^car3;
	assign car4=(a3&b3)|(car3&(a3^b3));
	assign s4=a0^b0^1;
	assign car5=(a0&b0)|(1&(a0^b0));
	assign s5=a1^b1^car5;
	assign car6=(a1&b1)|(car5&(a1^b1));
	assign s6=a2^b2^car6;
	assign car7=(a2&b2)|(car6&(a2^b2));
	assign s7=a3^b3^car7;
	assign car8=(a3&b3)|(car7&(a3^b3));
	assign sum0=(!cin&s0)|(cin&s4);
	assign sum1=(!cin&s1)|(cin&s5);
	assign sum2=(!cin&s2)|(cin&s6);
	assign sum3=(!cin&s3)|(cin&s7);
	assign cout=(!cin&car4)|(cin&car8);
	
endmodule
module csa1(a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,car5,car6,car7,car8,s0,s1,s2,s3,s4,s5,s6,s7,cin,cout,sum0,sum1,sum2,sum3);
	output reg a0,a1,a2,a3,b0,b1,b2,b3,cin;
	input car1,car2,car3,car4,car5,car6,car7,car8,s0,s1,s2,s3,s4,s5,s6,s7,cout,sum0,sum1,sum2,sum3;	
	initial begin		
		$dumpfile("csa.vcd");
		$dumpvars(0,a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,car5,car6,car7,car8,s0,s1,s2,s3,s4,s5,s6,s7,cin,cout,sum0,sum1,sum2,sum3);
		a0=1'b0;
		a1=1'b0;
		a2=1'b0;
		a3=1'b0;
		b0=1'b0;
		b1=1'b0;
		b2=1'b0;
		b3=1'b0;
		cin=1'b0;
		$monitor($time,,,"addend=%b %b %b %b, augend=%b %b %b %b, sum=%b %b %b %b %b",b3,b2,b1,b0,a3,a2,a1,a0,cout,sum3,sum2,sum1,sum0);
		#5 cin=1'b1;
		   a3=1'b1;a2=1'b0;a1=1'b1;a0=1'b1;
		   b3=1'b0;b2=1'b0;b1=1'b1;b0=1'b1;
		#5 cin=1'b0;
		   a3=1'b1;a2=1'b0;a1=1'b1;a0=1'b1;
		   b3=1'b0;b2=1'b0;b1=1'b1;b0=1'b1;
		#5 cin=1'b1;
		   a3=1'b0;a2=1'b1;a1=1'b1;a0=1'b1;
		   b3=1'b1;b2=1'b1;b1=1'b0;b0=1'b0;
		#5 cin=1'b0;
		   a3=1'b0;a2=1'b1;a1=1'b1;a0=1'b1;
		   b3=1'b1;b2=1'b1;b1=1'b0;b0=1'b0;
		#10 $finish;
	end
endmodule
module wb7;
	wire a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,car5,car6,car7,car8,s0,s1,s2,s3,s4,s5,s6,s7,cin,cout,sum0,sum1,sum2,sum3;
	csa obj(a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,car5,car6,car7,car8,s0,s1,s2,s3,s4,s5,s6,s7,cin,cout,sum0,sum1,sum2,sum3);
	csa1 obj1(a0,a1,a2,a3,b0,b1,b2,b3,car1,car2,car3,car4,car5,car6,car7,car8,s0,s1,s2,s3,s4,s5,s6,s7,cin,cout,sum0,sum1,sum2,sum3);
endmodule	
