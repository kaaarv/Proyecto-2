module PC (
    input wire clk,rst,
    input wire [63:0]  IN,
    output reg [63:0] OUT
);

always_ff @(posedge clk) begin
if(!rst) begin
    OUT=64'b0;
end
else begin
    OUT=IN;
end
end
    
endmodule