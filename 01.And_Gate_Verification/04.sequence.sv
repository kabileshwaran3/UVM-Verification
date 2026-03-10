class seq extends uvm_sequence #(transaction);
 `uvm_object_utils(seq)
   
   transaction trans;
   
   function new(string name="sequence");
     super.new(name);
   endfunction
   
   
   task body();
     repeat(10)begin
       `uvm_info("Trans","trans_start",UVM_LOW);
       
       trans=transaction::type_id::create("trans");
       start_item(trans);
       trans.randomize();
       finish_item(trans);
       //`uvm_do(trans);
     end
   endtask
   
   endclass
   
   
     
