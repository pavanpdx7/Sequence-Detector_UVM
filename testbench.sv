module tb;
logic clk=0;
logic nrst=1;
logic in;
logic out;

always #5 clk = ~clk;
seq_det det(clk,nrst,in,out);
initial begin
@(posedge clk); nrst=0;
@(posedge clk); nrst=1;
in=1;@(posedge clk);$display("in=%0b out=%0b",in,out);
in=0;@(posedge clk);$display("in=%0b out=%0b",in,out);
in=1;@(posedge clk);$display("in=%0b out=%0b",in,out);
in=1;@(posedge clk);$display("in=%0b out=%0b",in,out);

in=0;@(posedge clk);$display("in=%0b out=%0b",in,out);
in=1;@(posedge clk);$display("in=%0b out=%0b",in,out);
in=0;@(posedge clk);$display("in=%0b out=%0b",in,out);
in=1;@(posedge clk);$display("in=%0b out=%0b",in,out);
in=1;@(posedge clk);$display("in=%0b out=%0b",in,out);

repeat(20)begin
in = $urandom_range(0,1);@(posedge clk);$display("---in=%0b out=%0b---",in,out);
end
#300;
$finish;
end
endmodule