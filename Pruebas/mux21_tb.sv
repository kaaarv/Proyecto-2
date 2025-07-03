`timescale 1ns/1ps
`include "mux21.sv"
module Mux2_1_tb;

 reg SEL;
 reg [63:0] IN0,IN1;
 wire [63:0] OUT;

mux21 mux (.SEL(SEL),.IN0(IN0),.IN1(IN1),.OUT(OUT));

initial begin
$dumpfile("prueba_mux21.vcd");
$dumpvars(0,z_mux21_tb);

    IN0={64{1'b1}};
    IN1={64{1'b0}};
    SEL=1'b0;
    #1
    SEL=1'b1;
    #1

    $finish;
end

endmodule