module adder(
    input wire [63:0]  A,B,
    output wire [63:0]  Q
);

    assign Q = A + B;

endmodule
