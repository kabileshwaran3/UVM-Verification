class sco extends uvm_scoreboard;
  `uvm_component_utils(sco)
  uvm_analysis_imp #(transaction,sco)port_rx;
  
  function new(string name="scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    port_rx=new("port_rx",this);
    `uvm_info(get_type_name(),"output from scoreboard",UVM_NONE)
    
  endfunction
  
  function void write(transaction tx);
    bit expected;
    expected=tx.a & tx.b;
    if(tx.y!=expected)
      `uvm_error("AND_MISMATCH", $sformatf("Expected %0b, got %0b", expected, tx.y))
         else
           `uvm_info("AND_PASS", $sformatf("a=%0b b=%0b out=%0b", tx.a, tx.b, tx.y), UVM_LOW)
  endfunction
endclass

  
