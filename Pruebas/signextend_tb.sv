`timescale 1ns/1ps
`include "Sign_Extend.sv"
module signextend_tb;

reg [31:0] IN;
wire [63:0] OUT;

signextend signo (.IN(IN),.OUT(OUT));

initial begin

$dumpfile("prueba_extend.vcd");
$dumpvars(0,signextend_tb);

    IN=32'hFFFFFFFF; //probando otra instruccion que no requiera inmediatos
    #3
    IN={12'b010000100011,5'b10101,3'b010,5'b01010,7'b0000011}; //probando lw
    #3
    IN={7'b0100001,5'b00011,5'b10101,3'b010,5'b10001,7'b0100011}; //probando sw
    #3
    IN={7'b1100001,5'b00011,5'b10101,3'b010,5'b01110,7'b1100011}; //probando beq
    #3

    $finish;
end

endmodule