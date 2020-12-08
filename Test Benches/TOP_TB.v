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
reg [5:0] SW;
wire [2:0] LED_out1, LED_out2;
wire [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9;

TOP UUT (clk, reset, SW, LED_out1, LED_out2, pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
#500 $finish;
end

initial begin
SW = 0;
reset = 1;
#5 reset = 0;
#5
#10 SW[0] = 1;
#10 SW[5:2] = 4'd1;
#10 SW[0] = 0; SW[1] = 1;
#10 SW[5:2] = 4'd4;
#10 SW[0] = 1; SW[1] = 0;
#10 SW[5:2] = 4'd2;
#10 SW[0] = 0; SW[1] = 1;
#10 SW[5:2] = 4'd5;
#10 SW[0] = 1; SW[1] = 0;
#10 SW[5:2] = 4'd3;
#10 SW[0] = 0; SW[1] = 1;
#10 SW[5:2] = 4'd6;
end

endmodule
