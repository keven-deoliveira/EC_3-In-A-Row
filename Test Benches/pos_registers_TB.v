`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 03:20:30 PM
// Design Name: 
// Module Name: pos_registers_TB
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


module pos_registers_TB;

reg clk;
reg reset;
reg ill_move;
reg [8:0] P1_en;
reg [8:0] P2_en;
wire [1:0] pos1;
wire [1:0] pos2;
wire [1:0] pos3;
wire [1:0] pos4;
wire [1:0] pos5;
wire [1:0] pos6;
wire [1:0] pos7;
wire [1:0] pos8;
wire [1:0] pos9;

pos_registers uut(clk,reset,ill_move,P1_en, P2_en, pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
#100 $finish;
end

initial begin
reset = 0;
#10 reset = 0;
ill_move = 0;
P1_en = 9'b000000001;
#10 P2_en = 9'b000001000;
#10 P1_en = 9'b000000010;
#10 ill_move = 1'b1; P2_en = 9'b000000010;
#10 ill_move = 1'b0; P2_en = 9'b000010000;
#10 P1_en = 9'b000000100;
#10 reset = 1;
end
endmodule
