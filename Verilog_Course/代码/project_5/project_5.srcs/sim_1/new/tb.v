`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 19:33:36
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


module tb;

    reg [15:0] a, b;
    reg cin;
    wire [15:0] sum;
    wire cout;

    // 实例化被测试的16位加法器
    add16 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // 初始化测试信号
    initial begin
        // 第一组测试用例
        a = 16'b0101_0101_0101_0101;
        b = 16'b0011_0011_0011_0011;
        cin = 1;

        // 延迟一段时间以观察输出
        #10;

        // 打印输出结果
        $display("Test Case 1: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        // 第二组测试用例
        a = 16'b1111_0000_1111_0000;
        b = 16'b0000_1111_0000_1111;
        cin = 0;

        // 延迟一段时间以观察输出
        #10;

        // 打印输出结果
        $display("Test Case 2: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

       

        // 终止仿真
        $finish;
    end

endmodule

