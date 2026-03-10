class monitor extends uvm_monitor;
  `uvm_component_utils(monitor);
  
  virtual intf intff;
  
  transaction trans;
  
  uvm_analysis_port #(transaction)port_tx;
  
  function new(string name="monitor",uvm_component parent);
    super.new(name,parent);
//     trans=new();
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    port_tx=new("port_tx",this);
    `uvm_info(get_type_name(),"print from monitor block",UVM_NONE);
    
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",intff))
      `uvm_fatal("uvmmonitor","monitor has not sent");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    repeat(10)begin
      #1;
      
      trans=transaction::type_id::create("trans",this);
      
      trans.a=intff.a;
      trans.b=intff.b;
      trans.y=intff.y;
      port_tx.write(trans);
      
      `uvm_info(get_type_name(),"run phase from monitor",UVM_NONE);
    end
  endtask
endclass
      
      
       
    
    
