module pc (
    input logic clk,
    input logic rst,
    input logic [31:0] oldpc,
    output logic [31:0] newpc
);
    always_ff @(posedge clk) begin
        if (rst)
            newpc <= 0;
        else
            newpc <= oldpc;
    end
endmodule
