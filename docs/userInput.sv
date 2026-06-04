module userInput (clock, reset, in, out);
	input logic clock, reset, in;
	output logic out;
	
	enum {T, F} ps, ns;
	always_comb begin
		case (ps)
		T: if (~in) ns = F;
		else ns = ps;
		F: if (in) ns = T;
		else ns = ps;
		endcase
	end
	
	assign out = ((ps == F) & (ns == T));
	
	always_ff @(posedge clock) begin
	if (reset)
	ps <= F;
	else
	ps <= ns;
	end
endmodule

module userInput_testbench();
logic clock, reset, in, out;

userInput dut (clock, reset, in, out);

parameter CLOCK_PERIOD=100;
initial begin
clock <= 0;
forever #(CLOCK_PERIOD/2) clock <= ~clock; // Forever toggle the clock
end
// Set up the inputs to the design. Each line is a clock cycle.
initial begin
	@(posedge clock);
	reset <= 1; repeat(1) @(posedge clock); // Always reset FSMs at start
	reset <= 0; in <= 0; repeat(1) @(posedge clock);
	in <= 1; repeat(1) @(posedge clock);
	in <= 0; repeat(1) @(posedge clock);
	in <= 1; repeat(1) @(posedge clock);
	in <= 0; repeat(1) @(posedge clock);
	in <= 1; repeat(1) @(posedge clock);
	in <= 0; repeat(1) @(posedge clock);
	in <= 1; repeat(1) @(posedge clock);
	in <= 0; repeat(1) @(posedge clock);
	
	$stop; // End the simulation.
	end
endmodule		