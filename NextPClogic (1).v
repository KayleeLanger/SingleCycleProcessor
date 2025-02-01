module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
   input [63:0] CurrentPC, SignExtImm64; 
   input 	Branch, ALUZero, Uncondbranch; 
   output [63:0] NextPC; 

   reg [63:0] next_address;

   assign NextPC = next_address; //assign addr to output

   always @(*) begin
	if (Uncondbranch || (Branch && ALUZero)) begin
		next_address = CurrentPC + (SignExtImm64 << 2); //if uncon branch or con branch with ALUZero set, branch addr
	end
	else begin
		next_address = CurrentPC + 4; //proceed to next addr
	end
   end 


endmodule
