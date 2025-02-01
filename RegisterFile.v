`timescale 1ns / 1ps
module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
    output [63:0] BusA;
    output [63:0] BusB;
    input [63:0] BusW;
    input[4:0] RA, RB,  RW;
    input RegWr;
    input Clk;

    reg [63:0] registers [31:0]; // 32 regs, each 64 bits wide 
    
    initial begin 
	registers[31] = 64'h0; // Initialize 32 registers
    end 
     
    assign #2 BusA = (RA == 5'd31) ? 64'h0:  registers[RA];// Read Operations 
    assign #2 BusB = (RB == 5'd31) ? 64'h0:  registers[RB];
     
    always @ (negedge Clk) begin // Write operations 
        if(RegWr && RW != 5'd31) begin // Write if RW is not 31 and RegWr enabled  
            registers[RW] <= #3 BusW;
	end
    end
endmodule
