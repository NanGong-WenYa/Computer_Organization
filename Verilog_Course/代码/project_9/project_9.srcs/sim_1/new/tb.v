`timescale 1ns / 1ps

module tb_mult_32bit;
  parameter size = 32;
  reg [size-1:0] a, b;
  wire [2*size-1:0] outcome;
  mult_32bit dut (
    .outcome(outcome),
    .a(a),
    .b(b)
  );
  initial begin
    a = 32'b11110000111100001111000011110000;
    b = 32'b00001111000011110000111100001111;
    $display("Test Case 1:");
    $display("Input a = %b", a);
    $display("Input b = %b", b);
    #10;
    $display("Output outcome = %b", outcome);
    a = 32'b01010101010101010101010101010101;
    b = 32'b11111111000000001111111100000000;
    $display("Test Case 2:");
    $display("Input a = %b", a);
    $display("Input b = %b", b);
    #10;
    $display("Output outcome = %b", outcome);
    $finish;
  end
endmodule
