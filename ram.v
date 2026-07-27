`timescale 1ns/1ns
module ram(data_out,data_in,addr,mem_re,mem_we,clk);
  input [31:0] data_in;
  input clk;
  input mem_we,mem_re;
  input [7:0] addr;
  output  reg [31:0] data_out;
  reg[31:0] mem[0:255];
  always @(*) begin
    if(mem_re)
      data_out=mem[addr];
    else
      data_out=0;
  end
  always @(posedge clk) begin
    if(mem_we)
          mem[addr]<=data_in;
         
  end

end
    endmodule
