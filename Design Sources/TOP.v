`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 04:20:57 PM
// Design Name: 
// Module Name: TOP
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


module TOP(
input clk,
input reset,
input [6:0] SW,     
output reg [2:0] LED_out1,
output reg [2:0] LED_out2,
output hsync,
output vsync,
output  [3:0] VGA_R,
output  [3:0] VGA_G,
output  [3:0] VGA_B
);
    
    wire [8:0] P_EN;
    reg  [8:0] P1_EN, P2_EN;
    wire [1:0] WINNER;
    wire [2:0] RGB_out1;
    wire [2:0] RGB_out2;
    wire P1_play;
    wire P2_play;
    
    
    TTT_Decoder U0 (SW[5:2], SW[6] , P_EN);
    always@(*) begin
    if (SW[1:0] == 2'b01) begin      //IF PLAYER SWITCH[1:0] IS 01 (PLAYER 1) 
    P1_EN = P_EN; 
    P2_EN = 9'b0;
    end 

    else if (SW[1:0] == 2'b10) begin  //IF PLAYER SWITCH[1:0] IS 10 (PLAYER 2)
    P2_EN = P_EN; 
    P1_EN = 9'b0;
    end 
        
    else begin 
    P1_EN = 9'b0;          
    P2_EN = 9'b0;
    end 
    end 
    
    wire  [1:0] pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9;
    wire ill_move;
    wire no_space;
    wire win;
    
    
    pos_registers U1(clk, reset, ill_move, P1_EN, P2_EN,  pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9); 
   
    ill_move_detect U2(pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, P1_EN, P2_EN, ill_move);
   
    nospace_detect U3(pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, no_space);
    
   // fsm_controller U4(clk, reset, SW[0], SW[1], ill_move, no_space, win, P1_play, P2_play);
    
    detect_win U5(pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, win, WINNER);
    
    VGA_DISPLAY U6(clk, reset,pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, hsync, vsync, VGA_R, VGA_G, VGA_B);
    
    
    rgbLED U7(clk, WINNER, RGB_out1);
    rgbLED U8(clk, WINNER, RGB_out2);
    
    always @ (posedge clk)
    begin
    LED_out1 <= RGB_out1;
    LED_out2 <= RGB_out2;
    end
