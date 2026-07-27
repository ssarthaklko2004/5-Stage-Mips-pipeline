module mux(a,b,sel,y);
  input[31:0]a,b;
  input sel;
  output reg [31:0] y;
  
  always @(*)begin
    case(sel)
      1'b0:y=a;
      1'b1:y=b;
    endcase
  end
endmodule
