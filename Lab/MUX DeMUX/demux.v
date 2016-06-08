module demux(s0,s1,i0,o1,o2,o3,o4);
	input s0,s1,i0;
	output o1,o2,o3,o4;
	wire sel0,sel1,o1,o2,o3,o4;
	not not1(sel0,s0);
	not not2(sel1,s1);
	and and1(o1,sel1,sel0,i0);
	and and2(o2,sel1,s0,i0);
	and and3(o3,sel0,s1,i0);
	and and4(o4,s0,s1,i0);
endmodule
module demux2(s0,s1,i0,o1,o2,o3,o4);
	output reg s0,s1,i0;
	input o1,o2,o3,o4;	
	initial begin		
		$dumpfile("demux.vcd");
		$dumpvars(0,s0,s1,i0,o1,o2,o3,o4);
		s1=1'b0;
		i0=1'b0;
		s0=1'b0;
		$monitor($time,,,"s1=%b, s0=%b, i0=%b, o1=%b, o2=%b, o3=%b, o4=%b",s1,s0,i0,o1,o2,o3,o4);
		#2 s0=1'b0;
		s1=1'b0;
		i0=1'b1;
		#3 s0=1'b1;
		s1=1'b0; 
		i0=1'b1;				
		#2 s0=1'b0;
		s1=1'b1;
		i0=1'b1;
		#6 s0=1'b1;
		s1=1'b1;
		i0=1'b1;		  
		#10 $finish;
	end
endmodule
module wb2;
	wire s0,s1,i0,o1,o2,o3,o4;
	demux obj(s0,s1,i0,o1,o2,o3,o4);
	demux2 obj1(s0,s1,i0,o1,o2,o3,o4);
endmodule
