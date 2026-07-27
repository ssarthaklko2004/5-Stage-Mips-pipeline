module ex_mem(alu_output0,alu_out,clk,rst,m_re,m_we,rf_we,MtoR,r2,m_re_out,m_we_out,rf_we_out,MtoR_out,data_in_mem,write_reg_out1,write_reg1);
  input [31:0] alu_out,r2;
  input clk,rst,m_re,m_we,MtoR,rf_we;
  output reg [31:0] alu_output0;
  output reg [31:0] data_in_mem;
  output reg m_re_out,m_we_out,rf_we_out,MtoR_out;
  input [4:0] write_reg1;
  output reg [4:0] write_reg_out1;
  
  always @(posedge clk or posedge rst)
    begin
      if(rst) begin
        m_re_out<=0;
        m_we_out<=0;
        rf_we_out<=0;
        MtoR_out<=0;
        data_in_mem<=0;
        alu_output0<=0;
        write_reg_out1<=0;
      end
      else begin
        m_re_out<=m_re;
        m_we_out<=m_we;
        rf_we_out<=rf_we;
        MtoR_out<=MtoR;
        data_in_mem<=r2;
        alu_output0<=alu_out;
        write_reg_out1<=write_reg1;
      end
        
    end
endmodule
  
  
