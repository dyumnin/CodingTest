module utoftoitb();
  reg clk,clk2,clk3,rst,wr,i2cw,en,ren,wen;
  reg [7:0]data;
  reg [2:0]maddr;
  wire[7:0]sdata;
  wire [7:0]i2cout;
  wire [7:0]uo;
  wire Tx;
  wire [7:0]fo;
  wire full;
  wire empty;
  
   uarttofpgatoi2c utfi(data,uo,Tx,fo,maddr,sdata,i2cout,full,empty,rst,clk,clk2,clk3,wr,wen,ren,en,i2cw);
  
 always  #10 clk = ~clk;
 always  #100 clk2 = ~clk2;
 always  #200 clk3 = ~clk3;
 initial
 begin  
  clk=1;
  clk2=1;
  clk3=1;
  rst=1;
  wr = 0;
  #10;
  rst=0;
   
  wr = 1;
  wen = 1;
  en=1;
  i2cw=0;
  ren=0;
  maddr=$random;
  data = $random;
  #4800;
  i2cw=1;
  wr=0;
  wen=0;
  ren=0;
  #200;
  wr=0;
  wen=0;
  ren=1;
  #200;
  i2cw=1;
  #9600;
  i2cw=0;
end
endmodule