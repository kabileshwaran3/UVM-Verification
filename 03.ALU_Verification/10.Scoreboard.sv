class alu_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(alu_scoreboard)
  
  uvm_analysis_imp#(alu_sequence_item,alu_scoreboard)receive;
  
  alu_sequence_item tr;
  
  function new(string name="alu_scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    receive=new("receive",this);
  endfunction
  
  
  function void write(alu_sequence_item tr);
    bit[4:0] expected;
    
    case(tr.sel)
      3'b000: expected = tr.a + tr.b;
      3'b001: expected = tr.a - tr.b;
      3'b010: expected = tr.a & tr.b;
      3'b011: expected = tr.a ^ tr.b;
      3'b100: expected = ~(tr.a ^ tr.b);
      3'b101: expected = ~(tr.a & tr.b);
      3'b110: expected = ~(tr.a | tr.b);
      3'b111: expected = ~(tr.a);
    endcase
    
    if(expected == tr.result)begin
      `uvm_info("Scoreboard",$sformatf("pass- a=%0b b=%0b sel=%0d result= %0b ",tr.a,tr.b,tr.sel,tr.result),UVM_LOW)
    end
    else begin
      `uvm_error("scoreboard",$sformatf("Fail- a=%0d b=%0d sel=%0d result= %0d ",tr.a,tr.b,tr.sel,tr.result))
    end
  endfunction
endclass
                 
      
    
    
    
    
    

   
