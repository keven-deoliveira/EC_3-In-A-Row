`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 06:32:49 PM
// Design Name: 
// Module Name: detect_3inarow
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


module detect_3inarow(
    input [1:0] pos0, pos1, pos2,
    output wire winner,
    output wire [1:0] who_win
    );
    
    wire [1:0] temp1, temp2, temp3;
    wire temp4;
    
    assign temp1[1] = !(pos0[1]^pos1[1]);
    assign temp1[0] = !(pos0[0]^pos1[0]);
    assign temp2[1] = !(pos2[1]^pos1[1]);
    assign temp2[0] = !(pos2[0]^pos1[0]);
    assign temp3[1] = temp1[1] & temp2[1];
    assign temp3[0] = temp1[0] & temp2[0];
    assign temp4 = pos0[1] | pos0[0];
    
    assign winner = temp4 & temp3[1] & temp3[0]; // winner = 1 if three of the same (01 or 10) in a row
    assign who_win[1] = winner & pos0[1]; // assign who winner is
    assign who_win[0] = winner & pos0[0]; // assign who winner is
    
endmodule
