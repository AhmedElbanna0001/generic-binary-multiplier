//implementation of a generic array multiplier
module multiplier #(parameter N=4,M=4)
(input [N-1:0]x,//multiplicand of N bit
input [M-1:0]y,//multiplier of M bit
output [N+M-1:0] p//product of N+M bit
);

wire [N-1:0]z [M-1:0];//partial product array
//internal signals			
wire [N-1:0]s [M-1:0]; 
wire [M-1:0]c;		
			
assign p[0]=z[0][0];//Po=Zoo
assign c[0]=1'b0;
assign s[0]=z[0];
generate 
genvar m,n,k;
//generating partial products
for(m=0;m<M;m=m+1)
begin
	for(n=0;n<N;n=n+1)
	begin
	assign z[m][n]=x[n]&y[m];
	end
end 
//adding summands
for(k=0;k<M-1;k=k+1)
begin
n_bit_rca #(N) summand (z[k+1],{c[k],s[k][N-1:1]},1'b0,s[k+1],c[k+1]);
assign p[k+1]=s[k+1][0];
end
endgenerate
assign p[M+N-1:M]={c[M-1],s[M-1][N-1:1]};


endmodule
