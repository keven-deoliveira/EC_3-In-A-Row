`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 05:48:45 PM
// Design Name: 
// Module Name: TOP_TB
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


module TOP_TB;
reg clk;
reg reset;
reg [6:0] SW;
wire  [2:0] LED_out1;
wire  [2:0] LED_out2;
wire hsync;
wire vsync;
wire  [3:0] VGA_R;
wire  [3:0] VGA_G;
wire  [3:0] VGA_B;

TOP U1(clk, reset, SW, LED_out1, LED_out2, hsync, vsync, VGA_R, VGA_G, VGA_B);

initial begin 
clk = 1'b0;
SW = 7'b0;
reset = 1'b1;

#100;

reset = 1'b0;

#10 
//player1 1st move 
SW[6] = 1'd1;
SW[1:0] = 2'b01; 
SW[5:2] = 4'd1;

#10;

//player2 1st move 
SW[6] = 1'd1;
SW[1:0] = 2'b10; 
SW[5:2] = 4'd2;

#10;

//player1 2nd move 
SW[6] = 1'd1;
SW[1:0] = 2'b01; 
SW[5:2] = 4'd4;

#10;

//player2 2nd move 
SW[6] = 1'd1;
SW[1:0] = 2'b10; 
SW[5:2] = 4'd7;

#10;

//player1 3rd move (Illegal move)
SW[6] = 1'd1;
SW[1:0] = 2'b01; 
SW[5:2] = 4'd4;

#10;

//player1 3rd move (repeated) 
SW[6] = 1'd1;
SW[1:0] = 2'b01; 
SW[5:2] = 4'd5;

#10;

//player2 3rd move (Illegal move)
SW[6] = 1'd1;
SW[1:0] = 2'b10; 
SW[5:2] = 4'd1;

#10;

//player2 3rd move (repeated) 
SW[6] = 1'd1;
SW[1:0] = 2'b10; 
SW[5:2] = 4'd8;

#10;

//player1 4th move  (WIN) 
SW[6] = 1'd1;
SW[1:0] = 2'b01; 
SW[5:2] = 4'd9;

#100000; 
$stop;

end 

always #1 clk = ~clk;



endmodule
