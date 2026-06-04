module flipFlop (clock, reset, in, out);
	input logic clock, reset, in;
	output logic out;
	
	always_ff @(posedge clock) begin
	if (reset) out <= 0;
	else out <= in;
	end
endmodule
