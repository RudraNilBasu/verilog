module halfAdder(a,b,carry,sum);
	// a, b => one bit numbers to be added
	// carry => the carry generated
	// sum => the sum generated
	input a,b;
	output sum,carry;
	xor(sum,a,b); // sum is the xor of a and b
	and(carry,a,b); // carry is the and of a and b
endmodule
module test_gen(a,b,carry,sum);
	// test generator to simulate the values of halfAdder
	output reg a,b;
	input carry,sum;
	initial begin
		$dumpfile("halfAdder.vcd");
		$dumpvars(a,b,carry,sum);
		$monitor($time,,,"%b + %b = %b (Sum) %b(Carry)",a,b,sum,carry);
		a=0;b=0;
		#5 a=1;b=0;
		#5 a=0;b=1;
		#5 a=1;b=1;
		#5 $finish;
	end
endmodule
module test_bench;
	// connecting the halfAdder and test_gen module
	wire a,b,carry,sum;
	test_gen t(a,b,carry,sum);
	halfAdder ha(a,b,carry,sum);
endmodule
