module score (clock, reset, in, out, HEX, loss);
	input logic clock, reset, in, loss;
	output logic out;
	output logic [6:0] HEX;
	
	enum {w0, w1, w2, w3, w4, w5, w6, w7, w8, w9} ps, ns;
	always_comb begin
	case (ps)
		w0: ns = w1;
		w1: ns = w2;
		w2: ns = w3;
		w3: ns = w4;
		w4: ns = w5;
		w5: ns = w6;
		w6: ns = w7;
		w7: ns = w8;
		w8: ns = w9;
		w9: ns = w0;
		endcase
	end
	
	assign out = ((ps == w9) & in);
	
	always_comb begin
	case (ps)
		w0: HEX = 7'b1000000;
		w1: HEX = 7'b1111001;
		w2: HEX = 7'b0100100;
		w3: HEX = 7'b0110000;
		w4: HEX = 7'b0011001;
		w5: HEX = 7'b0010010;
		w6: HEX = 7'b0000010;
		w7: HEX = 7'b1111000;
		w8: HEX = 7'b0000000;
		w9: HEX = 7'b0011000;
		endcase
	end
	
	always_ff @(posedge clock) begin
		if (reset | loss)
		ps <= w0;
		else if (in)
			ps <= ns;
		else
		ps <= ps;
		end
	endmodule
	
module score_testbench();
logic clock, reset, in, out, HEX, loss;

score dut (clock, reset, in, out, HEX, loss);

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
	in <= 1; repeat(1) @(posedge clock);
	in <= 0; repeat(1) @(posedge clock);
	in <= 1; repeat(1) @(posedge clock);
	in <= 0; repeat(1) @(posedge clock);
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