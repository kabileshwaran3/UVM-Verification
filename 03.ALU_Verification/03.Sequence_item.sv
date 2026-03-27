class alu_sequence_item extends uvm_sequence_item;
  rand bit [3:0]a;
  rand bit [3:0]b;
  rand bit [2:0]sel;
  bit [4:0]result;
  
  `uvm_object_utils(alu_sequence_item)
  
  function new(string name="alu_sequence_item");
    super.new(name);
  endfunction
endclass
