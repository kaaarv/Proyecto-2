module ALU (
    input wire [63:0] A,B,
    input wire [3:0] ALU_operation,

    output reg [63:0] ALU_result,
    output reg  zero
);
    
always @(*) begin 

    case (ALU_operation)
        4'b0000:   ALU_result=A&B;
        4'b0001:   ALU_result=A|B;
        4'b0010:   ALU_result=A+B;
        4'b0110:   ALU_result=A-B;
        default: ALU_result={64{1'b1}}; //Generar 64 bits de 1 en caso de que se seleccione
    endcase                             //una operacion invalida.

    if(ALU_result==64'b0) zero=1'b1;
    else zero=1'b0;
    
end



endmodule