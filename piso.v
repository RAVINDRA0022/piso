module piso (
    input wire clk,    
    input wire rst,         
    input wire load,        
    input wire [7:0] pdata,
    output reg sdata        );
    reg [7:0] shift_reg; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 8'b0; 
            sdata <= 1'b0; 
        end else if (load) begin
            shift_reg <= pdata; 
        end else begin
            sdata <= shift_reg[0];          
            shift_reg <= {1'b0, shift_reg[7:1]};
        end
    end
endmodule
