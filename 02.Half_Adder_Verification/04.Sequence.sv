class seq extends uvm_sequence #(trans);
  `uvm_object_utils(seq)
  
  function new(string name="seq");
    super.new(name);
  endfunction
  
  task body();
    trans tr;
    `uvm_info("TRANS","Trans begin",UVM_LOW)
    repeat(10)begin
      tr=trans::type_id::create("tr");
      start_item(tr);
      tr.randomize();
      `uvm_info("sequence",$sformatf("INPUT DATA --a=%0b | b=%0b | sum=%0b | carry=%0b",tr.a,tr.b,tr.sum,tr.carry),UVM_LOW);
      finish_item(tr);
//       `uvm_do(tr);
    end
  endtask
endclass
      
