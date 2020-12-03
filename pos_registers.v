`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 04:08:35 PM
// Design Name: 
// Module Name: pos_registers
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


module pos_registers(
    input clk,
    input reset,
    input ill_move,
    input [8:0] P1_en,
    input [8:0] P2_en,
    output reg [1:0] pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9
    );
    
    // pos1
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            pos1 <= 2'b00;
        else
        begin
            if (ill_move == 1'b1)
                pos1 <= pos1; // no change
            else if (P1_en[0] == 1'b1)
                pos1 <= 2'b01; // store p1 move
            else if (P2_en[0] == 1'b1)
                pos1 <= 2'b10; // store p2 move
            else
                pos1 <= pos1; // no change
        end
    end
    
    // pos2
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            pos2 <= 2'b00;
        else
        begin
            if (ill_move == 1'b1)
                pos2 <= pos2; // no change
            else if (P1_en[1] == 1'b1)
                pos2 <= 2'b01; // store p1 move
            else if (P2_en[1] == 1'b1)
                pos2 <= 2'b10; // store p2 move
            else
                pos2 <= pos2; // no change
        end
    end
    
    // pos3
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            pos3 <= 2'b00;
        else
        begin
            if (ill_move == 1'b1)
                pos3 <= pos3; // no change
            else if (P1_en[2] == 1'b1)
                pos3 <= 2'b01; // store p1 move
            else if (P2_en[2] == 1'b1)
                pos3 <= 2'b10; // store p2 move
            else
                pos3 <= pos3; // no change
        end
    end
          
    // pos4
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            pos4 <= 2'b00;
        else
        begin
            if (ill_move == 1'b1)
                pos4 <= pos4; // no change
            else if (P1_en[3] == 1'b1)
                pos4 <= 2'b01; // store p1 move
            else if (P2_en[3] == 1'b1)
                pos4 <= 2'b10; // store p2 move
            else
                pos4 <= pos4; // no change
        end
    end
    
    // pos5
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            pos5 <= 2'b00;
        else
        begin
            if (ill_move == 1'b1)
                pos5 <= pos5; // no change
            else if (P1_en[4] == 1'b1)
                pos5 <= 2'b01; // store p1 move
            else if (P2_en[4] == 1'b1)
                pos5 <= 2'b10; // store p2 move
            else
                pos5 <= pos5; // no change
        end
    end     
    
    // pos6
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            pos6 <= 2'b00;
        else
        begin
            if (ill_move == 1'b1)
                pos6 <= pos6; // no change
            else if (P1_en[5] == 1'b1)
                pos6 <= 2'b01; // store p1 move
            else if (P2_en[5] == 1'b1)
                pos6 <= 2'b10; // store p2 move
            else
                pos6 <= pos6; // no change
        end
    end
    
    // pos7
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            pos7 <= 2'b00;
        else
        begin
            if (ill_move == 1'b1)
                pos7 <= pos7; // no change
            else if (P1_en[6] == 1'b1)
                pos7 <= 2'b01; // store p1 move
            else if (P2_en[6] == 1'b1)
                pos7 <= 2'b10; // store p2 move
            else
                pos7 <= pos7; // no change
        end
    end
    
    // pos8
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            pos8 <= 2'b00;
        else
        begin
            if (ill_move == 1'b1)
                pos8 <= pos8; // no change
            else if (P1_en[7] == 1'b1)
                pos8 <= 2'b01; // store p1 move
            else if (P2_en[7] == 1'b1)
                pos8 <= 2'b10; // store p2 move
            else
                pos8 <= pos8; // no change
        end
    end
    
    // pos9
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            pos9 <= 2'b00;
        else
        begin
            if (ill_move == 1'b1)
                pos9 <= pos9; // no change
            else if (P1_en[8] == 1'b1)
                pos9 <= 2'b01; // store p1 move
            else if (P2_en[8] == 1'b1)
                pos9 <= 2'b10; // store p2 move
            else
                pos9 <= pos9; // no change
        end
    end 
                            
endmodule
