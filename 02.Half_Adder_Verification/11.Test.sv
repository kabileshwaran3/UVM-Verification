class test extends uvm_test;
  `uvm_component_utils(test)
  environment env;
  seq se;
  
  function new(string name="test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    env=environment::type_id::create("env",this);
    se=seq::type_id::create("se");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
//     se=seq::type_id::create("se");
    se.start(env.ag.seq1);
    #50;
    phase.drop_objection(this);
  endtask
endclass
    
    
