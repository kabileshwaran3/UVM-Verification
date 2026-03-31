class alu_test extends uvm_test;
  `uvm_component_utils(alu_test);
  
  alu_environment env;
  alu_sequence se;
  
  function new(string name="test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    env=alu_environment::type_id::create("env",this);
    se=alu_sequence::type_id::create("se",this);
    
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    se.start(env.ag.seq);#50;
    
    
    phase.raise_objection(this);
  endtask
endclass
