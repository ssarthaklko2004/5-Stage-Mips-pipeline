module if_id(clk,rst,if_pc,if_instr,id_instr,id_pc);
  input clk,rst;
  input [31:0] if_pc,if_instr;
  output reg [31:0] id_instr,id_pc;
  always @(posedge clk or posedge rst)
    begin
      if(rst) begin
        id_instr<=0;
        id_pc<=0;
      end
      else begin
      id_pc<=if_pc;
        id_instr<=if_instr;
    end
    end
endmodule
