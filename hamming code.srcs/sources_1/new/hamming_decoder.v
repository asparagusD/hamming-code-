`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2026 04:25:48 PM
// Design Name: 
// Module Name: hamming_decoder
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


module hamming_decoder(
    input [6:0] code_in,
    output reg [3:0] data_out, output [2:0] error_pos,
    output error_detected, output reg [6:0] corrected_code
    );
    
    wire d1, d2, d3, d4;
    wire p1, p2, p3;
    wire s1, s2, s3;
    wire [2:0] syndrome;
    reg [6:0] corrected;
    
    assign {d4, d3, d2, p3, d1, p2, p1} = code_in;
    
    // 1, 3, 5, 7
    assign s1 = p1 ^ d1 ^ d2 ^ d4;
    
    // 2, 3, 6, 7
    assign s2 = p2 ^ d1 ^ d3 ^ d4;
    
    // 4, 5, 6, 7
    assign s3 = p3 ^ d2 ^ d3 ^ d4;
    
    
    assign syndrome = {s3, s2, s1};
    assign error_pos = syndrome;
    
    always@(*)
        begin
            corrected = code_in;
            
            case (syndrome)
                3'b000 : corrected = code_in;   // no error
                3'b001 : corrected = code_in ^ 7'b0000001;
                3'b010 : corrected = code_in ^ 7'b0000010;
                3'b011 : corrected = code_in ^ 7'b0000100;
                3'b100 : corrected = code_in ^ 7'b0001000;
                3'b101 : corrected = code_in ^ 7'b0010000;
                3'b110 : corrected = code_in ^ 7'b0100000;
                3'b111 : corrected = code_in ^ 7'b1000000;
                
                
            endcase
        
        assign corrected_code = corrected;
        
        data_out[0] = corrected[2];
        data_out[1] = corrected[4];
        data_out[2] = corrected[5];
        data_out[3] = corrected[6];
        
        end
    
endmodule
