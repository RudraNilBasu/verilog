module mux41(select,d,q);
	input[1:0] select;
	input[3:0] d;
	output q;
	wire q;
	wire[1:0] select;
	wire[3:0] d;
	assign q=d[select];
endmodule
module mux;
	reg[3:0] d;
	reg[1:0] select;
	wire q;
	integer i;
	mux41 obj(select,d,q);	
	initial begin		
		$dumpfile("mux41.vcd");
		$dumpvars(0,select,d,q);
		$monitor($time,,,"d=%b",d," |select=",select," |q=",q);
		for(i=0;i<=15;i=i+1)
		begin
			d=i;
			select=0;
			#1 select=1;
			#1 select=2;
			#1 select=3;
			#1;
			$display("-------------------------------------------");
		end
	end
endmodule
