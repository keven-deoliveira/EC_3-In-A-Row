`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 06:25:08 PM
// Design Name: 
// Module Name: VGA_DISPLAY
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


module VGA_DISPLAY(
    input clk,
    input reset,
    input [1:0] pos1,
    input [1:0] pos2,
    input [1:0] pos3,
    input [1:0] pos4,
    input [1:0] pos5,
    input [1:0] pos6,
    input [1:0] pos7,
    input [1:0] pos8,
    input [1:0] pos9,
    output hsync,
    output vsync,
    output reg [3:0] VGA_R,
    output reg [3:0] VGA_G,
    output reg [3:0] VGA_B
    );
    
    wire clk_25;
    
    vga_clkdiv U1(clk, clk_25);
    
    //Horizontal Parameters
    parameter h_active = 639;
    parameter hs_start = h_active + 16;
    parameter hs_end = hs_start + 96;
    parameter row = 799;
    
    //Vertical Parameters
    parameter v_active = 479;
    parameter vs_start = v_active + 10;
    parameter vs_end = vs_start + 2; 
    parameter column = 524;
    
    reg [9:0] h_count_value;
    reg [9:0] v_count_value;
    wire pixel_enable;
    
    assign hsync = ~(h_count_value >= hs_start && h_count_value < hs_end);
    assign vsync = ~(v_count_value >= vs_start && v_count_value < vs_end);
    
    assign pixel_enable = h_count_value <= h_active && v_count_value <= v_active;
    
    always@(posedge clk_25 , posedge reset) begin 
    if(reset) begin h_count_value <= 10'b0; v_count_value <= 10'b0; end
    else begin
        if(h_count_value < 799) h_count_value <= h_count_value + 1;
        else begin h_count_value <= 0; 
            if(v_count_value < 524) v_count_value <= v_count_value + 1;
            else v_count_value <= 0;
        end 
    end 
    end 
    
    wire cdraw1, cdraw2, cdraw3, cdraw4, cdraw5, cdraw6, cdraw7, cdraw8, cdraw9;
    assign cdraw1 = h_count_value >= 55 && h_count_value <= 154 && v_count_value >= 28 && v_count_value <=127;
    assign cdraw2 = h_count_value >= 270 && h_count_value <= 369 && v_count_value >= 28 && v_count_value <=127;
    assign cdraw3 = h_count_value >= 270 && h_count_value <= 369 && v_count_value >= 28 && v_count_value <=127;
    // continue untill cdraw9      
     
     
   always@(posedge clk_25) begin
   if(pixel_enable) begin 
   if(cdraw1) begin 
   VGA_R <= (pos1 == 2'b00)? 4'b0:((pos1 == 2'b01)? 4'hF:4'b0);
   VGA_G <= (pos1 == 2'b00)? 4'b0:((pos1 == 2'b01)? 4'b0:4'hF);
   VGA_B <= (pos1 == 2'b00)? 4'b0:((pos1 == 2'b01)? 4'h0:4'b0);
   
   end
    
   if(cdraw2) begin 
   VGA_R <= (pos2 == 2'b00) ? 4'b0 : ((pos2 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos2 == 2'b00) ? 4'b0 : ((pos2 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos2 == 2'b00) ? 4'b0 : ((pos2 == 2'b01) ? 4'h0 : 4'b0);
   
   
   
   end
   
   if(cdraw3) begin 
   VGA_R <= (pos3 == 2'b00) ? 4'b0 : ((pos3 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos3 == 2'b00) ? 4'b0 : ((pos3 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos3 == 2'b00) ? 4'b0 : ((pos3 == 2'b01) ? 4'h0 : 4'b0);
   
   
   
   end
               
    
endmodule
