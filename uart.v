module trans(
input rst,clk,wr,
input [7:0] d,
output reg x
);
reg [2:0] state;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
reg[3:0] count;
reg[3:0] word_len,b_count=4'b1011;
reg[10:0] frame;
reg b_clk;
reg b=0,start=1'b0,stop=1'b1;
wire pb;
assign pb=~^d;
always@(posedge clk)
begin
if(rst==1)
begin
count<=4'b0000;
word_len=4'b0000;
b=0;
state=s0;
end
else if(wr)
begin
b=1;
case(state)
s0:begin
if(b==0)
begin
state=s0;
end
else
begin
state=s1;
count<=4'b0000;
end
end
s1:begin
if(count!=4'b0111)
begin
state=s1;
frame={start,d,pb,stop};
count<=count+1;
end
else
begin
state=s3;
count<=4'b0000;
b_clk=1;
end
end
s2:begin
if(count!=4'b0111)
begin
state=s2;
count<=count+1;
end
else
begin
state=s3;
b_clk=1;
count<=4'b0000;
end
end
s3:begin
if(b_clk==1)
begin
word_len=word_len+1;
state=s2;
frame=frame>>1;
b_clk=0;
end
else
begin
state=s2;
end
if(b_count==word_len)
begin
word_len=4'b0000;
state=s4;
end
end
s4:begin
if(count!=4'b0111)
begin
state=s4;
count<=count+1;
end
else
begin
state=s1;
count<=4'b0000;
end
end
endcase
end
end
always@(*)
begin
if(rst==1)
begin
x=1'b0;
end
else
begin
case(state)
s3:begin
x=frame[0];
end
endcase
end
end
endmodule



module rece(
input rst,clk,wr,
input Rx,
output reg [7:0]data1
);
reg [2:0] state;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
reg[3:0] count;
reg[3:0] word_len,b_count=4'b1011;
reg[10:0] frame1;
reg b_clk;
reg b=0;
always@(posedge clk)
begin
if(rst==1)
begin
count<=4'b0000;
word_len=4'b0000;
b=0;
state=s0;
end
else if(wr)
begin
b=1;
case(state)
s0:begin
if(b==0)
begin
state=s0;
end
else
begin
state=s1;
count<=4'b0000;
end
end
s1:begin
if(count!=4'b0111)
begin
state<=s1;
frame1={11'b0};
count<=count+1;
end
else
begin
state=s3;
count<=4'b0000;
end
end
s2:begin
if(count!=4'b0011)
begin
state=s2;
count<=count+1;
b_clk=0;
end
else
begin
frame1=frame1>>1;
state=s3;
count<=4'b0000;
end
end
s3:begin
if(count!=4'b0100)
begin
state=s3;
count<=count+1;
end
else
begin
b_clk=1;
frame1[10]=Rx;
count<=4'b0000;
word_len=word_len+1;
state=s2;
end
if(b_count==word_len)
begin
word_len=4'b0000;
state=s4;
end
end
s4:begin
if(Rx==1)
begin
state=s1;
end
end
endcase
end
end
always@(Rx)
begin
if(rst==1)
begin
data1=8'b0;
end
else
begin
case(state)
s4:begin
data1=frame1[9:1];
end
endcase
end
end

endmodule


module UART(input rst,clk,wr,
input [7:0]data,
output [7:0] od,
output Tx
);
trans tr(.rst(rst),.clk(clk),.wr(wr),.d(data),.x(Tx));
rece re(.rst(rst),.clk(clk),.wr(wr),.Rx(Tx),.data1(od));
endmodule
