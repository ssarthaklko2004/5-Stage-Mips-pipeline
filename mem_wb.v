module mem_wb(clk,rst,rf_we_out,reg_file_we,MtoR_out,MemtoReg,data_out_mem,data_in_rf_mem,alu_output1,rf_write_data,write_reg2,write_reg_out2);
  input clk,rst;
  input rf_we_out,MtoR_out;
  input [31:0] data_out_mem,alu_output1;
  output reg [31:0] data_in_rf_mem,rf_write_data;
  output reg MemtoReg,reg_file_we;
  input [4:0]write_reg2;
  output reg [4:0]write_reg_out2;
  always @(posedge clk or posedge rst)
    begin
      if(rst) begin
        MemtoReg<=0;
        reg_file_we<=0;
        data_in_rf_mem<=0;
        rf_write_data<=0;
        write_reg_out2<=0;
      end
      else
        begin
          MemtoReg<=MtoR_out;
          reg_file_we<=rf_we_out;
          data_in_rf_mem<=data_out_mem;
          rf_write_data<=alu_output1;
          write_reg_out2<=write_reg2;
        end
    end
endmodule
  
