//implementation of halfadder 
module HA(input x,y,
output s,c_out
);
assign s=x^y;
assign c_out=x&y;


endmodule 
