class test extends uvm_test;
  `uvm_component_utils(test)
  
  envi env;
  seq se;
  
    function new(string name = "test",uvm_component parent);
    super.new(name,parent);
  endfunction 
  
    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = envi::type_id::create("env",this);
    se  = seq::type_id::create("se",this);
    `uvm_info(get_type_name(),"build-phase from test",UVM_NONE)
  endfunction
  
  
    task run_phase(uvm_phase phase);
    `uvm_info(get_type_name(),"run-phase from test",UVM_NONE)
    
    phase.raise_objection(this);
    se.start(env.agt.seq);
    phase.drop_objection(this);
  endtask
  
endclass
