`timescale 1ns/1ps
`include "ALU.sv"
module ALU_tb;

  reg [63:0] A,B;
  reg [3:0] ALU_operation;

  wire [63:0] ALU_result;
  wire  zero;

 ALU ALU_prueba   (.A(A),.B(B),.ALU_operation(ALU_operation),.ALU_result(ALU_result),.zero(zero0));
 
initial begin

    
$dumpfile("prueba_ALU");
$dumpvars(0,ALU_tb);

A=64'd45;
B=64'd67;
ALU_operation=4'b0000;
#1
ALU_operation=4'b0001;
#1
ALU_operation=4'b0010;
#1
ALU_operation=4'b0110;
#1
A=64'd33;
B=64'd33;
#1
A=64'd67;
B=64'd45;
ALU_operation=4'b0000;
#1
ALU_operation=4'b0001;
#1
ALU_operation=4'b0010;
#1
ALU_operation=4'b0110;
#1
A=64'd33;
B=64'd33;
#1
ALU_operation=4'b1111; //Operacion invalida
#1

$finish;
end
    
    
endmodule

