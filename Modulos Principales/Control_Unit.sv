module control (
  input wire [10:0] instruction,  // los primeros 7 bits son Instruction[6:0],
                                    //los siguientes tres son  Instruction[14:12]
                                    //el msb es Instruction[30]
   output reg Branch,MemtoReg,MemWrite,ALUSrc,RegWrite, //Branch va directo al mux21 de arriba
   output reg [3:0] ALUOp
);

localparam [6:0] beq_op = 7'b1100011;
localparam [6:0] arit_op = 7'b0110011;
localparam [6:0] sw_op = 7'b0100011;
localparam [6:0] lw_op = 7'b0000011;


always @(*) begin
    case (instruction[6:0])
        beq_op: begin
            {Branch,MemtoReg,MemWrite,ALUSrc,RegWrite}=5'b10000;
            ALUOp=4'b0110;
        end
        sw_op: begin
            {Branch,MemtoReg,MemWrite,ALUSrc,RegWrite}=5'b00110;
            ALUOp=4'b0010;
        end
        lw_op: begin
            {Branch,MemtoReg,MemWrite,ALUSrc,RegWrite}=5'b01011;
            ALUOp=4'b0010;
        end
        arit_op: begin
        case (instruction[10:7])
            4'b1000: begin //resta
                {Branch,MemtoReg,MemWrite,ALUSrc,RegWrite}=5'b00001;
                 ALUOp=4'b0110;
            end
            4'b0000: begin //suma
                {Branch,MemtoReg,MemWrite,ALUSrc,RegWrite}=5'b00001;
                 ALUOp=4'b0010;
            end
              4'b0110: begin //or
                {Branch,MemtoReg,MemWrite,ALUSrc,RegWrite}=5'b00001;
                 ALUOp=4'b0001;
            end
             4'b0111: begin //and
                {Branch,MemtoReg,MemWrite,ALUSrc,RegWrite}=5'b00001;
                 ALUOp=4'b0000;
            end
             default: begin
                {Branch,MemtoReg,MemWrite,ALUSrc,RegWrite}=5'b1111;
                ALUOp=4'b1111;
             end   


        endcase
        end

        default: begin
            {Branch,MemtoReg,MemWrite,ALUSrc,RegWrite}=5'b1111;
            ALUOp=4'b1111;
        end
    endcase
        
end


endmodule