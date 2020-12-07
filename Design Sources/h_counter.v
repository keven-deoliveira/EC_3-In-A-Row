`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 03:41:50 PM
// Design Name: 
// Module Name: h_counter
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


module h_counter(
input clk_25MHz,
output reg enable_V_Counter=0,
output reg [15:0] H_Count_Value=0

    );
    
    always@(posedge clk_25MHz) begin
    if (H_Count_Value < 799)begin
    H_Count_Value <= H_Count_Value+1;
    enable_V_Counter<=0;
    end
    else begin
    H_Count_Value <=0;
    enable_V_Counter <=1;
    end
    end
endmodule
