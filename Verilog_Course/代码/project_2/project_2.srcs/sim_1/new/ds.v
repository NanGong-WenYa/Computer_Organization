`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/19 11:42:08
// Design Name: 
// Module Name: ds
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

`timescale 1ns / 1ps // 定义时间单位

module SimpleCalculator_tb;

    reg [7:0] ina;  // 输入信号
    reg [7:0] inb;  // 输入信号

    wire [7:0] sumab;      // 输出信号
    wire sumflag;
    wire [7:0] leftshiftA;
    wire lessflag;
    wire equalflag;
    wire [7:0] bitXorflag;

    // 实例化被测模块
    SimpleCalculator dut (
        .ina(ina),
        .inb(inb),
        .sumab(sumab),
        .sumflag(sumflag),
        .leftshiftA(leftshiftA),
        .lessflag(lessflag),
        .equalflag(equalflag),
        .bitXorflag(bitXorflag)
    );

    // 时钟发生器
    reg clk = 0;

    always #5 clk = ~clk; // 时钟周期为10个时间单位

    initial begin
        // 初始化输入信号
        ina = 8'b10101010;  // 170
        inb = 8'b00110011;  // 51

        // 模拟测试
        #20; // 等待一段时间

        // 打印结果
        $display("ina: %b, inb: %b", ina, inb);
        $display("sumab: %b, sumflag: %b", sumab, sumflag);
        $display("leftshiftA: %b", leftshiftA);
        $display("lessflag: %b, equalflag: %b", lessflag, equalflag);
        $display("bitXorflag: %b", bitXorflag);

        // 结束仿真
        $finish;
    end

endmodule

