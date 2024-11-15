class driver extends uvm_driver;
`uvm_component_utils(driver)

virtual interface det_if vif;

function new(string name="driver", uvm_component parent);
 super.new(name,parent);
endfunction

funtion void build_phase(uvm_phase phase);
 super.build_phase(phase);
 
 if(!uvm_config_db#virtual det_if)::get(this,"","det_if",vif);
   `uvm_fatal("DRV", "Could not get vif") 
 endfunction

virtual task run_phase(uvm_phase phase);
 super.run_phase(uvm_phase phase);
  forever begin
   seq_item det_item;
   `uvm_info("DRV", $sformatf("Sequencer is waiting for items"), UVM_HIGH)
   seq_item_port.get_next_item(det_item);
   drive(det_item);
   seq_item_port.item_done();
  end
endtask

virtual task drive(seq_item det_item);
 @(vif.cb);
 vif.cb.in <= det_item.in;
 endtask
endclass