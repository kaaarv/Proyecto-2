module mux21 (
    input wire SEL,
    input wire [63:0] IN0,IN1,
    output reg [63:0] OUT
);

always_comb begin 
    if(!SEL)
        OUT=IN0;
    else 
        OUT=IN1;
end
    
endmodule