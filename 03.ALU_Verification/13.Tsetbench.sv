// Code your testbench here
// or browse Examples

import uvm_pkg::*;

`include "uvm_macros.svh"



`include "interface.sv"
`include "alu_sequence_item.sv"
`include "alu_sequence.sv"
`include "alu_sequencer.sv"
`include "alu_driver.sv"
`include "alu_monitor.sv"
`include "alu_agent.sv"
`include "alu_scoreboard.sv"
`include "alu_environment.sv"
`include "alu_test.sv"

module tb;
  
  alu_inter intf();
  
  design_alu dut(intf);
  
  initial intf.clk=0;
  
  always #5 intf.clk=~intf.clk;
  
  initial begin
   intf.rst=1;
    #10;
    intf.rst=0;
  end
  
  initial begin
    uvm_config_db#(virtual alu_inter)::set(null,"*","intf",intf);
    run_test("alu_test");
     

  end
  initial begin
        $dumpfile("dump.vcd");
    $dumpvars;
    #250;
    $finish;
  end
  
endmodule
  
  
