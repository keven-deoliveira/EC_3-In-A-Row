`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 03:40:49 PM
// Design Name: 
// Module Name: vga_clkdiv
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


module vga_clkdiv #(parameter div_value = 1)(

input wire clk,
output reg divided_clk =0

    );
    
    integer counter_value=0;
    
    always@ (posedge clk)
    begin
        if (counter_value == div_value)
        counter_value<=0;
        else
        counter_value<= counter_value+1;
        end
        
     always@ (posedge clk)
     begin
         if (counter_value == div_value)
         divided_clk <= ~ divided_clk;
         else
         divided_clk <= divided_clk;
         end
         
         
            
endmodule
