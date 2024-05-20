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

    // ���屻��ģ����ź�
    reg a, b, cin;
    wire sum, cout;

    // ʵ��������ģ��
    add1 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // ��ʼ�������ź�
    initial begin
        // ��������ֵ
        a = 0;
        b = 1;
        cin = 1;

        // �ӳ�һ��ʱ���Թ۲����
        #10;

        // ��ӡ������
        $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        // ��������ֵ
        a = 1;
        b = 1;
        cin = 0;

        // �ӳ�һ��ʱ���Թ۲����
        #10;

        // ��ӡ������
        $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

    end

endmodule

