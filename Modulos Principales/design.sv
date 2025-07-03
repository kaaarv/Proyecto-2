`include "ALU.sv" 
`include "Data_mem.sv"
`include "Inst_Mem.sv"
`include "Mux2_1.sv" 
`include "PC.sv"
`include "Register.sv"
`include "Sign_Extend.sv"
`include "Control_Unit.sv"
`include "Adder.sv"
`include "And.sv"

module monocicle(
    input wire RST,
    input wire CLK
);

wire [63:0] mux2toPC,PCtoInst_mem,mux1toALU,regtoALU,ALUtodata_mem;
wire [63:0] data_memtomux3,mux3toreg,regtomux1,immgentomux1,adder1tomux2,adder2tomux2;
wire [3:0] decotoALU;
wire decotodatamem,decotomux3,decotomux1,decotoreg,decotomux2;
wire decotoAND,ALUtoAND,ANDtomux2;
wire [31:0] instruction;

ALU ALU_mono(.A(regtoALU),.B(mux1toALU),.ALU_operation(decotoALU),.ALU_result(ALUtodata_mem),.zero(ALUtoAND));

data_mem data_mono(.clk(CLK),.rst(RST),.wrt_en(decotodatamem),.address(ALUtodata_mem),.write_data(regtomux1),.read_data(data_memtomux3));

mux21 mux3(.SEL(decotomux3),.IN0(ALUtodata_mem),.IN1(data_memtomux3),.OUT(mux3toreg));

mux21 mux2(.SEL(ANDtomux2),.IN0(adder1tomux2),.IN1(adder2tomux2),.OUT(mux2toPC));

mux21 mux1(.SEL(decotomux1),.IN0(regtomux1),.IN1(immgentomux1),.OUT(mux1toALU));

signextend signextend_mono(.IN(instruction),.OUT(immgentomux1));

register #(64,32) register_mono(.rst(RST),.clk(CLK),.regwrite(decotoreg),.adr_reg1(instruction[19:15]),.adr_reg2(instruction[24:20]),.adr_wr_reg(instruction[11:7]),
.wr_data(mux3toreg),.reg_data1(regtoALU),.reg_data2(regtomux1));

inst_mem #(32,80,64) inst_mono(.clk(CLK),.rst(RST),.read_adr(PCtoInst_mem),.instruction(instruction));

PC PC_mono(.clk(CLK),.rst(RST),.IN(mux2toPC),.OUT(PCtoInst_mem));

adder adder1(.A(PCtoInst_mem),.B(64'd1),.Q(adder1tomux2));

adder adder2(.A(PCtoInst_mem),.B(immgentomux1),.Q(adder2tomux2));

control control_mono(.instruction({instruction[30],instruction[14:12],instruction[6:0]}),.Branch(decotoAND),
.MemtoReg(decotomux3),.MemWrite(decotodatamem),.ALUSrc(decotomux1),.RegWrite(decotoreg),.ALUOp(decotoALU));

and1 gate(.a(decotoAND),.b(ALUtoAND),.q(ANDtomux2));


endmodule