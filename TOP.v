`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 06:37:01 AM
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
output [1:0] WINNER       //ADD ANOTHER OUTPUT FOR VGA DISPLAY (VGA CONTROLLER) 
    );
    
    wire [8:0] P_EN;
    reg [8:0] P1_EN, P2_EN;
    
    
    TTT_Decoder U0 (SW[5:2], SW[6], P_EN);
    always@(*) begin
    if (SW[1:0] == 2'b01) begin      //IF PLAYER SWITCH[1:0] IS 01 (PLAYER 1) 
    P1_EN = P_EN; 
    P2_EN = 9'b0;
    end 
    
    else if (SW[1:0] == 2'b10) begin  //IF PLAYER SWITCH[1:0] IS 10 (PLAYER 2)
    P2_EN = P_EN; 
    P1_EN = 9;b0;
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
    wire P1_play;
    wire P2_play;
    
    pos_registers U1(clk, reset, ill_move, P1_EN, P2_EN,  pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9); 
   
    ill_move_detect U2(pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, P1_EN, P2_EN, ill_move);
   
    nospace_detect U3(pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, no_space);
    
    fsm_controller U4(clk, reset, SW[0], SW[1], ill_move, no_space, win, P1_play, P2_play);
    
    detect_win U5(pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, win, WINNER);
    
    
    
    
endmodule
