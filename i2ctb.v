module i2ctb();
  reg rst,en;
  reg [2:0]maddr;
  reg [7:0]data;
  reg clk;
  reg wr;
  wire [7:0]sdata,out;
  
  i2c tb(rst,en,maddr,data,clk,wr,sdata,out);
  
  always #2 clk=!clk;
  initial begin
    rst=1;en=0;clk=1;
    #5
    rst=0;en=1;
  end
  initial begin
  #5;
  maddr=7'b101;data=8'b10000001;
  #200;
  maddr=7'b111;data=8'b11000110;
  #200;
  maddr=7'b001;data=8'b11110110;
  #200;
  maddr=7'b110;data=8'b11000011;
  #200;
  maddr=7'b000;data=8'b10101010;
  #200;
  maddr=7'b011;data=8'b11001100;
  #200;
  maddr=7'b010;data=8'b00110011;
  #200;
  maddr=7'b100;data=8'b11100010;
  end
  initial begin
    wr=1;
    forever #100 wr=!wr;
  end
endmodule
