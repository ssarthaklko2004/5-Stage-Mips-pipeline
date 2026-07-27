module alu_controller(alu_op,isa,alu_cnrl);
  input [31:0] isa;
  input [2:0] alu_op;
  output reg [3:0] alu_cnrl;
  wire [5:0] funct;
  assign funct=isa[5:0];
  always @(*) begin
    if(alu_op==3'b010)begin
      if(funct==6'b100000)
        alu_cnrl=4'b0010;
      else if(funct==6'b100010)
        alu_cnrl=4'b0110;
      else if(funct==6'b100100)
        alu_cnrl=4'b0000;//make this case staement better and clean
      else if(funct==6'b100101)
        alu_cnrl=4'b0001;
      
    end
    else if(alu_op==3'b000)
      alu_cnrl=4'b0010;
    else if(alu_op==3'b001)
      alu_cnrl=4'b0110;
    else if(alu_op==3'b100)
      alu_cnrl=4'b0000;
  end
endmodule
    
