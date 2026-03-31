class alu_environment extends uvm_env;
  `uvm_component_utils(alu_environment)
  
  alu_agent ag;
  alu_scoreboard scb;
  
  function new(string name="environment",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    ag=alu_agent::type_id::create("ag",this);
    scb=alu_scoreboard::type_id::create("scb",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    ag.mon.send.connect(scb.receive);
  endfunction
endclass
