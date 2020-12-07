`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 07:14:28 PM
// Design Name: 
// Module Name: detect_win
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

// checks all 8 possible win conditions, detects winner
module detect_win(
    input [1:0] pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9,
    output wire winner,
    output wire [1:0] who_win
    );
    
    wire win1,win2,win3,win4,win5,win6,win7,win8;
    wire [1:0] who1,who2,who3,who4,who5,who6,who7,who8;
    
    detect_3inarow w1(pos1,pos2,pos3,win1,who1); //(1,2,3);           1 | 2 | 3  
    detect_3inarow w2(pos4,pos5,pos6,win2,who2); //(4,5,6);          ___|___|___
    detect_3inarow w3(pos7,pos8,pos9,win3,who3); //(7,8,9);           4 | 5 | 6 
    detect_3inarow w4(pos1,pos4,pos7,win4,who4); //(1,4,7);          ___|___|___
    detect_3inarow w5(pos2,pos5,pos8,win5,who5); //(2,5,8);           7 | 8 | 9 
    detect_3inarow w6(pos3,pos6,pos9,win6,who6); //(3,6,9);             |   |   
    detect_3inarow w7(pos1,pos5,pos9,win7,who7); //(1,5,9);
    detect_3inarow w8(pos3,pos5,pos7,win8,who8); //(3,5,7); 
    
    assign winner = (((((((win1 | win2) | win3) | win4) | win5) | win6) | win7) | win8);
    assign who_win = (((((((who1 | who2) | who3) | who4) | who5) | who6) | who7) | who8);
    
endmodule
