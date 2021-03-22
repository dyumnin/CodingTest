module i2c(rst,en,maddr,i2cdata,clk,wr,sdata,out);
  input rst,en;
  input [2:0]maddr;
  input [7:0]i2cdata;
  reg [2:0]sa_temp;
  reg [2:0]saddr;
  output reg [7:0]sdata;
  output reg [7:0]out;
  input clk;
  reg sda;
  integer count;
  reg ack;
  input wr;
  
  reg [2:0]state;
  
  parameter idle=3'd0,
            start=3'd1,
            address=3'd2,
            acknowledgement=3'd3,
            operation=3'd4,
            write=3'd5,
            read=3'd6,
            stop=3'd7;
   
  always@(posedge clk)
  begin
    if(rst==1)
      begin
        state<=idle;
        sda<=1;
        out<=8'b00000000;
        sdata<=8'b00000000;
      end
    else
      begin                
        case(state)
          idle:if(en==1)
                 begin
                   saddr<=3'b000;
                   sa_temp<=3'b000;
                   #1 sda<=0;
                   state<=start;
                 end
               else
                 begin
                   sda<=1;
                   state<=idle;
                 end
          start:if(sda==0)
                  begin
                    count<=3;
                    state<=address;
                  end
                else
                  begin
                    state<=idle;
                  end
          address:if(count==-1)
                    begin
                      state<=acknowledgement;
                    end
                  else
                    begin
                      sda<=maddr[count-1];
                      sa_temp[count]<=sda;
                      count<=count-1;                    
                      state<=address;
                    end
          acknowledgement:if(sa_temp==saddr)
                            begin
                              state<=operation;
                              ack<=1;
                            end
                          else
                            begin
                              saddr<=saddr+1;
                              ack<=0;
                            end
          operation:if(wr==1)
                      begin
                        state<=write;
                        count<=8;
                      end
                    else
                      begin
                        state<=read;
                        count<=8;
                      end
          write:if(count==-1)
                  begin
                    #1 sda<=1;
                    state<=stop;
                  end
                else
                  begin
                    sda<= i2cdata[count-1];
                    sdata[count]<=sda;
                    count<=count-1;
                    state<=write;
                  end
          read:if(count==-1)
                  begin
                    #1 sda<=1;
                    state<=stop;
                  end
                else
                  begin
                    sda<=sdata[count-1];
                    out[count]<=sda;
                    count<=count-1;
                    state<=read;
                  end
          stop:if(count==-1)
                  begin
                    sda<=1;
                    state<=idle;
                  end
        endcase
      end
  end
endmodule
