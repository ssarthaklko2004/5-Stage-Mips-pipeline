`timescale 1ns/1ns
module pc(pc_out,clk,rst,pc_in);
  
  input clk;
  input rst;
  output reg [31:0] pc_out;
  input [31:0] pc_in;
  always @(posedge clk or posedge rst) 
    begin
      if(rst)
        pc_out<=0;
      else begin
            pc_out<=pc_in;
        
        end
    end
endmodule
