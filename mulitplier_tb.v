`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 21:40:03
// Design Name: 
// Module Name: mulitplier_tb
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




module multiplier_tb(

    );
parameter n_bits = 5;

//inputs 
reg [n_bits-1:0] a_in;
reg [n_bits-1:0] b_in;
reg clk;
reg start;
reg reset;

//outputs
wire [(n_bits*2)-1:0] out;
wire finish;
wire [(((n_bits*2)/3)+1)*4-1:0] bcd;


multiplier uut (
                .out(out),
                .a_in(a_in),
                .b_in(b_in),
                .clk(clk),
                .start(start),
                .reset(reset),
                .finish(finish),
                .bcd(bcd));
defparam uut.N = n_bits;
initial 
begin 
forever
    #50 clk = ~clk;
end 
initial begin 
    a_in = 0;
    b_in = 0;
    clk = 0;
    start = 0;
    reset = 0;
    
    #100
    
    a_in = 'd26;
    b_in = 'd30;
    start = 0;
    #200
    start = 1;
    #1000
    a_in = 'd13;
    b_in = 'd13;
    start = 0;
    #200
    start = 1;
 end  
                
                
endmodule


