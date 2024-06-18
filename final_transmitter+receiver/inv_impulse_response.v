module inv_impulse_response_2(out1, out2, out3, out4, out5, out6, out7, out8,
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
  assign out1 = 16'b1111111111111101;//
  assign out2 = 16'b0000000000000011;//
  assign out3 = 16'b0000000000000111;//
  assign out4 = 16'b0000000000000110;// 
  assign out5 = 16'b1111111111111111;//
  assign out6 = 16'b1111111111111001;//
  assign out7 = 16'b1111111111111001;//
  assign out8 = 16'b0000000000000000;////
  assign out9 = 16'b0000000000001000;//
  assign out10 = 16'b0000000000001010;//
  assign out11 = 16'b0000000000000001;//
  assign out12 = 16'b1111111111110101;//
  assign out13 = 16'b1111111111101111;// 
  assign out14 = 16'b1111111111111000;//
  assign out15 = 16'b0000000000001100;//
  assign out16 = 16'b0000000000011110;////
  assign out17 = 16'b0000000000011100;//
  assign out18 = 16'b0000000000000000;//
  assign out19 = 16'b1111111111011001;// 
  assign out20 = 16'b1111111111000100;//
  assign out21 = 16'b1111111111011001;//
  assign out22 = 16'b0000000000010110;//
  assign out23 = 16'b0000000001010111;//
  assign out24 = 16'b0000000001101010;////
  assign out25 = 16'b0000000000110000;//
  assign out26 = 16'b1111111110110110;//
  assign out27 = 16'b1111111101000011;//
  assign out28 = 16'b1111111100110011;//
  assign out29 = 16'b1111111111001010;//
  assign out30 = 16'b0000000100000010;//
  assign out31 = 16'b0000001010000010;// 
  assign out32 = 16'b0000001110111110;//
  assign out33 = 16'b0000010000111000;//////////////////////////////////////////
  assign out34 =16'b0000001110111110;//
  assign out35 =16'b0000001010000010;// 
  assign out36 =16'b0000000100000010;//
  assign out37 =16'b1111111111001010;//
  assign out38 =16'b1111111100110011;//
  assign out39 =16'b1111111101000011;//
  assign out40 =16'b1111111110110110;// 
  assign out41 =16'b0000000000110000;// 
  assign out42 =16'b0000000001101010;////
  assign out43 =16'b0000000001010111;
  assign out44 =16'b0000000000010110;  
  assign out45 =16'b1111111111011001;//
  assign out46 =16'b1111111111000100;//
  assign out47 =16'b1111111111011001;//  
  assign out48 =16'b0000000000000000;
  assign out49 =16'b0000000000011100;
  assign out50 =16'b0000000000011110;////
  assign out51 =16'b0000000000001100;
  assign out52 =16'b1111111111111000;
  assign out53 =16'b1111111111101111;
  assign out54 =16'b1111111111110101;
  assign out55 =16'b0000000000000001;
  assign out56 =16'b0000000000001010;
  assign out57 =16'b0000000000001000;
  assign out58 =16'b0000000000000000;////
  assign out59 =16'b1111111111111001;
  assign out60 =16'b1111111111111001;
  assign out61 =16'b1111111111111111;
  assign out62 =16'b0000000000000110;
  assign out63 =16'b0000000000000111;
  assign out64 =16'b0000000000000011;//
  assign out65 =16'b1111111111111101;//
  
endmodule
