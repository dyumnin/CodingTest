module uarttofpga(
  input  [7:0]data,
  output [7:0]uo,
  output Tx,
  output  [7:0]fo,
  output full,empty,
  input rst,clk,clk2,wr,wen,ren);
  
  UART urt(.rst(rst),.clk(clk),.wr(wr),.data(data),.od(uo),.Tx(Tx));
  fifo fifo1(.clk(clk2),.rst(rst),.d(uo),.o(fo),.full(full),.empty(empty),.wen(wen),.ren(ren));
endmodule
  
  
  