`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 03:42:06 PM
// Design Name: 
// Module Name: v_counter
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


module v_counter(
input clk_25MHz,
input enable_V_Counter,
output reg [15:0] V_Count_Value=0

    );
    
    always@(posedge clk_25MHz) begin
    if ( enable_V_Counter == 1'b1)begin
    if (V_Count_Value <525)
    V_Count_Value <= V_Count_Value+1;
    else V_Count_Value <= 0; 
   
    end
    end
endmodule
