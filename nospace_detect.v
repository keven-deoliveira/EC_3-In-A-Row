`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 05:37:32 PM
// Design Name: 
// Module Name: nospace_detect
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

//used to detect if there is no more space on the board
module nospace_detect(
    input [1:0] pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9,
    output wire no_space
    );
    
    wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9;
    
    assign temp1 = pos1[1] | pos1[0];
    assign temp2 = pos2[1] | pos2[0];
    assign temp3 = pos3[1] | pos3[0];
    assign temp4 = pos4[1] | pos4[0];
    assign temp5 = pos5[1] | pos5[0];
    assign temp6 = pos6[1] | pos6[0];
    assign temp7 = pos7[1] | pos7[0];
    assign temp8 = pos8[1] | pos8[0];
    assign temp9 = pos9[1] | pos9[0];
    
    assign no_space = ((((((((temp1 & temp2) & temp3) & temp4) & temp5) & temp6) & temp7) & temp8) & temp9);
    
endmodule
