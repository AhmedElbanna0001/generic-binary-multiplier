//implementation of fulladder
module FA(input x,y,c_in,
output s,c_out
);
wire c1,c2,s1;
HA halfadder1(x,y,s1,c1);
HA halfadder2(s1,c_in,s,c2);
assign c_out=c1 | c2;

endmodule
