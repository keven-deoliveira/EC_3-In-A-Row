`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 06:10:42 AM
// Design Name: 
// Module Name: TTT_Decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TTT_Decoder(
    input [3:0] POS_SW,
    input ENABLE,
    output reg [8:0] P_EN
    );
    
    always@ (*) begin
    if(ENABLE)         //ENABLE IS ON
    begin
    case(POS_SW)
    4'd0: P_EN = 9'b000000001;
    4'd1: P_EN = 9'b000000010;
    4'd2: P_EN = 9'b000000100;
    4'd3: P_EN = 9'b000001000;
    4'd4: P_EN = 9'b000010000;
    4'd5: P_EN = 9'b000100000;
    4'd6: P_EN = 9'b001000000;
    4'd7: P_EN = 9'b010000000;
    4'd8: P_EN = 9'b100000000;
        
    default: P_EN = 9'b000000000;    //ANYTHING ELSE WILL NOT BE ASSIGNED TO ANY CELL
    endcase 
    end
    else P_EN = 9'b000000000;    //IF ENABLE IS OFF 
    end 
        
endmodule
