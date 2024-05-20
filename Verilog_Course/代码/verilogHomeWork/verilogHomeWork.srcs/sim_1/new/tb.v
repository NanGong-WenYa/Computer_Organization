`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 16:38:10
// Design Name: 
// Module Name: tb
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

module JudgeScore_tb;
  reg clk;
  reg rst;
  reg [3:0] scores;
  wire [2:0] counter; 
  wire [5:0] average_score;
  JudgeScore dut (
    .clk(clk),
    .rst(rst),
    .scores(scores),
     .counter(counter) ,
    .average_score(average_score)
   
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  // ∑¬’Ê ‰»Î
  initial begin

    rst = 1;
    scores = 0;
    #10 rst = 0;

    scores = 3;
    #10 scores = 7;
    #10 scores = 8;
    #10 scores = 5;
    #10 scores = 10;
    #10 scores = 12;
    #10 scores = 15;

#100;

rst=1;
scores=0;
#10 rst=0;

scores=4;
    #10 scores = 7;
#10 scores = 9;
#10 scores = 10;
#10 scores = 5;
#10 scores = 3;
#10 scores = 6;
#100;
$stop;
  end
    
  
  


endmodule

