class det_sequence extends uvm_sequence;
`uvm_object_utils(det_sequence)

rand int count;

function new(string name="det_sequence");
 super.new(name);
endfunction

constraint count_con{soft count inside {[20:80]};}

virtual task body();
 for(int i=0; i<count; i++)
   begin
     seq_item det_item = seq_item::type_id::create("det_item");
	  start_item(det_item);
	  det_item.randomize();
	  `uvm_info("SEQ", $sformatf("Generate new seq item", det_item.convert2str()), UVM_HIGH)
	  finish_item(det_item);
	end
	`uvm_info("SEQ", $sformatf("Generation of %0d items is completed",count), UVM_LOW)
endtask

endclass