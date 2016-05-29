module fullAdder(a,b,c,carry,sum);
	// a, b, c => one bit numbers to be added
	// carry => the carry generated
	// sum => the sum generated
	input a,b,c;
	output sum,carry;
	xor(sum,a,b,c); // sum is the xor of a and b
	and(c1,a,b); // carry is the and of a and b
	and(c2,a,c);
	and(c3,c,b);
	or(carry,c1,c2,c3);
endmodule
module test_gen(a,b,c,carry,sum);
	// test generator to simulate the values of halfAdder
	output reg a,b,c;
	input carry,sum;
	initial begin		
	$monitor($time,,,"%b + %b + %b = %b (Sum) %b(Carry)",a,b,c,sum,carry);
		a=0;b=0;c=0;
		#5 a=1;b=0;c=1;
		#5 a=0;b=1;
		#5 a=1;b=1;c=1;
		#5 $finish;
	end
endmodule
module test_bench;
	// connecting the halfAdder and test_gen module
	wire a,b,c,carry,sum;
	fullAdder ha(a,b,c,carry,sum);
	test_gen t(a,b,c,carry,sum);
endmodule
