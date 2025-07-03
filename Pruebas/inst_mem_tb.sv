`timescale 1ns/1ps
`include "Inst_Mem.sv"
module inst_mem_tb #(parameter  width=32,depth=80,adr_in=64,mem_shown=10); //mostrar cierta cantidad de registros para verificar su funcionamiento

reg clk,rst;
reg [adr_in-1:0] read_adr;
wire [width-1:0] instruction;

inst_mem #(width,depth,adr_in) memory_test (.clk(clk),.rst(rst),.read_adr(read_adr),.instruction(instruction));

initial forever #5 clk=~clk;

initial begin
$dumpfile("prueba_inst_mem.vcd");
$dumpvars(0);
clk<=1'b0; //reloj inicializado en bajo
rst<=1'b0; //reiniciar el sistema
read_adr={adr_in{1'b0}};
#5
rst<=1'b1;
#10
for(integer a=0;a<mem_shown;a=a+1) begin //inicializar la memoria con valores crecientes
    memory_test.memory[a]=a;
end

for(integer i=0;i<mem_shown;i=i+1) begin //mostrar contenidos de memoria
    read_adr=i;
    #5;
end

    $finish;
end

endmodule