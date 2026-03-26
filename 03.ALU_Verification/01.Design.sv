// Code your design here
module design_alu(alu_inter intf);

  always @(posedge intf.clk) begin
    if (intf.rst)
      intf.result <= 0;
    else begin
      case (intf.sel)
        3'd0:intf.result <=intf.a + intf.b;      
        3'd1: intf.result <= intf.a - intf.b;     
        3'd2:intf.result <=intf.a& intf.b;    
        3'd3: intf.result <=intf.a |intf.b;   
        3'd4:intf.result <=~(intf.a ^ intf.b);   
        3'd5:intf.result <= ~(intf.a &intf.b);   
        3'd6: intf.result <=~(intf.a |intf.b);    
        3'd7: intf.result <=~(intf.a);             
      endcase
    end
  end

endmodule
