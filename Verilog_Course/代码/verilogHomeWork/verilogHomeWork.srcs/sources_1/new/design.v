
`timescale 1ns / 1ps 
module  JudgeScore(
    input wire clk, 
    input wire rst,  
    input wire [3:0] scores,  
    output reg[5:0] average_score, 
    output reg [2:0] counter 
   
);
reg[5:0] total_score;
reg [3:0] score_array [6:0]; 
integer i;
reg [3:0] max_score, min_score; 
always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;
        average_score <= 0;
        max_score <= 0;
        min_score <= 15;
        for ( i = 0; i < 7; i = i + 1) begin
            score_array[i] <= 0;
        end
    end
    else begin
        score_array[counter] <= scores;
        counter <= counter + 1;
        if (counter >= 3) begin
            max_score = score_array[0];
            min_score = score_array[0];
            total_score <= 0;
            for (i = 0; i < 7; i = i + 1) begin
                if (score_array[i] > max_score)
                    max_score = score_array[i];
                if (score_array[i] < min_score)
                    min_score = score_array[i];
                total_score = total_score + score_array[i];
            end 
            average_score = (total_score - max_score - min_score) / 5;
        end
    end
end


endmodule
