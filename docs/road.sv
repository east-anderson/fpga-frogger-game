module road(reset, RedPixels, GrnPixels, clock);
    input logic               reset, clock;
    output logic [15:0][15:0] RedPixels; // 16x16 array of red LEDs
    input logic [15:0][15:0] GrnPixels; // 16x16 array of green LEDs
	 
	 enum {s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16} ps, ns;
	 always_comb begin
	 case (ps)
		s1: ns = s2;
		s2: ns = s3;
		s3: ns = s4;
		s4: ns = s5;
		s5: ns = s6;
		s6: ns = s7;
		s7: ns = s8;
		s8: ns = s9;
		s9: ns = s10;
		s10: ns = s11;
		s11: ns = s12;
		s12: ns = s13;
		s13: ns = s14;
		s14: ns = s15;
		s15: ns = s16;
		s16: ns = s1;
	 endcase
	 end 
		  
	 always_comb begin
		case(ps)
		
		s1: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0011000101110011; //road 4
		  RedPixels[02] = 16'b0110001111001110;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0101110001110011; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1111000110001100;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b1100110000111100; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b0001111001110011;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b1001001110011001; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0111001101100110;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s2: begin
		  //                  FEDCBA9876543210
		  
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0110001011100110; //road 4
		  RedPixels[02] = 16'b0011000111100111;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b1011100011100110; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0111100011000110;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b1001100001111001; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b1000111100111001;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0010011100110011; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0011100110110011;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s3: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b1100010111001100; //road 4
		  RedPixels[02] = 16'b1001100011110011;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0111000111001101; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0011110001100011;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b0011000011110011; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b1100011110011100;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0100111001100110; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b1001110011011001;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s4: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b1000101110011001; //road 4
		  RedPixels[02] = 16'b1100110001111001;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b1110001110011010; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1001111000110001;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b0110000111100110; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b0110001111001110;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b1001110011001100; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b1100111001101100;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s5: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0001011100110011; //road 4
		  RedPixels[02] = 16'b1110011000111100;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b1100011100110101; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1100111100011000;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b1100001111001100; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b0011000111100111;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0011100110011001; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0110011100110110;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s6: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0010111001100110; //road 4
		  RedPixels[02] = 16'b0111001100011110;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b1000111001101011; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0110011110001100;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b1000011110011001; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b1001100011110011;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0111001100110010; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0011001110011011;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s7: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0101110011001100; //road 4
		  RedPixels[02] = 16'b0011100110001111;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0001110011010111; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0011001111000110;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b0000111100110011; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b1100110001111001;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b1110011001100100; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b1001100111001101;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s8: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b1011100110011000; //road 4
		  RedPixels[02] = 16'b1001110011000111;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0011100110101110; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0001100111100011;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b0001111001100110; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b1110011000111100;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b1100110011001001; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b1100110011100110;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s9: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0111001100110001; //road 4
		  RedPixels[02] = 16'b1100111001100011;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0111001101011100; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1000110011110001;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b0011110011001100; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b0111001100011110;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b1001100110010011; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0110011001110011;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s10: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b1110011001100010; //road 4
		  RedPixels[02] = 16'b1110011100110001;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b1110011010111000; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1100011001111000;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b0111100110011000; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b0011100110001111;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0011001100100111; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b1011001100111001;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s11: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b1100110011000101; //road 4
		  RedPixels[02] = 16'b1111001110011000;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b1100110101110001; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0110001100111100;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b1111001100110000; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b1001110011000111;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0110011001001110; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b1101100110011100;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s12: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b1001100110001011; //road 4
		  RedPixels[02] = 16'b0111100111001100;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b1001101011100011; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0011000110011110;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b1110011001100001; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b1100111001100011;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b1100110010011100; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0110110011001110;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s13: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0011001100010111; //road 4
		  RedPixels[02] = 16'b0011110011100110;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0011010111000111; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0001100011001111;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b1100110011000011; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b1110011100110001;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b1001100100111001; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0011011001100111;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s14: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0110011000101110; //road 4
		  RedPixels[02] = 16'b0001111001110011;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0110101110001110; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1000110001100111;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b1001100110000111; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b1111001110011000;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0011001001110011; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b1001101100110011;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s15: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b1100110001011100; //road 4
		  RedPixels[02] = 16'b1000111100111001;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b1101011100011100; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1100011000110011;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b0011001100001111; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b0111100111001100;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0110010011100110; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b1100110110011001;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 s16: begin
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b1001100010111001; //road 4
		  RedPixels[02] = 16'b1100011110011100;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b1010111000111001; //road 3
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1110001100011001;
		  RedPixels[07] = 16'b0000000000000000;
		  RedPixels[08] = 16'b0110011000011110; //road 2
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b0011110011100110;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b1100100111001100; // road 1
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b1110011011001100;
		  RedPixels[15] = 16'b0000000000000000; // start
		  end
		 endcase
		end
		
		always_ff @(posedge clock) begin
			if (reset)
				ps <= s1;
			else 
				ps <= ns;
			end
		
	 

endmodule


module road_testbench();

logic reset, clock;
logic [15:0][15:0] RedPixels, GrnPixels;
	
road dut (reset, RedPixels, GrnPixels, clock);
	
parameter CLOCK_PERIOD=100;
initial begin
clock <= 0;
forever #(CLOCK_PERIOD/2) clock <= ~clock; // Forever toggle the clock
end
// Set up the inputs to the design. Each line is a clock cycle.
initial begin
	@(posedge clock);
	reset <= 1; repeat(1) @(posedge clock); // Always reset FSMs at start
	reset <= 0; repeat(1) @(posedge clock);
	repeat(18) @(posedge clock);
	reset <= 1; repeat(5) @(posedge clock);
	reset <= 0; repeat(1) @(posedge clock);
	repeat(5) @(posedge clock);
	
	$stop; // End the simulation.
	end
endmodule			
	
