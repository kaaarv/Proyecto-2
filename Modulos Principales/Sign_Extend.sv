module  signextend(
    input wire [31:0] IN,
    output reg [63:0] OUT
);

always @(*) begin  
    case (IN[6:0])
        7'b0000011: OUT={{52{IN[31]}},IN[31:20]}; //lw 
        7'b0100011: OUT={{52{IN[31]}},IN[31:25],IN[11:7]};//sw
        7'b1100011: OUT={{52{IN[31]}},IN[31],IN[7],IN[30:25],IN[11:8]};//beq
        default: 
        OUT={64{1'b1}}; //En caso de que no sea una operacion que requiera inmediatos el modulo retorna
                 //una palabra de 1s.
    endcase
end
    
endmodule