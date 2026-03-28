class alu_driver extends uvm_driver #(alu_sequence_item);
  `uvm_component_utils(alu_driver)
  
  virtual alu_inter intf;
  alu_sequence_item tr;
  
  function new(string name="alu_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db# (virtual alu_inter)::get(this,"","intf",intf))
      `uvm_fatal("DRIVER","Data is not found in driver");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      tr=alu_sequence_item::type_id::create("tr");
      
      seq_item_port.get_next_item(tr);
      
      intf.a =tr.a;
      intf.b =tr.b;
      intf.sel =tr.sel;
      #20;
      
      seq_item_port.item_done();
    end
  endtask
endclass
    
