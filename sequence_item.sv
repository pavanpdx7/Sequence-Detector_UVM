class seq_item extends uvm_seq_item;
`uvm_object_utils(seq_item)

rand bit in;
bit out;

function new(string name = "seq_item");
 super.new(name);
endfunction

virtual function string convert2str();
 return $sformat("in=%0d out=%0d",in,out);
endfunction

constraint c1 {in dist{0:/30, 1:/70};}
endclass