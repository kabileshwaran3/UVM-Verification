class alu_monitor extends uvm_monitor;
  `uvm_component_utils(alu_monitor)
  
  virtual alu_inter intf;
  alu_sequence_item tr;
  
  uvm_analysis_port#(alu_sequence_item)send;
  
  function new(string name="alu_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    send=new("send",this);
    
    if(!uvm_config_db#(virtual alu_inter)::get(this,"","intf",intf))
      `uvm_fatal("MONITOR","No data in Monitor")
  endfunction
  
  task run_phase(uvm_phase phase);
    tr=new();
    repeat(10) begin
     #20;
      
      tr.a = intf.a;
      tr.b = intf.b;
      tr.sel = intf.sel;
      tr.result = intf.result;
      
      send.write(tr);
    end
  endtask
endclass
    
    
