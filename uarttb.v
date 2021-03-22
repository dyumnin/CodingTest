module uarttb();
 reg rst,clk,wr;
reg [7:0]data;
wire [7:0] od;
wire Tx;


UART uart1(.rst(rst),.clk(clk),.wr(wr),.data(data),.od(od),.Tx(Tx));

always  #10 clk = ~clk;
initial
begin
  clk=1;
  rst=1;
  wr=0;
  #100;
  rst=0;
  wr=1;
  data = $random;
  #100;
end
endmodule