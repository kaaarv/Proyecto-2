`timescale 1ns/1ps
`include "adder.sv"
module z_adder_tb;

reg [63:0] A,B;
wire [63:0] Q;

adder adder_test(.A(A),.B(B),.Q(Q));
initial begin

    $dumpfile("prueba_adder");
    $dumpvars(0,z_adder_tb);

    for(integer i=0;i<4;i=i+1) begin
    A=$random;
    B=$random;
    #1;
    end

    $finish;
end
    
endmodule