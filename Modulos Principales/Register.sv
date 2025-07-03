module register #(parameter width=64,depth=32)(
    input wire rst, //senales de control.
    input wire clk,
    input wire regwrite,

    input wire [$clog2(depth)-1:0] adr_reg1, adr_reg2, adr_wr_reg, //direcciones de registros .

    input wire [width-1:0] wr_data, //dato para escritura.

    output wire [width-1:0] reg_data1, reg_data2 //salidas de registros.
);

reg [width-1:0] registers [depth-1:0];

always_ff @(posedge clk) begin
    
    if(regwrite && (adr_wr_reg!={$clog2(depth){1'b0}})) begin //nunca escribir en registro x0
         registers[adr_wr_reg] <=wr_data;
     end

    if(!rst) begin  
    for(integer i=0;i<depth;i=i+1) begin
        registers[i]<={width{1'b0}};
    end
    end
end

assign reg_data1=(adr_reg1!={$clog2(depth){1'b0}})?registers[adr_reg1]:{width{1'b0}}; //si se lee registro x0 mostrar 0
assign reg_data2=(adr_reg2!={$clog2(depth){1'b0}})?registers[adr_reg2]:{width{1'b0}}; //si se lee registro x0 mostrar 0
    
endmodule