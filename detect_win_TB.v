`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 03:31:49 PM
// Design Name: 
// Module Name: detect_win_TB
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


module detect_win_TB();
reg [1:0] pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9;
wire winner;
wire [1:0] who_win;


detect_win UUT (pos1,  pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, winner, who_win);

initial begin
pos1 = 0; pos2 = 0; pos3 = 0; pos4 = 0; pos5 = 0; pos6 = 0; pos7 = 0; pos8 = 0; pos9 = 0;
#100; pos1 = 1; 
#100; pos2 = 1; 
#100; pos3 = 1; 
end

endmodule
