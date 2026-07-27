module mux_small(a,b,sel,y);
  input[4:0]a,b;
  input sel;
  output reg [4:0] y;
  
  always @(*)begin
    y=0;
    case(sel)
      1'b0:y=a;
      1'b1:y=b;
    endcase
  end
endmodule
