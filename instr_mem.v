module instr_mem(pc_out,isa);
  input [31:0]pc_out;
  output reg [31:0] isa;
   
  reg [31:0] mem [0:31];
  
  initial begin
    $readmemh("program.mem", mem);
end
  always @(*)begin
      isa=mem[pc_out];
  end
    endmodule
  
