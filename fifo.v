module fifo(clk,rst,d,o,full,empty,wen,ren);
input clk,rst,wen,ren;
input[7:0]d;
output reg [7:0]o;
output full,empty;
reg [7:0]wptr,rptr;
reg[7:0]mem[0:32];
assign full=(wptr-rptr)==32? 1:0;
assign empty = (wptr==rptr)? 1:0;
always@(posedge clk)
if(rst)
begin
o<=0;
wptr<=0;
rptr<=0;
end
else if (wen && !full)
begin
mem[wptr]<=d;
wptr <= wptr+1;
end 
else if(ren && !empty)
begin
o <= mem[rptr];
rptr <= rptr+1;
end
endmodule

