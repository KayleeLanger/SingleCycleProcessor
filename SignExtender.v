module SignExtender(
        output reg [63:0] BusImm,
        input [25: 0] Inst,
        input [2:0] Ctrl
);
   always @(*) begin
        case(Ctrl)
           3'b000: begin
              BusImm = {52'b0, Inst[21:10]};// I type
           end
           3'b001: begin
              BusImm = {{55{Inst[20]}}, Inst[20:12]};// D-type
           end
           3'b010: begin
              BusImm = {{38{Inst[25]}}, Inst[25:0]}; // B type
           end
           3'b011: begin
              BusImm = {{45{Inst[23]}}, Inst[23:5]}; // CBZ type
           end
	   3'b100: begin //MOVZ 
	       BusImm = {48'b0, Inst[20:5]};
	   end
           3'b101: begin
	        BusImm = {32'b0, Inst[20:5], 16'b0};
           end
           3'b110: begin
                 BusImm = {16'b0, Inst[20:5], 32'b0 };
	   end
           3'b111: begin
		 BusImm = {Inst[20:5], 48'b0};
	   end
           default: BusImm = 64'b0;
        endcase
     end

endmodule
