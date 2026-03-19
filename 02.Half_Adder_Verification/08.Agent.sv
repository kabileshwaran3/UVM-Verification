class agent extends uvm_agent;
  `uvm_component_utils(agent)
  
  sequencer seq1;
  driver dr;
  monitor mon;
  
  function new(string name="agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    seq1=sequencer::type_id::create("seq1",this);
    dr=driver::type_id::create("dr",this);
    mon=monitor::type_id::create("mon",this);
    
  endfunction
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    dr.seq_item_port.connect(seq1.seq_item_export);
  endfunction
endclass
    
    
               
               
