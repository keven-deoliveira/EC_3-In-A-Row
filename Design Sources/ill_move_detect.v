`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 05:42:00 PM
// Design Name: 
// Module Name: ill_move_detect
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

// used to detect if a given move is illegal
module ill_move_detect(
    input [1:0] pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9,
    input [8:0] P1_en,
    input [8:0] P2_en,
    output wire ill_move
    );
    
    wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9;
    wire temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19;
    wire temp20, temp21;
    
    // player 1 illegal move
    assign temp1 = (pos1[1] | pos1[0]) & P1_en[0];
    assign temp2 = (pos2[1] | pos2[0]) & P1_en[1];
    assign temp3 = (pos3[1] | pos3[0]) & P1_en[2];
    assign temp4 = (pos4[1] | pos4[0]) & P1_en[3];
    assign temp5 = (pos5[1] | pos5[0]) & P1_en[4];
    assign temp6 = (pos6[1] | pos6[0]) & P1_en[5];
    assign temp7 = (pos7[1] | pos7[0]) & P1_en[6];
    assign temp8 = (pos8[1] | pos8[0]) & P1_en[7];
    assign temp9 = (pos9[1] | pos9[0]) & P1_en[8];
    
    // player 2 illegal move
    
    assign temp11 = (pos1[1] | pos1[0]) & P2_en[0];
    assign temp12 = (pos2[1] | pos2[0]) & P2_en[1];
    assign temp13 = (pos3[1] | pos3[0]) & P2_en[2];
    assign temp14 = (pos4[1] | pos4[0]) & P2_en[3];
    assign temp15 = (pos5[1] | pos5[0]) & P2_en[4];
    assign temp16 = (pos6[1] | pos6[0]) & P2_en[5];
    assign temp17 = (pos7[1] | pos7[0]) & P2_en[6];
    assign temp18 = (pos8[1] | pos8[0]) & P2_en[7];
    assign temp19 = (pos9[1] | pos9[0]) & P2_en[8];
    
    assign temp20 =((((((((temp1 | temp2) | temp3) | temp4) | temp5) | temp6) | temp7) | temp8) | temp9);
    assign temp21 =((((((((temp11 | temp12) | temp13) | temp14) | temp15) | temp16) | temp17) | temp18) | temp19);  
    
    assign ill_move = temp20 | temp21;  
    
endmodule
