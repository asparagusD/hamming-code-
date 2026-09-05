`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2026 04:18:35 PM
// Design Name: 
// Module Name: hamming_encoder_tb
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


module hamming_encoder_tb(

    );
    
    reg [3:0] data_in;
    wire [6:0] data_out;
    
    hamming_encoder dut(data_in, data_out);
    
    initial
        begin
            data_in = 4'b1101;
            #1;
            $display("the value of data_out is %b", data_out);
        end
    
endmodule
