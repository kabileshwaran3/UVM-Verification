class envi extends uvm_env;
  `uvm_component_utils(envi);
  
  agent agt;  
    sco scb;
  
  
  function new(string name = "env",uvm_component parent);
    super.new(name,parent);
    
    `uvm_info("ENV", "Environment Created", UVM_LOW)
    
  endfunction
 
   function void build_phase(uvm_phase phase);
   
    super.build_phase(phase);
    scb = sco::type_id::create("scb",this);
   agt = agent::type_id::create("agt",this);
  
  endfunction
  
  function void connect_phase(uvm_phase phase);
   
    super.connect_phase(phase);
    agt.mon.port_tx.connect(scb.port_rx);
    
  endfunction
endclass
