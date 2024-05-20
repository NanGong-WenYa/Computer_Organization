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

    // 两个输入的和
    always @*
        sumab = ina + inb;

    // 检查是否有进位
    always @*
        sumflag = (ina + inb) > 255 ? 1 : 0;

    // ina 向左逻辑移位，移动的位数为 inb
    always @*
        leftshiftA = ina << inb;

    // ina 是否小于 inb
    always @*
        lessflag = (ina < inb) ? 1 : 0;

    // ina 是否等于 inb
    always @*
        equalflag = (ina == inb) ? 1 : 0;

    // ina 按位异或
    always @*
        bitXorflag = ina ^ inb;

endmodule
