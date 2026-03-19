class environment extends uvm_env;
  `uvm_component_utils(environment)
  
  agent ag;
  scoreboard scb;
  
  function new(string name="environment",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    ag=agent::type_id::create("ag",this);
    scb=scoreboard::type_id::create("scoreboard",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    ag.mon.send.connect(scb.receive);
  endfunction
endclass
