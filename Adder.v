//implementation of generic ripple carry adder using FAs
module n_bit_rca
#(parameter n=4)
(
input [n-1:0] x,y,
input c_in,
output [n-1:0] s,
output c_out

);

wire [n:0] c;
assign c[0]=c_in;
assign c_out=c[n];
generate
genvar i;
for(i=0;i<n;i=i+1)
begin
FA FA(
.x(x[i]),
.y(y[i]),
.c_in(c[i]),
.s(s[i]),
.c_out(c[i+1])

);
end


endgenerate




endmodule
