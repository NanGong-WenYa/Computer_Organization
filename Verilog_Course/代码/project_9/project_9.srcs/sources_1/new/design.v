`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/06 19:05:59
// Design Name: 
// Module Name: design
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

module mult_32bit(
  output reg [2*size-1:0] outcome, 
  input [size-1:0] a, b
);

  parameter size = 32;
  reg [2*size-1:0] outcome_temp;
  integer i;

  always @ (a or b)
  begin
    outcome_temp = 0;
    for (i = 0; i < size; i = i + 1) begin
      if (b[i] == 1) begin
        outcome_temp = outcome_temp + (a << i);
      end
    end
    outcome <= outcome_temp; 
  end

endmodule


