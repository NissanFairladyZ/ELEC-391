module impulse_response_2(out1, out2, out3, out4, out5, out6, out7, out8,
  out9, out10, out11, out12, out13, out14, out15, out16, out17, out18,
  out19, out20, out21, out22, out23, out24 ,out25, out26, out27, out28,
  out29, out30, out31, out32, out33, out34, out35, out36, out37, out38, out39,
  out40, out41, out42, out43, out44, out45, out46, out47, out48, out49,
  out50, out51, out52, out53, out54, out55 ,out56, out57, out58, out59,
  out60, out61, out62, out63, out64, out65);

  output [15:0] out1, out2, out3, out4, out5, out6, out7, out8,
  out9, out10, out11, out12, out13, out14, out15, out16, out17, out18,
  out19, out20, out21, out22, out23, out24 ,out25, out26, out27, out28,
  out29, out30, out31, out32, out33, out34, out35, out36, out37, out38, out39,
  out40, out41, out42, out43, out44, out45, out46, out47, out48, out49,
  out50, out51, out52, out53, out54, out55 ,out56, out57, out58, out59,
  out60, out61, out62, out63, out64, out65;

  //                                 sign integer decimal
  //fixed point 16-bit represetation 0____00______0000000000000
  //for negative number, flip all bits and plus 1
  assign out1 = 16'b1111111111110101;//
  assign out2 = 16'b0000000000001101;//
  assign out3 = 16'b0000000000011101;//
  assign out4 = 16'b0000000000010110;// 
  assign out5 = 16'b1111111111111100;//
  assign out6 = 16'b1111111111100100;//
  assign out7 = 16'b1111111111100101;//
  assign out8 = 16'b0000000000000000;////
  assign out9 = 16'b0000000000100000;//
  assign out10 = 16'b0000000000100110;//
  assign out11 = 16'b0000000000000101;//
  assign out12 = 16'b1111111111010011;//
  assign out13 = 16'b1111111110111011;// 
  assign out14 = 16'b1111111111011111;//
  assign out15 = 16'b0000000000110001;//
  assign out16 = 16'b0000000001111001;////
  assign out17 = 16'b0000000001110000;//
  assign out18 = 16'b0000000000000000;//
  assign out19 = 16'b1111111101100101;// 
  assign out20 = 16'b1111111100010010;//
  assign out21 = 16'b1111111101100110;//
  assign out22 = 16'b0000000001010111;//
  assign out23 = 16'b0000000101011011;//
  assign out24 = 16'b0000000110101001;////
  assign out25 = 16'b0000000010111110;//
  assign out26 = 16'b1111111011011001;//
  assign out27 = 16'b1111110100001100;//
  assign out28 = 16'b1111110011001101;//
  assign out29 = 16'b1111111100100101;//
  assign out30 = 16'b0000010000001001;//
  assign out31 = 16'b0000101000001000;// 
  assign out32 = 16'b0000111011110111;//
  assign out33 = 16'b0001000011100000;//////////////////////////////////////////
  assign out34 =16'b0000111011110111;//
  assign out35 =16'b0000101000001000;// 
  assign out36 =16'b0000010000001001;//
  assign out37 =16'b1111111100100101;//
  assign out38 =16'b1111110011001101;//
  assign out39 =16'b1111110100001100;//
  assign out40 =16'b1111111011011001;// 
  assign out41 =16'b0000000010111110;// 
  assign out42 =16'b0000000110101001;////
  assign out43 =16'b0000000101011011;
  assign out44 =16'b0000000001010111;  
  assign out45 =16'b1111111101100110;//
  assign out46 =16'b1111111100010010;//
  assign out47 =16'b1111111101100101;//  
  assign out48 =16'b0000000000000000;
  assign out49 =16'b0000000001110000;
  assign out50 =16'b0000000001111001;////
  assign out51 =16'b0000000000110001;
  assign out52 =16'b1111111111011111;
  assign out53 =16'b1111111110111011;
  assign out54 =16'b1111111111010011;
  assign out55 =16'b0000000000000101;
  assign out56 =16'b0000000000100110;
  assign out57 =16'b0000000000100000;
  assign out58 =16'b0000000000000000;////
  assign out59 =16'b1111111111100101;
  assign out60 =16'b1111111111100100;
  assign out61 =16'b1111111111111100;
  assign out62 =16'b0000000000010110;
  assign out63 =16'b0000000000011101;
  assign out64 =16'b0000000000001101;//
  assign out65 =16'b1111111111110101;//
  
endmodule
