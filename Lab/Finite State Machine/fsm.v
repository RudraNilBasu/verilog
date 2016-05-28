module fsm( clk, rst, inp, outp);

   input clk, rst, inp;
   output outp;

   reg [1:0] state;
   reg outp;

   always @( posedge clk, posedge rst )
   begin
   if( rst )
       state <= 2'b00;
   else
   begin
       case( state )
       2'b00:
       begin
            if( inp ) state <= 2'b01;
            else state <= 2'b10;
       end

       2'b01:
       begin
            if( inp ) state <= 2'b11;
            else state <= 2'b10;
       end

       2'b10:
       begin
            if( inp ) state <= 2'b01;
            else state <= 2'b11;
       end

       2'b11:
       begin
            if( inp ) state <= 2'b01;
            else state <= 2'b10;
       end
       endcase
   end
end


always @(posedge clk, posedge rst)
begin
    if( rst )
       outp <= 0;
    else if( state == 2'b11 )
       outp <= 1;
    else outp <= 0;

end

endmodule
module fsm_test;

reg  clk, rst, inp;
wire outp;
reg[15:0] sequence;
integer i;

fsm dut( clk, rst, inp, outp);

initial
begin

   clk = 0;
        rst = 1;
        sequence = 16'b0101_0111_0111_0010;
   #5 rst = 0;

   for( i = 0; i <= 15; i = i + 1)
   begin
      inp = sequence[i];
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", dut.state, " Input = ", inp, ", Output = ", outp);

   end
        test2;
end
task test2;
   for( i = 0; i <= 15; i = i + 1)
   begin
      inp = $random % 2;
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", dut.state, " Input = ", inp, ", Output = ", outp);

   end
endtask


endmodule
