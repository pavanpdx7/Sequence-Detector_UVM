class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard);

function new(string name="scoreboard", uvm_component parent);
 super.new(name,parent);
endfunction

bit [`LENGTH-1:0] expected_pattern;
bit [`LENGTH-1:0] actual_pattern;
bit expected_out;

uvm_analysis_imp #(seq_item,scoreboard) m_analysis_imp;

virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 m_analysis_imp = 	new("new_analysis_import", this)
 if(!uvm_congig_db#(bit [`LENGTH-1:0])::get(this,"*","expected_pattern",expected_pattern);
	`uvm_fatal("SBD", "Didn't received the actual_pattern")
endfunction

virtual function void write(seq_item det_item);
  actual_pattern = actual_pattern << 1 | det_item.in;
  `uvm_info("SBD", $sformatf("in=%0b out=%0b actual_pattern=0b%0b expected_pattern=0b%0b", in,out,actual_pattern,expected_pattern), UVM_LOW)
  
if(det_item.out != expected_out)
 `uvm_error("SBD", $sformatf("det_item.out=%0b expected_out=%0b",det_item.out,expected_out))
else
 `uvm_info("SBD", $sformatf("det_item.out=%0b expected_out=%0b",det_item.out,expected_out),UVM_HIGH)
   
if(!(expected_pattern==actual_pattern)) begin
 `uvm_info("SBD", $sformatf("Patterm matched output should be 1"), UVM_LOW);
  expected_out = 1;
else
  expected_out = 0;
endfunction
endclass