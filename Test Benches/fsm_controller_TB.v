`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 04:17:03 PM
// Design Name: 
// Module Name: fsm_controller_TB
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


module fsm_controller_TB;

reg clk;
reg reset;
reg play1;
reg play2;
reg ill_move;
reg no_space;
reg win;
wire p1_play;
wire p2_play;

fsm_controller uut(clk, reset, play1, play2, ill_move, no_space, win, p1_play, p2_play);

initial begin
#150 $finish;
end

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
reset = 1;
ill_move = 0;
no_space = 0;
win = 0;
play1 =0;
play2 = 0;
#10 reset = 0;
#10 reset = 1;
#10 reset = 0; play1 = 1;
 
#10 ill_move = 1;
#10 ill_move = 0;
#10 play2 = 1; play1 = 0;
 
#10 play2 = 0; play1 = 1;
#10 play1 = 0; play2 = 1; 
#10 no_space = 1;
 
#10 reset = 1;
end
endmodule
