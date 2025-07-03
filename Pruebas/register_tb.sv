`timescale 1ns/1ps
`include "Register.sv"
module register_tb #(parameter width=64,depth=32);

 reg rst; //senales de control.
 reg clk;
 reg regwrite;

 reg [$clog2(depth)-1:0] adr_reg1, adr_reg2, adr_wr_reg; //direcciones de registros .
    
 reg [width-1:0] wr_data; //dato para escritura.

 wire [width-1:0] reg_data1, reg_data2; //salidas de registros.

register #(width,depth) memory_test (.clk(clk),.rst(rst),.regwrite(regwrite),
.adr_reg1(adr_reg1),.adr_reg2(adr_reg2),.adr_wr_reg(adr_wr_reg),
.wr_data(wr_data),.reg_data1(reg_data1),.reg_data2(reg_data2)
);

initial forever #5 clk=~clk;

initial begin

$dumpfile("prueba_register.vcd");
$dumpvars(0,register_tb);

regwrite<=1'b0;
clk<=1'b0;
rst<=1'b0;
adr_reg1=5'b00000;
adr_reg2=5'b00000;
adr_wr_reg=5'b00010;
wr_data=64'hAABBCCDDAABBCCDD;

#5
rst<=1'b1;
regwrite<=1'b1;
#15
adr_reg1=5'b00010;
#20
    $finish;
end

endmodule