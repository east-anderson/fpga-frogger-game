// make score reset after losing
// increment score after winning

module frog(reset, RedPixels, GrnPixels, clock, up, down, left, right, win, loss);
	input logic reset, up, down, left, right, clock;
	output logic [15:0][15:0] GrnPixels;
	input logic [15:0][15:0] RedPixels;
	logic squished;
	logic [15:0] x, y;
	output logic win, loss;
	
	assign win = ((y == 0) & up);
	
	always_ff @(posedge clock) begin
	if (reset | squished) begin
		GrnPixels[15:0] = 16'b0000000000000000;
		x = 16'd7;
		y = 16'd15;
		GrnPixels[y][x] = 1;
		squished = 0;
		loss = 0;
		//win = 0;
		end
	else if (up) begin
		GrnPixels[y][x] = 0;
		if (y == 0) begin
			y = 16'd15;
			//win = 1;
			
			end
		else 
			y = y - 1;
		GrnPixels[y][x] = 1;
		if (RedPixels[y][x] == 1) begin
			GrnPixels[y][x] = 0;
			squished = 1;
			loss = 1;
			end
		end
	else if (down) begin
		GrnPixels[y][x] = 0;
		if (y != 16'd15)
			y = y + 1;
		GrnPixels[y][x] = 1;
		if (RedPixels[y][x] == 1) begin
			GrnPixels[y][x] = 0;
			squished = 1;
			loss = 1;
			end
		end
	else if (left) begin
		GrnPixels[y][x] = 0;
		if (x != 16'd15)
			x = x + 1;
		GrnPixels[y][x] = 1;
		if (RedPixels[y][x] == 1) begin
			GrnPixels[y][x] = 0;
			squished = 1;
			loss = 1;
			end
		end
	else if (right) begin
		GrnPixels[y][x] = 0;
		if (x != 16'd0)
			x = x - 1;
		GrnPixels[y][x] = 1;
		if (RedPixels[y][x] == 1) begin
			GrnPixels[y][x] = 0;
			squished = 1;
			loss = 1;
			end
		end
	else 
		GrnPixels[y][x] = 1;
		if (RedPixels[y][x] == 1) begin
			GrnPixels[y][x] = 0;
			squished = 1;
			loss = 1;
			end
	end

	endmodule

module frog_testbench();
logic reset, up, down, left, right, clock;
logic [15:0][15:0] GrnPixels;
logic [15:0][15:0] RedPixels;
logic win, loss;

frog dut (reset, RedPixels, GrnPixels, clock, up, down, left, right, win, loss);

parameter CLOCK_PERIOD=100;
initial begin
clock <= 0;
forever #(CLOCK_PERIOD/2) clock <= ~clock; // Forever toggle the clock
end
// Set up the inputs to the design. Each line is a clock cycle.
initial begin
	@(posedge clock);
	reset <= 1; repeat(1) @(posedge clock); // Always reset FSMs at start
	reset <= 0; left <= 0; right <= 0; up <= 0; down <= 0; repeat(1) @(posedge clock);
	down <= 1; repeat(1) @(posedge clock);
	down <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	right <= 1; repeat(1) @(posedge clock);
	right <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	down <= 1; repeat(1) @(posedge clock);
	down <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock); // test edge of display
	left <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	left <= 1; repeat(1) @(posedge clock);
	left <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);	// test when frog reaches the top of the display
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	up <= 1; repeat(1) @(posedge clock);
	up <= 0; repeat(1) @(posedge clock);
	
	
	$stop; // End the simulation.
	end
endmodule		


	