`timescale 1ns/1ps
module alu(A,B,alu_out,of,alu_cnrl,zf);
  input [31:0] A,B;
  input [3:0] alu_cnrl;
  output reg [31:0]alu_out;
  output reg of,zf;
  parameter add=4'b0010,
  sub=4'b0110,
  AND=4'b0000,
  OR=4'b0001;
  reg [31:0] B_TEMP;
  always @(*) begin
     alu_out=32'b0;
    case(alu_cnrl)
      add:begin
        alu_out=A+B;
        if((A[31]&&B[31])&&!alu_out[31])of=1'b1;
        else if((!A[31]&&!B[31])&&alu_out[31])of=1'b1;
        else of=1'b0;
      end
      sub:begin
        B_TEMP=~B+1;
        alu_out=A+B_TEMP;
        if((A[31]&&B_TEMP[31])&&!alu_out[31])of=1'b1;
        else if((!A[31]&&!B_TEMP[31])&&alu_out[31])of=1'b1;
        else of=1'b0;
      end
      AND:begin
        alu_out=A&B;
        of=1'b0;
        end
      OR:begin
        alu_out=A|B;
        of=1'b0;
        end
    endcase
  end
  always @(*) begin
    if(!alu_out)
      zf=1'b1;
    else
      zf=1'b0;
  end
endmodule
