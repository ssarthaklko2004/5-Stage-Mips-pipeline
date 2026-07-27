module id_ex(clk,rst,reg_file_we,mem_re,mem_we,MemtoReg,beq,jump,address,alu_cnrl,r1_data,r2_data,rf_we,m_re,m_we,MtoR,branch,jmp,alu_cnrl_id_ex,add,r1,r2,alu_src,alu_source,signext_op_id_ex,input_sign_ext,write_reg_out0,write_reg0);
  input clk,rst;
  input reg_file_we,mem_re,mem_we,MemtoReg,beq,jump;
  input [3:0] alu_cnrl;
  input [25:0] address;
  input  [31:0] r1_data,r2_data,input_sign_ext;
  output reg rf_we,m_re,m_we,MtoR,branch,jmp;
  output reg [3:0] alu_cnrl_id_ex;
  output reg [25:0] add;
  output reg [31:0] r1,r2,signext_op_id_ex;
  output reg alu_source;
  input alu_src;
  input [4:0] write_reg0;
  output reg [4:0] write_reg_out0;
  always @(posedge clk or posedge rst) begin
    if(rst)
      begin
        rf_we<=0;
        m_re<=0;
        m_we<=0;
        MtoR<=0;
        branch<=0;
        jmp<=0;
        add<=0;
      end
  else
    begin
        rf_we<=reg_file_we;
        m_re<=mem_re;
        m_we<=mem_we;
        MtoR<=MemtoReg;
        branch<=beq;
        jmp<=jump;
        add<=address;
      r1<=r1_data;
      r2<=r2_data;
      alu_source<=alu_src;
      alu_cnrl_id_ex<=alu_cnrl;
      signext_op_id_ex<=input_sign_ext;
      write_reg_out0<=write_reg0;
    end
  end
endmodule
