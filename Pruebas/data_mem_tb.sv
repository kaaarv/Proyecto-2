`timescale 1ns/1ps
`include "Data_Mem.sv"
module data_mem_tb;

reg clk,rst,wrt_en;
reg [63:0] address;
reg [63:0] write_data;
wire [63:0] read_data;

data_mem memory_test (.clk(clk),.rst(rst),.wrt_en(wrt_en),.address(address),.write_data(write_data),.read_data(read_data));

initial forever #5 clk=~clk;

initial begin
$dumpfile("prueba_data_mem.vcd");
$dumpvars(0,data_mem_tb);
clk<=1'b0;
wrt_en<=1'b0;
rst<=1'b0;
write_data=64'h1122334455667788;
#5
rst<=1'b1;
#5
{memory_test.memory[7],memory_test.memory[6],memory_test.memory[5],
memory_test.memory[4],memory_test.memory[3],memory_test.memory[2],
memory_test.memory[1],memory_test.memory[0]
}<=64'hFFAAFFAAFFAAFFAA; 

{memory_test.memory[15],memory_test.memory[14],memory_test.memory[13],
memory_test.memory[12],memory_test.memory[11],memory_test.memory[10],
memory_test.memory[9],memory_test.memory[8]
}<=64'h778899AABBCCDDEE; 

#5
address<=64'd0;
#5
address<=64'd8;
#5
address<=64'd16;
#10
wrt_en<=1'b1;
#10
wrt_en<=1'b0;
#10
address<=64'd0;
#10
address<=64'd16;
#10


    $finish;
end

endmodule