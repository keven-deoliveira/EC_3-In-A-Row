`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 07:10:36 PM
// Design Name: 
// Module Name: TTT_Decoder_TB
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


module TTT_Decoder_TB;

reg [3:0] POS_SW;
reg ENABLE;
wire [8:0] P_EN;

TTT_Decoder UUT (POS_SW, ENABLE, P_EN);

initial begin 
#500 $finish;
end

initial begin
ENABLE = 0;
POS_SW = 0;
#10 POS_SW = 4'd1;
#10 POS_SW = 4'd2;
#10 POS_SW = 4'd3;
#10 POS_SW = 4'd4;
#10 POS_SW = 4'd5;
#10 POS_SW = 4'd6;
#10 POS_SW = 4'd7;
#10 POS_SW = 4'd8;
#10 POS_SW = 4'd9;
#10 POS_SW = 0;

#10 ENABLE = 1'b1;

#10 POS_SW = 4'd1;
#10 POS_SW = 4'd2;
#10 POS_SW = 4'd3;
#10 POS_SW = 4'd4;
#10 POS_SW = 4'd5;
#10 POS_SW = 4'd6;
#10 POS_SW = 4'd7;
#10 POS_SW = 4'd8;
#10 POS_SW = 4'd9;
end

endmodule
