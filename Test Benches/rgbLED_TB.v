`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 03:11:15 PM
// Design Name: 
// Module Name: rgbLED_TB
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


module rgbLED_TB;

reg clk;
reg [1:0] detect_win;
wire [2:0] LED_out;

rgbLED UUT(clk,detect_win,LED_out);

initial begin
#100 $finish;
end

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
detect_win = 2'b00;
#10 detect_win = 2'b01;
#10 detect_win = 2'b10;
#10 detect_win = 2'b11;
end


endmodule
