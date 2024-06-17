module convolution_top(input clk, input reset, input clk_enable, input [15:0] In, output [31:0] encoded);


  CE bit15 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[15]),
           .CE_out_0(encoded[31]),  
           .CE_out_1(encoded[30])  
           );
  CE bit14 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[14]),
           .CE_out_0(encoded[29]),  
           .CE_out_1(encoded[28])  
           );
  CE bit13 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[13]),
           .CE_out_0(encoded[27]),  
           .CE_out_1(encoded[26])  
           );
  CE bit12 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[12]),
           .CE_out_0(encoded[25]),  
           .CE_out_1(encoded[24])  
           );
  CE bit11 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[11]),
           .CE_out_0(encoded[23]),  
           .CE_out_1(encoded[22])  
           );
  CE bit10 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[10]),
           .CE_out_0(encoded[21]),  
           .CE_out_1(encoded[20])  
           );
  CE bit9 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[9]),
           .CE_out_0(encoded[19]),  
           .CE_out_1(encoded[18])  
           );
  CE bit8 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[8]),
           .CE_out_0(encoded[17]),  
           .CE_out_1(encoded[16])  
           );
  CE bit7 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[7]),
           .CE_out_0(encoded[15]),  
           .CE_out_1(encoded[14])  
           );
  CE bit6 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[6]),
           .CE_out_0(encoded[13]),  
           .CE_out_1(encoded[12])  
           );
  CE bit5 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[5]),
           .CE_out_0(encoded[11]),  
           .CE_out_1(encoded[10])  
           );
  CE bit4 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[4]),
           .CE_out_0(encoded[9]),  
           .CE_out_1(encoded[8])  
           );
  CE bit3 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[3]),
           .CE_out_0(encoded[7]),  
           .CE_out_1(encoded[6])  
           );
  CE bit2 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[2]),
           .CE_out_0(encoded[5]),  
           .CE_out_1(encoded[4])  
           );
  CE bit1 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[1]),
           .CE_out_0(encoded[3]),  
           .CE_out_1(encoded[2])  
           );
  CE bit0 (.clk(clk),
           .reset(reset),
           .enb(clk_enable),
           .CE_in(In[0]),
           .CE_out_0(encoded[1]),  
           .CE_out_1(encoded[0])  
           );







endmodule