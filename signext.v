module signext(isa,out);
  input [31:0] isa;
  wire [15:0] in;
  assign in=isa[15:0];
  output reg [31:0] out;
  always @(*) begin
    out[15:0]=in[15:0];
    out[31:16]={16{in[15]}};
  end
endmodule
