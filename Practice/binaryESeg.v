module binaryToESeg;
	wire p1,p2,p3,p4,eSeg;
	reg A,B,C,D;

	nand #1 // #1 denotes that there is a delay of 1 time unit
		g1(p1,C,~D),
		g2(p2,A,B),
		g3(p3,~B,~D),
		g4(p4,A,C),
		g5(eSeg,p1,p2,p3,p4);
	initial // Simulator - to propagate the changed values from the outputs of gates and registers to other gate and module inputs.
	begin
		#10 A=0; B=0; C=0; D=0;
		#10 D=1;
		#10 C=1; D=0;
		#10 $finish;
	end
endmodule
