`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 18:50:21
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




module add1_tb;

    // 定义被测模块的信号
    reg a, b, cin;
    wire sum, cout;

    // 实例化被测模块
    add1 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // 初始化测试信号
    initial begin
        // 设置输入值
        a = 0;
        b = 1;
        cin = 1;

        // 延迟一段时间以观察输出
        #10;

        // 打印输出结果
        $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        // 更改输入值
        a = 1;
        b = 1;
        cin = 0;

        // 延迟一段时间以观察输出
        #10;

        // 打印输出结果
        $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

    end

endmodule

