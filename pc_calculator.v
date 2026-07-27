module pc_calculator(pc_in_jump,pc_in_branch,pc_in_normal,zf,clk,rst,imm_32,beq,pc_out,jump,address,flush,pc_out_branch);
  input zf,clk,rst,beq,jump,flush;
  input [31:0] imm_32;
  input [31:0] pc_out,pc_out_branch;
  output reg [31:0] pc_in_jump,pc_in_branch,pc_in_normal;
  input [25:0] address;
  always @(*) begin
    if(rst) begin
      pc_in=0;
      flush=0;
    end
    else
      begin
        flush=0;
        if(jump==1) begin
          pc_in_jump={6'b0,address};
          flush=1;
        end
        else if(zf==1 &&beq==1) begin
          pc_in_branch=pc_out_branch+imm_32;
          flush=1;
        end
        
          else
          pc_in_normal=pc_out+1;
      end
  end
endmodule
  
