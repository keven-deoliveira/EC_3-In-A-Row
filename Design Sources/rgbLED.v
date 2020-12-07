`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 04:29:51 PM
// Design Name: 
// Module Name: rgbLED
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


module rgbLED(
    input clk,
    //input wire [1:0] detect_win,
    input [1:0] switch,
    output reg [2:0] LED_out   
    );
    
    always@(posedge clk)
    begin
    
    case(switch)
    2'b01:  LED_out=3'b100;
    2'b10 : LED_out=3'b010;
    2'b11 : LED_out=3'b001;
    default : LED_out=3'b000;
    endcase
    
    end
endmodule
