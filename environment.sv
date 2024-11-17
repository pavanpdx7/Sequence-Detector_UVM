class environment extends uvm_env;
`uvm_components_utils(environment);

agent ag;
scoreboard sb;

function new(string name="environment", uvm_component parent);
 super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 ag = agent::type_id::create("ag",this);
 sb = scoreboard::type_id::create("sb",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 ag.mon.mon_analysis_port.connect(sb.m_analysis_port);
endfunction
endclass