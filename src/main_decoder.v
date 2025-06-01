module main_decoder (input [7-1:0] opcode,
                     output reg reg_write,
                     output reg [2-1:0] imm_src,
                     output reg alu_src,
                     output reg mem_write,
                     output reg [2-1:0] result_src,
                     output reg branch,
                     output reg [2-1:0] alu_op,
                     output reg jump
                    );

    always @* begin
        case (opcode)
            7'b0000011: // lw
                begin
                    reg_write = 1'b1;
                    imm_src = 2'b00;
                    alu_src = 1'b1;
                    mem_write = 1'b0;
                    result_src = 2'b01;
                    branch = 1'b0;
                    alu_op = 2'b00;
                    jump = 1'b0;
                end
            7'b0100011: // sw
                begin
                    reg_write = 1'b0;
                    imm_src = 2'b01;
                    alu_src = 1'b1;
                    mem_write = 1'b1;
                    result_src = 2'bXX;
                    branch = 1'b0;
                    alu_op = 2'b00;
                    jump = 1'b0;
                end
            7'b0110011: // R-type or
                begin
                    reg_write = 1'b1;
                    imm_src = 2'bXX;
                    alu_src = 1'b0;
                    mem_write = 1'b0;
                    result_src = 2'b00;
                    branch = 1'b0;
                    alu_op = 2'b10;
                    jump = 1'b0;
                end
            7'b0110011: // R-type and
                begin
                    reg_write = 1'b1;
                    imm_src = 2'bXX;
                    alu_src = 1'b0;
                    mem_write = 1'b0;
                    result_src = 2'b00;
                    branch = 1'b0;
                    alu_op = 2'b10;
                    jump = 1'b0;
                end
            7'b1100011: // beq
                begin
                    reg_write = 1'b0;
                    imm_src = 2'b10;
                    alu_src = 1'b0;
                    mem_write = 1'b0;
                    result_src = 2'bXX;
                    branch = 1'b1;
                    alu_op = 2'b01;
                    jump = 1'b0;
                end
            7'b0010011: // addi
                begin
                    reg_write = 1'b1;
                    imm_src = 2'b00;
                    alu_src = 1'b1;
                    mem_write = 1'b0;
                    result_src = 2'b00;
                    branch = 1'b0;
                    alu_op = 2'b10;
                    jump = 1'b0;
                end
            7'b1101111: // jal
                begin
                    reg_write = 1'b1;
                    imm_src = 2'b00;
                    alu_src = 1'b1;
                    mem_write = 1'b0;
                    result_src = 2'b10;
                    branch = 1'b0;
                    alu_op = 2'bXX;
                    jump = 1'b1;
                end
        endcase
    end

endmodule