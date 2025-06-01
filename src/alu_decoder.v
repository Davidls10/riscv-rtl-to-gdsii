module alu_decoder (output reg [3-1:0] alu_control,
                    input [2-1:0] alu_op,
                    input [3-1:0] funct3,
                    input funct7_5,
                    input op5);

    always @* begin
        case (alu_op)
            2'b00: // lw, sw
                begin
                    alu_control = 3'b000; // add
                end
            2'b01: // beq
                begin
                    alu_control = 3'b001; // subtract
                end
            2'b10: // add
                case (funct3)
                    3'b000: // add for {op5, funct7_5} == 2'b00, 2'b01, 2'b10; subtract for {op5, funct7_5} == 2'b11
                        alu_control = ({op5, funct7_5} == 2'b00 || {op5, funct7_5} == 2'b01 || {op5, funct7_5} == 2'b10) ? 3'b000 : 3'b001;
                    3'b010:
                        alu_control = 3'b101; // set less than
                    3'b110:
                        alu_control = 3'b011; // or
                    3'b111:
                        alu_control = 3'b010; // and
                endcase
        endcase
    end
endmodule