module SimpleCalculator(
    input [7:0] ina,
    input [7:0] inb,
    output reg [7:0] sumab,
    output reg sumflag,
    output reg [7:0] leftshiftA,
    output reg lessflag,
    output reg equalflag,
    output reg [7:0] bitXorflag
);

    // ��������ĺ�
    always @*
        sumab = ina + inb;

    // ����Ƿ��н�λ
    always @*
        sumflag = (ina + inb) > 255 ? 1 : 0;

    // ina �����߼���λ���ƶ���λ��Ϊ inb
    always @*
        leftshiftA = ina << inb;

    // ina �Ƿ�С�� inb
    always @*
        lessflag = (ina < inb) ? 1 : 0;

    // ina �Ƿ���� inb
    always @*
        equalflag = (ina == inb) ? 1 : 0;

    // ina ��λ���
    always @*
        bitXorflag = ina ^ inb;

endmodule
