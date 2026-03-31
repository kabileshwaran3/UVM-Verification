class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent)
  
  alu_sequencer seq;
  alu_driver dr;
  alu_monitor mon;
  
  function new(string name="Agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    seq=alu_sequencer::type_id::create("seq",this);
    dr=alu_driver::type_id::create("dr",this);
    mon=alu_monitor::type_id::create("mon",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    dr.seq_item_port.connect(seq.seq_item_export);
  endfunction
endclass

    
