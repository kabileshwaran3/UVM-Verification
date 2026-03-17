// Code your design here
module half_adder(intf in);
  assign  in.sum =in.a ^ in.b;
  assign in.carry =in.a & in.b;
 
endmodule
