class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard);

function new(string name="scoreboard", uvm_component parent);
 super.new(name,parent);
endfunction

bit [`LENGTH-1:0] expected_pattern;
bit [`LENGTH-1:0] actual_pattern;
bit exp_out;

uvm_analysis_imp #(det_item,scoreboard) m_analysis_imp;

virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 m_analysis_imp = 	new("new_analysis_import", this)
 if(!uvm_congig_db#