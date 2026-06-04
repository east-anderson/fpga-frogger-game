module counter (clock, reset, out);
	input logic clock, reset;
	output logic out;
	logic resetCount;
	logic [25:0] num;
	always_ff @(posedge clock) begin
	if (reset | resetCount) begin
		num <= 0;
		out <= 0;
		resetCount <= 0;
		end
	else begin
		num <= num + 1;
		if (num == 26'd50000000) begin
			out <= 1;
			resetCount <= 1;
			end
		end 
	end
endmodule 

module counter_testbench();
logic clock, reset, out;
logic [25:0] num;
logic resetCount;

counter dut(clock, reset, out);

parameter CLOCK_PERIOD=100;
initial begin
clock <= 0;
forever #(CLOCK_PERIOD/2) clock <= ~clock; // Forever toggle the clock
end
// Set up the inputs to the design. Each line is a clock cycle.
initial begin
	@(posedge clock);
	reset <= 1; repeat(1) @(posedge clock); // Always reset FSMs at start
	reset <= 0; num <= 26'd49999999; repeat(1) @(posedge clock);
	repeat(1) @(posedge clock);
	repeat(1) @(posedge clock);
	repeat(1) @(posedge clock);
	
	$stop; // End the simulation.
	end
endmodule		
