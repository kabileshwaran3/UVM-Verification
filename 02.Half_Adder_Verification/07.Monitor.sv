class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  virtual intf intff;
  trans tr;
  
  uvm_analysis_port #(trans)send;
  
  function new(string name ="Mon",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    send=new("send",this);
    
    if(!uvm_config_db #(virtual intf)::get(this,"","intff",intff))
      `uvm_fatal("Mon","config db is not created in the monitor")
  endfunction
  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(10)begin
    #20;
      tr=trans::type_id::create("tr",this);
      
      tr.a=intff.a;
      tr.b=intff.b;
      tr.sum=intff.sum;
      tr.carry=intff.carry;
      
      send.write(tr);
    end
  endtask
endclass
      
    
