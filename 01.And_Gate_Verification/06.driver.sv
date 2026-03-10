class driver extends uvm_driver #(transaction);
  `uvm_component_utils(driver)
  
  virtual intf intff;
  transaction trans;
  
  function new(string name="driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"build phase from driver",UVM_NONE);
    
    
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",intff))
      `uvm_fatal("no_intf","virtual interface gets failed");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    repeat(10)begin
      #2;
      `uvm_info(get_type_name(),"rum phase from driver",UVM_NONE);
      
      seq_item_port.get_next_item(trans);
      intff.a=trans.a;
      intff.b=trans.b;
      
      seq_item_port.item_done();
      
    end
  endtask
endclass

      
    
