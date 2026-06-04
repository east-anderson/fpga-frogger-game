module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_1);
input logic CLOCK_50; // 50MHz clock.
output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
output logic [9:0] LEDR;
input logic [3:0] KEY; // True when not pressed, False when pressed
input logic [9:0] SW;
output logic [35:0] GPIO_1;
// Generate clk off of CLOCK_50, whichClock picks rate.
logic reset;
logic [31:0] div_clk;
assign reset = SW[9];
parameter whichClock = 15; // 0.75 Hz clock
clock_divider cdiv (.clock(CLOCK_50), .reset(reset), .divided_clocks(div_clk));
// Clock selection; allows for easy switching between simulation and board clocks
logic clkSelect;
// Uncomment ONE of the following two lines depending on intention
//assign clkSelect = CLOCK_50; // for simulation
assign clkSelect = CLOCK_50; // for board



// Set up FSM inputs and outputs.
//logic w1, w2, out1, out2, out3;
//assign w1 = SW[1]; // input is SW[1]
//assign w2 = SW[0];
//simple s (.clk(clkSelect), .reset, .w1, .w2, .out1, .out2, .out3);
//// Show signals on LEDRs so we can see what is happening
//assign LEDR[9] = clkSelect;
//assign LEDR[8] = reset;
//assign LEDR[2] = out1;
//assign LEDR[1] = out2;
//assign LEDR[0] = out3;
//endmodule
logic playerOut, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10;
logic o1, o2, o3, o4, leftPress, rightPress, upPress, downPress, leftOut, rightOut, upOut, downOut, speed, win, d0, d1, d2, d3, d4, d5, loss, winSignal1, winSignal2, winSignal3, winSignal4, winSignal5, winSignal6;
logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs

LEDDriver Driver (.CLK(div_clk[14]), .RST(reset), .EnableCount(1'b1), .RedPixels, .GrnPixels, .GPIO_1);
flipFlop flip1 (.clock(clkSelect), .reset, .in(~KEY[3]), .out(o1));
flipFlop flip2 (.clock(clkSelect), .reset, .in(o1), .out(leftPress));
flipFlop flop1 (.clock(clkSelect), .reset, .in(~KEY[2]), .out(o2));
flipFlop flop2 (.clock(clkSelect), .reset, .in(o2), .out(upPress));
flipFlop flippy1 (.clock(clkSelect), .reset, .in(~KEY[1]), .out(o3)); 
flipFlop flippy2 (.clock(clkSelect), .reset, .in(o3), .out(downPress));
flipFlop floppy1 (.clock(clkSelect), .reset, .in(~KEY[0]), .out(o4));
flipFlop floppy2 (.clock(clkSelect), .reset, .in(o4), .out(rightPress));
userInput left (.clock(clkSelect), .reset, .in(leftPress), .out(leftOut));
userInput right (.clock(clkSelect), .reset, .in(rightPress), .out(rightOut));
userInput up (.clock(clkSelect), .reset, .in(upPress), .out(upOut));
userInput down (.clock(clkSelect), .reset, .in(downPress), .out(downOut));
counter trafficSpeed (.clock(clkSelect), .reset, .out(speed));
frog player (.reset, .RedPixels, .GrnPixels, .clock(clkSelect), .up(upOut), .down(downOut), .left(leftOut), .right(rightOut), .win, .loss);
road traffic (.reset, .RedPixels, .GrnPixels, .clock(speed));
score display1 (.clock(clkSelect), .reset, .in(win), .out(d0), .HEX(HEX0), .loss);
score display2 (.clock(clkSelect), .reset, .in(winSignal1), .out(d1), .HEX(HEX1), .loss);
score display3 (.clock(clkSelect), .reset, .in(winSignal2), .out(d2), .HEX(HEX2), .loss);
score display4 (.clock(clkSelect), .reset, .in(winSignal3), .out(d3), .HEX(HEX3), .loss);
score display5 (.clock(clkSelect), .reset, .in(winSignal4), .out(d4), .HEX(HEX4), .loss);
score display6 (.clock(clkSelect), .reset, .in(winSignal5), .out(d5), .HEX(HEX5), .loss);
userInput winner1 (.clock(clkSelect), .reset, .in(d0), .out(winSignal1));
userInput winner2(.clock(clkSelect), .reset, .in(d1), .out(winSignal2));
userInput winner3 (.clock(clkSelect), .reset, .in(d2), .out(winSignal3));
userInput winner4 (.clock(clkSelect), .reset, .in(d3), .out(winSignal4));
userInput winner5 (.clock(clkSelect), .reset, .in(d4), .out(winSignal5));
userInput winner6 (.clock(clkSelect), .reset, .in(d5), .out(winSignal6));
endmodule

module DE1_SoC_testbench();
logic CLOCK_50;
logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
logic [9:0] LEDR;
logic [3:0] KEY;
logic [9:0] SW;
logic [35:0] GPIO_1;
logic reset;
DE1_SoC dut (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_1);
// Set up a simulated clock.
parameter CLOCK_PERIOD=100;
initial begin
CLOCK_50 <= 0;
forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock
end                                                                                                                                                                                                                                                                                                                         
// Test the design.
initial begin

SW[9] <= 1; repeat(1) @(posedge CLOCK_50); // Always reset FSMs at start
SW[9] <= 0; KEY[3] <= 0; KEY[2] <= 0; KEY[1] <= 0; KEY[0] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[1] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[1] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[0] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[0] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[0] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[0] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[3] <= 0; repeat(1) @(posedge CLOCK_50);                                                                                                                                                                                                                                                                                                                                               
KEY[2] <= 1; repeat(1) @(posedge CLOCK_50);
KEY[2] <= 0; repeat(1) @(posedge CLOCK_50);
repeat(5) @(posedge CLOCK_50);




$stop; // End the simulation.
end
endmodule
