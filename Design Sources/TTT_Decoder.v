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
    output wire [8:0] P_EN
    );
    reg [8:0] temp;
    assign P_EN = (ENABLE == 1'b1) ? temp : 9'b0;
    
    always@ (*) begin
    case(POS_SW)
    4'd1: temp <= 9'b000000001; // 0001
    4'd2: temp <= 9'b000000010; // 0010
    4'd3: temp <= 9'b000000100; // 0011
    4'd4: temp <= 9'b000001000; // 0100
    4'd5: temp <= 9'b000010000; // 0101
    4'd6: temp <= 9'b000100000; // 0110
    4'd7: temp <= 9'b001000000; // 0111
    4'd8: temp <= 9'b010000000; // 1000
    4'd9: temp <= 9'b100000000; // 1001
    default: temp <= 9'b000000000;    //ANYTHING ELSE WILL NOT BE ASSIGNED TO ANY CELL
    endcase 
  
    end 
        
endmodule
