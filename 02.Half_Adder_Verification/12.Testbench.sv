// Code your testbench here
// or browse Examples
import uvm_pkg::*;

`include "uvm_macros.svh"

`include "interface.sv"
`include "trans.sv"
`include "seq.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb;
  intf intff();
  
  half_adder dut(intff);
  
  initial begin
    
    uvm_config_db#(virtual intf)::set(null,"*","intff",intff);

    run_test("test");
 
    $dumpfile("dump.vcd");
    $dumpvars;
    #100;
    $finish;
  end
endmodule
  
  
