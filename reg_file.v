
`timescale 1ns/1ns
module reg_file(clk,rst,reg_file_we,reg_file_re,r1_data,r2_data,data_in,isa,mux_op);
  input clk,rst,reg_file_we,reg_file_re;
  wire [4:0] rs,rt,rd;
  input [4:0] mux_op;
  input [31:0] isa;
  output reg [31:0] r1_data,r2_data;
  reg [31:0] rf_mem[0:31];
  input [31:0] data_in;
  integer i; 
  assign rs=isa[25:21];
  assign rt=isa[20:16];
  assign rd=mux_op;
  always @(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          for(i=0;i<32;i=i+1)
            rf_mem[i] <= 32'd0;
        end
        
      else begin
        if(reg_file_we && rd != 0)
          begin
            rf_mem[rd]<=data_in;
          end
      end
    end
      always @(*) begin
        if(reg_file_re) begin
          r1_data=rf_mem[rs];
          r2_data=rf_mem[rt];
          $display("REGFILE READ");
        $display("Instruction = %h", isa);
        $display("rs=%0d rt=%0d", rs, rt);
        $display("rf[%0d]=%h", rs, rf_mem[rs]);
        $display("rf[%0d]=%h", rt, rf_mem[rt]);
        end
        
    end
 
  
endmodule
