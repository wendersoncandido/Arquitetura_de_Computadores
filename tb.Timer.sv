module testbench();
  logic [31:0] timestamp;
  logic reset, flagT;

    initial begin
        timestamp <= 300;
  end

  initial begin
        reset <= 1; # 60; reset <= 0;
  end

  timer #32 dut(timestamp,reset,flagT);
endmodule

module timer #(parameter N = 16)
             (input logic [N-1:0] Time,
              input logic reset,
              output logic flagTime);

    logic rtclk;
    logic [N-1:0] sum, timestamp;
  // generate clock to sequence tests
          always
           begin
               rtclk <= 1; # 30; rtclk <= 0; # 30;
        end


    flopr #N sumreg(rtclk,reset,sum,timestamp);
    adder #N somador(timestamp, 1, sum);
    comparator #N comp(timestamp, Time, flagTime);

endmodule

module adder #(parameter WIDTH=8)
              (input  logic [WIDTH-1:0] a, b,
               output logic [WIDTH-1:0] y);
             
  assign y = a + b;
endmodule

module flopr #(parameter WIDTH = 8)
              (input  logic             clk, reset,
               input  logic [WIDTH-1:0] d, 
               output logic [WIDTH-1:0] q);

  always_ff @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else       q <= d;
endmodule

module comparator #(parameter N=8)
                (input logic [N-1:0] a,b,
                 output logic eq);
      assign eq = (a == b);
endmodule

