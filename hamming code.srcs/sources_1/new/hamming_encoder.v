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
    
    assign data_out = {d4, d3, d2, p3, d1, p2, p1};
    
    // 1, 3, 5, 7
    assign p1 = d1 ^ d2 ^ d4;
    
    // 2, 3, 6, 7
    assign p2 = d1 ^ d3 ^ d4;
    
    // 4, 5, 6, 7
    assign p3 = d2 ^ d3 ^ d4;
    
endmodule
