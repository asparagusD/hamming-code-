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
    
    wire [3:0] data_out_decoder;
    wire [2:0] error_pos;
    wire error_detected;
    wire [6:0] corrected_code;
    wire [6:0] data_out_temp;
    
    assign data_out_temp = data_out + 1'b1;
    
    hamming_encoder dut1(data_in, data_out);
    hamming_decoder dut2(data_out_temp, data_out_decoder, error_pos, error_detected, corrected_code);
    
    initial
        begin
            data_in = 4'b1101;
            #1;
            $display("the value of data_out is %b", data_out);
            
            #10;
            $display("data received by decoder is %b", data_out_temp);
            $display("the value of error_pos is %b", error_pos);
            $display("corrected code from the decoder is %b", corrected_code);
        end
    
endmodule
