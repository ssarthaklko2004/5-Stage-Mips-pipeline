module control(isa,is_itype,alu_op,reg_file_we,reg_file_re,mem_re,mem_we,MemtoReg,beq,jump,address,alu_src);
  reg [5:0] opcode;
  input [31:0] isa;
  output reg MemtoReg,is_itype,reg_file_we,reg_file_re,mem_re,mem_we,beq,jump,alu_src;
  output reg [2:0] alu_op;
  output reg[25:0] address;

  parameter R_type=6'b000000,
   addi=6'b001000,
  lw=6'b100011,
  sw=6'b101011,
  branch_equal=6'b000100,
  j=6'b000010;
  always @(*) begin
    is_itype=0;
         MemtoReg=0;
        reg_file_we=0;
        reg_file_re=0;
         mem_re=0;
        mem_we=0;
        alu_op=3'b000;
    alu_src=0;
    jump=0;
    opcode=isa[31:26];
    case(opcode)
      R_type: begin
         is_itype=0;
         MemtoReg=0;
        reg_file_we=1;
        reg_file_re=1;
         mem_re=0;
        mem_we=0;
        alu_src=0;
        alu_op=3'b010;
      end
      addi:begin
        is_itype=1;
        alu_src=1;
        MemtoReg=0;
        reg_file_we=1;
        reg_file_re=1;
        alu_op=3'b000;
        
      end
      lw:begin
        is_itype=1;
        alu_src=1;
        reg_file_re=1;
        reg_file_we=1;
        mem_re=1;
        MemtoReg=1;
        alu_op=3'b000;
      end
      sw:begin
        is_itype=1;
        alu_src=1;
        MemtoReg=1;
        reg_file_re=1;
        mem_we=1;
        alu_op=3'b000;
      end
      branch_equal: begin
        alu_op=3'b001;
        beq=1;
        alu_src=0;//change mux1 sel signal a new name alu_src
      end
      j:begin
        jump=1;
        address=isa[25:0];//write alu_op here;
      end
    endcase
  end
endmodule
