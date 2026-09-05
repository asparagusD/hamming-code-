`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2026 03:56:30 PM
// Design Name: 
// Module Name: hamming_encoder
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


module hamming_encoder(
    input [3:0] data_in, 
    output [6:0] data_out
    );
    
    wire p1, p2, p3;
    wire d1, d2, d3, d4;
    
    assign d1 = data_in[0];
    assign d2 = data_in[1];
    assign d3 = data_in[2];
    assign d4 = data_in[3];
    
    
endmodule
