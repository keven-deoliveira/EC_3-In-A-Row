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
    wire gridh1, gridh2, gridv1, gridv2, whitegrid;
    
    assign cdraw1 = h_count_value >= 55 && h_count_value <= 154 && v_count_value >= 28 && v_count_value <=127;
    assign cdraw2 = h_count_value >= 270 && h_count_value <= 369 && v_count_value >= 28 && v_count_value <=127;
    assign cdraw3 = h_count_value >= 270 && h_count_value <= 369 && v_count_value >= 28 && v_count_value <=127;
    assign cdraw4 = h_count_value >= 55 && h_count_value <= 154 && v_count_value >= 190 && v_count_value <=289;
    assign cdraw5 = h_count_value >= 270 && h_count_value <= 369 && v_count_value >= 190 && v_count_value <=289;
    assign cdraw6 = h_count_value >= 270 && h_count_value <= 369 && v_count_value >= 190 && v_count_value <=289;
    assign cdraw7 = h_count_value >= 55 && h_count_value <= 154 && v_count_value >= 352 && v_count_value <=451;
    assign cdraw8 = h_count_value >= 55 && h_count_value <= 154 && v_count_value >= 352 && v_count_value <=451;
    assign cdraw9 = h_count_value >= 55 && h_count_value <= 154 && v_count_value >= 352 && v_count_value <=451;
     
    assign gridv1 = h_count_value >= 210 && h_count_value <= 214 && v_count_value >= 0 && v_count_value <=479;
    assign gridv2 = h_count_value >= 425 && h_count_value <= 429 && v_count_value >= 0 && v_count_value <=479;
    
    assign gridh1 = h_count_value >= 0 && h_count_value <= 639 && v_count_value >= 156 && v_count_value <=161;
    assign gridh2 = h_count_value >= 0 && h_count_value <= 639 && v_count_value >= 318 && v_count_value <=323;
    
    assign whitegrid = gridh1 || gridh2 || gridv1 || gridv2;
    
   always@(posedge clk_25) begin
   if(pixel_enable) begin 
   if(cdraw1) begin 
   VGA_R <= (pos1 == 2'b00)? 4'b0:((pos1 == 2'b01)? 4'hF:4'b0);
   VGA_G <= (pos1 == 2'b00)? 4'b0:((pos1 == 2'b01)? 4'b0:4'hF);
   VGA_B <= (pos1 == 2'b00)? 4'b0:((pos1 == 2'b01)? 4'h0:4'b0);
   
   end
    
   else if(cdraw2) begin 
   VGA_R <= (pos2 == 2'b00) ? 4'b0 : ((pos2 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos2 == 2'b00) ? 4'b0 : ((pos2 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos2 == 2'b00) ? 4'b0 : ((pos2 == 2'b01) ? 4'h0 : 4'b0);
   
   
   
   end
   
   else if(cdraw3) begin 
   VGA_R <= (pos3 == 2'b00) ? 4'b0 : ((pos3 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos3 == 2'b00) ? 4'b0 : ((pos3 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos3 == 2'b00) ? 4'b0 : ((pos3 == 2'b01) ? 4'h0 : 4'b0);
   
   
   
   end
               
   else if(cdraw4) begin 
   VGA_R <= (pos4 == 2'b00) ? 4'b0 : ((pos4 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos4 == 2'b00) ? 4'b0 : ((pos4 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos4 == 2'b00) ? 4'b0 : ((pos4 == 2'b01) ? 4'h0 : 4'b0);
    
   end 
   
   else if(cdraw5) begin 
   VGA_R <= (pos5 == 2'b00) ? 4'b0 : ((pos5 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos5 == 2'b00) ? 4'b0 : ((pos5 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos5 == 2'b00) ? 4'b0 : ((pos5 == 2'b01) ? 4'h0 : 4'b0);
    
   end 
   
   else if(cdraw6) begin 
   VGA_R <= (pos6 == 2'b00) ? 4'b0 : ((pos6 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos6 == 2'b00) ? 4'b0 : ((pos6 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos6 == 2'b00) ? 4'b0 : ((pos6 == 2'b01) ? 4'h0 : 4'b0);
   
    
   end 
   
   else if(cdraw7) begin 
   VGA_R <= (pos7 == 2'b00) ? 4'b0 : ((pos7 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos7 == 2'b00) ? 4'b0 : ((pos7 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos7 == 2'b00) ? 4'b0 : ((pos7 == 2'b01) ? 4'h0 : 4'b0);
    
   end 
   
   else if(cdraw8) begin 
   VGA_R <= (pos8 == 2'b00) ? 4'b0 : ((pos8 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos8 == 2'b00) ? 4'b0 : ((pos8 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos8 == 2'b00) ? 4'b0 : ((pos8 == 2'b01) ? 4'h0 : 4'b0);
    
   end 
   
   else if(cdraw9) begin 
   VGA_R <= (pos9 == 2'b00) ? 4'b0 : ((pos9 == 2'b01) ? 4'hF : 4'b0);
   VGA_G <= (pos9 == 2'b00) ? 4'b0 : ((pos9 == 2'b01) ? 4'b0 : 4'hF);
   VGA_B <= (pos9 == 2'b00) ? 4'b0 : ((pos9 == 2'b01) ? 4'h0 : 4'b0);
    
   end 
   
   else if(whitegrid) begin 
   VGA_R <= 4'hF;
   VGA_B <= 4'hF;
   VGA_G <= 4'hF;
   
   end
   
   else begin VGA_R <= 4'b0; VGA_G <= 4'b0; VGA_B <= 4'b0; end

   end 
   else begin VGA_R <= 4'b0; VGA_G <= 4'b0; VGA_B <= 4'b0; end 
   
   end 
   
endmodule
