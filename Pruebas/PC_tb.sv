`timescale 1ns/1ps
`include "PC.sv"
module PC_tb;

reg clk=0,rst=0;
reg [63:0]  IN;
wire [63:0] OUT;

PC PC_test (.clk(clk),.rst(rst),.IN(IN),.OUT(OUT));

initial forever #5 clk=~clk;

initial begin
$dumpfile("prueba_PC.vcd");
$dumpvars(0,PC_tb);

#5
rst<=1'b1;
#3
IN={64'hFFFFFFFFAAAAAAAA);
#10
IN={64'hAAAAAAAAFFFFFFFF};
#10
IN={64{1'b0}};
#10
IN={64'hAAAAAAAABBBBBBBB};
#10


    $finish;
end

endmodule