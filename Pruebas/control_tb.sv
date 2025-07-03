`timescale 1ns/1ps
`include "Control_Unit.sv"
module control_tb;

reg [10:0] instruction = 0;  // los primeros 7 bits son Instruction[6:0],
                                    //los siguientes tres son  Instruction[14:12],
                                    //the next bit is Instruction[30]
                                    //el msb es zero
reg Branch,MemtoReg,MemWrite,ALUSrc,RegWrite; //Branch va directo al mux21 de arriba
reg [3:0] ALUOp;
reg zero = 0;



 control control_prueba   ( .instruction(instruction),
                            .zero(zero),
                            .Branch(Branch),
                            .MemtoReg(MemtoReg),
                            .MemWrite(MemWrite),
                            .ALUSrc(ALUSrc),
                            .RegWrite(RegWrite),
                            .ALUOp(ALUOp)
);

initial begin
    $dumpfile("prueba_Deco");
    $dumpvars(0,control_tb);

    // Apply some test vectors
    #10 {zero, instruction} = {1'b0, 1'b0, 3'b000, 7'b0000011};  // LW
    #10 {zero, instruction} = {1'b0, 1'b0, 3'b000, 7'b0100011};  // SW
    #10 {zero, instruction} = {1'b0, 1'b0, 3'b000, 7'b0110011};  // ADD
    #10 {zero, instruction} = {1'b0, 1'b1, 3'b100, 7'b0110011};  // SUB
    #10 {zero, instruction} = {1'b0, 1'b0, 3'b111, 7'b0110011};  // AND
    #10 {zero, instruction} = {1'b0, 1'b0, 3'b110, 7'b0110011};  // OR
    #10 {zero, instruction} = {1'b1, 1'b0, 3'b000, 7'b1100011};  // BEQ, jump
    #10 {zero, instruction} = {1'b0, 1'b0, 3'b000, 7'b1100011};  // BEQ, continue

    // End the simulation
    #20 $finish;
  end

endmodule


