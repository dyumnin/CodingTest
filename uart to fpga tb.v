module utoftb();
  reg clk,clk2,rst,wr,ren,wen;
  reg [7:0]data;
  wire [7:0]uo;
  wire Tx;
  wire [7:0]fo;
  wire full;
  wire empty;
  uarttofpga utf(data,uo,Tx,fo,full,empty,rst,clk,clk2,wr,wen,ren);
  
 always  #10 clk = ~clk;
 always  #100 clk2 = ~clk2;
 initial
 begin  
  clk=1;
  clk2=1;
  rst=1;
  wr = 0;
  #10;
  rst=0;
  wr = 1;
  wen = 1;
  ren=0;
  data = $random;
  #4800;
  wr=0;
  wen=0;
  ren=0;
  #200;
  wr=0;
  wen=0;
  ren=1;
end
endmodule
  
 
  