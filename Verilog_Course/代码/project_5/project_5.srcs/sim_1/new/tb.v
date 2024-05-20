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

    // ʵ���������Ե�16λ�ӷ���
    add16 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // ��ʼ�������ź�
    initial begin
        // ��һ���������
        a = 16'b0101_0101_0101_0101;
        b = 16'b0011_0011_0011_0011;
        cin = 1;

        // �ӳ�һ��ʱ���Թ۲����
        #10;

        // ��ӡ������
        $display("Test Case 1: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        // �ڶ����������
        a = 16'b1111_0000_1111_0000;
        b = 16'b0000_1111_0000_1111;
        cin = 0;

        // �ӳ�һ��ʱ���Թ۲����
        #10;

        // ��ӡ������
        $display("Test Case 2: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

       

        // ��ֹ����
        $finish;
    end

endmodule

