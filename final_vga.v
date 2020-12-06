`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 03:40:14 PM
// Design Name: 
// Module Name: final_vga
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


module final_vga(

input clk,
output Hsynq,
output Vsynq,
output reg [3:0]  Red,
output reg [3:0] Green,
output reg [3:0] Blue

    );

wire clk_25M;
wire enable_V_Counter;
wire [15:0] H_Count_Value;
wire [15:0] V_Count_Value;

vga_clkdiv VGAC (clk, clk_25M);
h_counter VGAH( clk_25M, enable_V_Counter, H_Count_Value);
v_counter VGAV( clk_25M, enable_V_Counter, V_Count_Value);

assign Hsynq = (H_Count_Value < 96) ? 1'b1 : 1'b0;
assign Vsynq = (V_Count_Value < 2) ? 1'b1 : 1'b0;


//(H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF : 
//            (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF : 
//            (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF : 
//            (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF : 
//            (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF : 
//            (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF : 
//            (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF : 
//            (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF : 
//            (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF : 
//            (H_Count_Value <800 && H_Count_Value>143 && V_Count_Value <515 && V_Count_Value>34) ? 4'h1: 4'h0;

always@(Red) begin
 Red =
           (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF :                
                       (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF :    
                       (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF :    
                       (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF :    
                       (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF :    
                       (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF :    
                       (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF :    
                       (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF :    
                       (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF :    
                       (H_Count_Value <800 && H_Count_Value>143 && V_Count_Value <515 && V_Count_Value>34) ? 4'h1: 4'h0;
end


always@(Green)  begin    
 Green =
            (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF :                
                        (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF :    
                        (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF :    
                        (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF :    
                        (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF :    
                        (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF :    
                        (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF :    
                        (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF :    
                        (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF :    
                        (H_Count_Value <800 && H_Count_Value>143 && V_Count_Value <515 && V_Count_Value>34) ? 4'h1: 4'h0;
 end
            
always@(Blue) begin              
 Blue = 
         (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF :                
                     (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF :    
                     (H_Count_Value <325 && H_Count_Value>243 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF :    
                     (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF :    
                     (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF :    
                     (H_Count_Value <507 && H_Count_Value>416 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF :    
                     (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <170 && V_Count_Value>102) ? 4'hF :    
                     (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <306 && V_Count_Value>238) ? 4'hF :    
                     (H_Count_Value <689 && H_Count_Value>598 && V_Count_Value <442 && V_Count_Value>374) ? 4'hF :    
                     (H_Count_Value <800 && H_Count_Value>143 && V_Count_Value <515 && V_Count_Value>34) ? 4'h1: 4'h0;
end

endmodule