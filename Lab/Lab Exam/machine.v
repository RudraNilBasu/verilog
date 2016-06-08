module fsm(input clk,inp,rst,output reg out);
	reg [2:0] currState; // current State
	reg [2:0] nextState;
	always @(inp,currState)
	begin
		//$display("currState= %b%b%b ",currState[2],currState[1],currState[0]);
		if(currState==3'b000)
		begin
			if(inp)
				nextState=3'b001;
			else
				nextState=3'b000;
		end
		else if(currState==3'b001)
		begin
			if(inp)
				nextState=3'b001;
			else
				nextState=3'b010;
		end
		else if(currState==3'b010)
		begin
			if(inp)
				nextState=3'b100;
			else
				nextState=3'b011;
		end
		else if(currState==3'b011)
		begin
			if(inp)
				nextState=3'b001;
			else
				nextState=3'b000;
		end
		else if(currState==3'b100)
		begin
			if(inp)
				nextState=3'b001;
			else
				nextState=3'b000;
		end

		out=0;
		if(nextState==3)
			out=1;
		if(nextState==4)
			out=1;

	end
	always @(posedge clk,rst)
	begin
		if(rst)
			currState<=3'b000;
		else
			currState<=nextState;
/*		
		out<=1'b0;
		if(currState==3'b011)
			out<=1'b1;
		if(currState==3'b100)
			out<=1'b1;
*/		
	end
endmodule
module test_gen;
	reg clk,inp,rst;
	wire out;
	fsm dut(clk,inp,rst,out);
	reg [6:0] sequence;
	integer i;
	initial begin
		rst=1;
		#5 rst=0;
		sequence=6'b101001;
		for(i=0;i<=5;i=i+1)
		begin
			$display("Current State = ",dut.currState, " Input =  ",sequence[i]);
			inp=sequence[i];
			//#2 clk=0;
			#2 clk=1;
			#2 clk=0;
			$display("Next State=",dut.currState," Output= ",dut.out);
			$display("----------------------");
		end
	end
endmodule
