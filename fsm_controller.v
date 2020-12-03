`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 03:15:36 PM
// Design Name: 
// Module Name: fsm_controller
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


module fsm_controller(
    input clk,
    input reset,
    play1,
    play2,
    ill_move, // might need one for each player
    no_space,
    win,
    output reg p1_play,
    p2_play
    );
    
    // States
    parameter idle = 2'b00;
    parameter player1 = 2'b01;
    parameter player2 = 2'b10;
    parameter game_over = 2'b11;
    reg [1:0] cs, ns; // current state & next state
    
    always @ (posedge clk or posedge reset)
    begin
        if (reset)
            cs <= idle;
        else
            cs <= ns;
    end
    
    always @(*)
    begin
        case (cs)
        idle: 
            begin
              if(reset == 1'b0 && play1 == 1'b1)
                ns <= player1; // player 1's turn 
              else
                ns <= idle;
              p1_play <= 1'b0;
              p2_play <= 1'b0;
            end
        player1:
            begin
              p1_play <= 1'b1; // sets turn to p1
              p2_play <= 1'b0;
              if(ill_move == 1'b0) // if turn made is not illegal, next is p2's turn
                ns <= player2;
              else
                ns <= idle;
            end
        player2:
            begin
              p1_play <= 1'b0;
              if(play2 == 1'b0)
                begin
                ns <= player2;
                p2_play <= 1'b0;
                end 
              else if (win == 1'b0 && no_space == 1'b0 && ill_move == 1'b0)
                begin
                ns <= idle;
                p2_play <= 1'b1;
                end
              else if (ill_move == 1'b1)
                begin
                ns <= player2;  
                p2_play <= 1'b0;
                end
              else if (no_space == 1'b1 || win == 1'b1)
                begin
                ns <= game_over;
                p2_play <=1'b1;
                end
            end
        game_over:
            begin
                p1_play <= 1'b0;
                p2_play <= 1'b0;
                if(reset == 1'b1)
                    ns <= idle;
                else
                    ns <= game_over;
            end
        default: ns <= idle;
        endcase 
    end                                                                 
endmodule
