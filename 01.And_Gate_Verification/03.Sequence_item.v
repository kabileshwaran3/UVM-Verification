class transaction extends uvm_sequence_item;
  rand bit a,b;
  bit y;
  
  `uvm_object_utils(transaction)
  
  function new(string name="sequence item");
    super.new(name);
  endfunction
endclass

  
