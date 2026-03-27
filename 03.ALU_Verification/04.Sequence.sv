class alu_sequence extends uvm_sequence #(alu_sequence_item);
  `uvm_object_utils(alu_sequence)
  
  function new(string name="alu_sequence");
    super.new(name);
  endfunction
  
  task body();
    alu_sequence_item tr;
        `uvm_info("TRANS","Trans begin",UVM_LOW)
    repeat(10)begin
    tr=alu_sequence_item::type_id::create("tr");
      start_item(tr);
      tr.randomize();
      `uvm_info("Sequence",$sformatf("a=%b | b=%0b | sel=%0d | result=%0b",tr.a,tr.b,tr.sel,tr.result),UVM_LOW)

      finish_item(tr);
//     `uvm_do(tr);
    end
  endtask
endclass
