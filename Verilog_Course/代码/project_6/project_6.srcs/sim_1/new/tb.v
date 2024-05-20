`timescale 1ns / 1ps

module tb_add32;

    // 定义被测试模块的信号
    reg [31:0] a, b;
    reg cin;
    wire [31:0] sum;
    wire cout;

    // 实例化被测试的模块
    add32 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // 初始化信号值
    initial begin
        // 设置测试输入值
        a = 32'b11001100110011001100110011001100;
        b = 32'b10101010101010101010101010101010;
        cin = 1'b0;

        // 等待一段时间以便观察输出
        #10;

        // 输出结果
        $display("a = %b", a);
        $display("b = %b", b);
        $display("cin = %b", cin);
        $display("sum = %b", sum);
        $display("cout = %b", cout);

        // 结束仿真
        $finish;
    end

endmodule
