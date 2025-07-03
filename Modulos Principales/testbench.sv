`timescale 1ns/1ps

module z_monocicle_tb;

  reg  RST,CLK;

 monocicle monocicle_prueba (.RST(RST),.CLK(CLK));

 initial forever #1 CLK=~CLK;

initial begin

  $dumpfile("prueba_monocicle.vcd");
$dumpvars(0,z_monocicle_tb);



CLK=1'b0; //Inicializar el clock en bajo
RST<=1'b0;
$display("PC:",monocicle_prueba.PC_mono.OUT);
mostrar_inst_mem(6);
mostrar_regs(5);
mostrar_data_mem(1);
#1
RST<=1'b1;
#1
$readmemh("data_initial", monocicle_prueba.data_mono.memory);
$readmemb("inst_initial", monocicle_prueba.inst_mono.memory);

$display("\nACTIVACION DE RESET\n");
$display("----------------");
$display("PC:",monocicle_prueba.PC_mono.OUT);
mostrar_inst_mem(6);
mostrar_regs(5);
mostrar_data_mem(5);
$display("----------------");

  for(integer i=0;i<50;i=i+1) begin
#2
$display("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-");
$display("PC:",monocicle_prueba.PC_mono.OUT);
mostrar_regs(6);
mostrar_data_mem(6);

end
$finish;
end


task automatic mostrar_inst_mem(input integer b); //funcion para mostrar "b" direcciones de mem instr
  for(integer a=0;a<b;a=a+1) begin
  $display("Inst_Mem[%d]:|%b|",a,monocicle_prueba.inst_mono.memory[a]);
  end
endtask 

task automatic mostrar_regs(input integer b); //funcion para mostrar "b" registros
  for(integer a=0;a<b;a=a+1) begin
  $display("Reg[%d]:(h)|%h|(d)|%d|",a,monocicle_prueba.register_mono.registers[a],monocicle_prueba.register_mono.registers[a]);
  end
endtask 


task automatic mostrar_data_mem(input integer b); //funcion para mostrar "b" direcciones de mem data
  for(integer a=0;a<(2**b)+1;a=a+8) begin
  $display("Data_Mem[%d]:(h)|%h|(d)|%d|",a,{monocicle_prueba.data_mono.memory[a+7],
                                            monocicle_prueba.data_mono.memory[a+6],
                                            monocicle_prueba.data_mono.memory[a+5],
                                            monocicle_prueba.data_mono.memory[a+4],
                                            monocicle_prueba.data_mono.memory[a+3],
                                            monocicle_prueba.data_mono.memory[a+2],
                                            monocicle_prueba.data_mono.memory[a+1],
                                            monocicle_prueba.data_mono.memory[a]},{monocicle_prueba.data_mono.memory[a+7],
                                                                                   monocicle_prueba.data_mono.memory[a+6],
                                                                                   monocicle_prueba.data_mono.memory[a+5],
                                                                                   monocicle_prueba.data_mono.memory[a+4],
                                                                                   monocicle_prueba.data_mono.memory[a+3],
                                                                                   monocicle_prueba.data_mono.memory[a+2],
                                                                                   monocicle_prueba.data_mono.memory[a+1],
                                                                                   monocicle_prueba.data_mono.memory[a]});
  end
endtask 
   

endmodule

