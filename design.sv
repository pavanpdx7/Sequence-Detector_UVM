module seq_det(clk,nrst,in,out);
input bit clk;
input bit nrst;
input bit in;
output bit out;

typedef enum bit [1:0] {s0,s1,s2,s3} state;
state pre_state, next_state;

always_ff@(posedge clk)
begin
if(!nrst)
pre_state <= s0;
else
pre_state <= next_state;
end

always@(pre_state or in)
begin
case(pre_state)
s0: begin
	 if(in)begin
	   next_state = s1;
	   out = 0; end
	 else begin
	   next_state = s0;
	   out = 0;
	end
	end

s1: begin
	 if(in) begin 
	   next_state = s1;
	   out = 0; end
	 else begin
	   next_state = s2;
	   out = 0; end
	end

s2:	begin
	 if(in) begin
	   next_state = s3;
	   out = 0; end
	 else begin
	   next_state = s0;
	   out = 0; end
	end
	   
s3: begin
	 if(in)
	  begin
	   next_state = s1;
	   out = 1;
	  end 
	 else begin
	   next_state = s2;
	   out = 0; end
	end
endcase
end
endmodule