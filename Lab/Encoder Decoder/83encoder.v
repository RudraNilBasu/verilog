module encode(i0,i1,i2,i3,i4,i5,i6,i7,o0,o1,o2);
	input i0,i1,i2,i3,i4,i5,i6,i7;
	output o0,o1,o2;
	assign o0=(i1|i3|i5|i7);	
	assign o1=(i2|i3|i6|i7);
	assign o2=(i4|i5|i6|i7);
endmodule
module test(i0,i1,i2,i3,i4,i5,i6,i7,o0,o1,o2);
	output reg i0,i1,i2,i3,i4,i5,i6,i7;
	input o0,o1,o2;
	initial begin
		$dumpfile("encoder.vcd");
		$dumpvars(0,i0,i1,i2,i3,i4,i5,i6,i7,o0,o1,o2);
		
		$monitor($time,,,"input=%b%b%b%b%b%b%b%b output=%b%b%b",i7,i6,i5,i4,i3,i2,i1,i0,o0,o1,o2);
		i0<=1'b0;i1<=1'b0;i2<=1'b0;i3<=1'b0;i4<=1'b0;i5<=1'b0;i6<=1'b0;i7<=1'b0;//o0<=1'b0;o1<=1'b0;o2<=1'b0;
		{i7,i6,i5,i4,i3,i2,i1,i0}=#5 8'b00000001;
		{i7,i6,i5,i4,i3,i2,i1,i0}=#5 8'b00000010;
		{i7,i6,i5,i4,i3,i2,i1,i0}=#5 8'b00000100;
		{i7,i6,i5,i4,i3,i2,i1,i0}=#5 8'b00001000;
		{i7,i6,i5,i4,i3,i2,i1,i0}=#5 8'b00010000;
		{i7,i6,i5,i4,i3,i2,i1,i0}=#5 8'b00100000;
		{i7,i6,i5,i4,i3,i2,i1,i0}=#5 8'b01000000;
		{i7,i6,i5,i4,i3,i2,i1,i0}=#5 8'b10000000;
		#10 $finish;
	end
endmodule
module wb10;
	wire i0,i1,i2,i3,i4,i5,i6,i7,o0,o1,o2;
	encode obj(i0,i1,i2,i3,i4,i5,i6,i7,o0,o1,o2);
	test obj1(i0,i1,i2,i3,i4,i5,i6,i7,o0,o1,o2);
endmodule
