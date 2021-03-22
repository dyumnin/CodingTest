module uarttofpgatoi2c(
  input  [7:0]data,
  output  [7:0]uo,
  output Tx,
  output [7:0]fo,
  input [2:0]maddr,
   output [7:0]sdata,
   output  [7:0] i2cout,
  output full,empty,
  input rst,clk,clk2,clk3,wr,wen,ren,en,i2cw);
  
  UART urt(.rst(rst),.clk(clk),.wr(wr),.data(data),.od(uo),.Tx(Tx));
  fifo fifo1(.clk(clk2),.rst(rst),.d(uo),.o(fo),.full(full),.empty(empty),.wen(wen),.ren(ren));
  i2c   i2c1(.rst(rst),.en(en),.maddr(maddr),.i2cdata(fo),.clk(clk3),.wr(i2cw),.sdata(sdata),.out(i2cout));
endmodule
 