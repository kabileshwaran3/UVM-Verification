
class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  uvm_analysis_imp#(trans,scoreboard)receive;
  
  function new(string name="Scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    receive=new("receive",this);
  endfunction
  
  
  function void write(trans tr);
    if((tr.sum==(tr.a^tr.b)) && (tr.carry==(tr.a&tr.b)))begin
      `uvm_info("scoreboard",$sformatf("True statement - a=%0b | b=%0b | sum=%0b | carry=%0b",tr.a,tr.b,tr.sum,tr.carry),UVM_LOW);
    end
    else begin
      `uvm_info("scoreboard",$sformatf("Flase statement"),UVM_LOW)
    end
  endfunction
endclass

                
