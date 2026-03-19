class driver extends uvm_driver #(trans);
  trans tr;
  virtual intf intff;
  
  `uvm_component_utils(driver)
  
  function new(string name="driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual intf)::get(this,"","intff",intff))
      `uvm_fatal("DRV","config db is not found");
  endfunction
      
  
      
      
      task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    forever begin
      tr=trans::type_id::create("tr");
      
      seq_item_port.get_next_item(tr);
      
      intff.a=tr.a;
      intff.b=tr.b;
      #20;
      
      seq_item_port.item_done();
    end
      endtask
endclass
 
    
                    
                    
    	
