module transmitter_t2(symb_in, symb_out, clk, reset, read_ready);

  input clk, reset;

  input read_ready;

  input [15:0] symb_in;

  output reg [15:0] symb_out;

  integer i;

  reg [15:0] symb_reg [0:64]; 
  reg [1:0] counter;

  wire [15:0] out1, out2, out3, out4, out5, out6, out7, out8,
  out9, out10, out11, out12, out13, out14, out15, out16, out17, out18,
  out19, out20, out21, out22, out23, out24 ,out25, out26, out27, out28,
  out29, out30, out31, out32, out33, out34, out35, out36, out37, out38, out39,
  out40, out41, out42, out43, out44, out45, out46, out47, out48, out49,
  out50, out51, out52, out53, out54, out55 ,out56, out57, out58, out59,
  out60, out61, out62, out63, out64, out65;

wire [15:0] toc1, toc2, toc3, toc4, toc5, toc6, toc7, toc8, toc9, toc10,
  toc11, toc12, toc13, toc14, toc15, toc16, toc17, toc18, toc19, toc20, toc21, toc22,
  toc23, toc24, toc25, toc26, toc27, toc28, toc29, toc30, toc31, toc32, toc33, toc34,
  toc35, toc36, toc37, toc38, toc39, toc40, toc41, toc42, toc43, toc44, toc45, toc46,
  toc47, toc48, toc49, toc50, toc51, toc52, toc53, toc54, toc55, toc56, toc57, toc58,
  toc59, toc60, toc61, toc62, toc63, toc64, toc65;


  impulse_response_2 imp(out1, out2, out3, out4, out5, out6, out7, out8,
  out9, out10, out11, out12, out13, out14, out15, out16, out17, out18,
  out19, out20, out21, out22, out23, out24 ,out25, out26, out27, out28,
  out29, out30, out31,out32, out33, out34, out35, out36, out37, out38, out39,
  out40, out41, out42, out43, out44, out45, out46, out47, out48, out49,
  out50, out51, out52, out53, out54, out55 ,out56, out57, out58, out59,
  out60, out61, out62, out63, out64, out65); //impulse response 65 coefficients

imm_product x1(symb_reg[0], out1, toc1);
imm_product x2(symb_reg[1], out2, toc2);
imm_product x3(symb_reg[2], out3, toc3);
imm_product x4(symb_reg[3], out4, toc4);
imm_product x5(symb_reg[4], out5, toc5);
imm_product x6(symb_reg[5], out6, toc6);
imm_product x7(symb_reg[6], out7, toc7);
imm_product x8(symb_reg[7], out8, toc8);
imm_product x9(symb_reg[8], out9, toc9);
imm_product x10(symb_reg[9], out10, toc10);
imm_product x11(symb_reg[10], out11, toc11);
imm_product x12(symb_reg[11], out12, toc12);
imm_product x13(symb_reg[12], out13, toc13);
imm_product x14(symb_reg[13], out14, toc14);
imm_product x15(symb_reg[14], out15, toc15);
imm_product x16(symb_reg[15], out16, toc16);
imm_product x17(symb_reg[16], out17, toc17);
imm_product x18(symb_reg[17], out18, toc18);
imm_product x19(symb_reg[18], out19, toc19);
imm_product x20(symb_reg[19], out20, toc20);
imm_product x21(symb_reg[20], out21, toc21);
imm_product x22(symb_reg[21], out22, toc22);
imm_product x23(symb_reg[22], out23, toc23);
imm_product x24(symb_reg[23], out24, toc24);
imm_product x25(symb_reg[24], out25, toc25);
imm_product x26(symb_reg[25], out26, toc26);
imm_product x27(symb_reg[26], out27, toc27);
imm_product x28(symb_reg[27], out28, toc28);
imm_product x29(symb_reg[28], out29, toc29);
imm_product x30(symb_reg[29], out30, toc30);
imm_product x31(symb_reg[30], out31, toc31);
imm_product x32(symb_reg[31], out32, toc32);
imm_product x33(symb_reg[32], out33, toc33);
imm_product x34(symb_reg[33], out34, toc34);
imm_product x35(symb_reg[34], out35, toc35);
imm_product x36(symb_reg[35], out36, toc36);
imm_product x37(symb_reg[36], out37, toc37);
imm_product x38(symb_reg[37], out38, toc38);
imm_product x39(symb_reg[38], out39, toc39);
imm_product x40(symb_reg[39], out40, toc40);
imm_product x41(symb_reg[40], out41, toc41);
imm_product x42(symb_reg[41], out42, toc42);
imm_product x43(symb_reg[42], out43, toc43);
imm_product x44(symb_reg[43], out44, toc44);
imm_product x45(symb_reg[44], out45, toc45);
imm_product x46(symb_reg[45], out46, toc46);
imm_product x47(symb_reg[46], out47, toc47);
imm_product x48(symb_reg[47], out48, toc48);
imm_product x49(symb_reg[48], out49, toc49);
imm_product x50(symb_reg[49], out50, toc50);
imm_product x51(symb_reg[50], out51, toc51);
imm_product x52(symb_reg[51], out52, toc52);
imm_product x53(symb_reg[52], out53, toc53);
imm_product x54(symb_reg[53], out54, toc54);
imm_product x55(symb_reg[54], out55, toc55);
imm_product x56(symb_reg[55], out56, toc56);
imm_product x57(symb_reg[56], out57, toc57);
imm_product x58(symb_reg[57], out58, toc58);
imm_product x59(symb_reg[58], out59, toc59);
imm_product x60(symb_reg[59], out60, toc60);
imm_product x61(symb_reg[60], out61, toc61);
imm_product x62(symb_reg[61], out62, toc62);
imm_product x63(symb_reg[62], out63, toc63);
imm_product x64(symb_reg[63], out64, toc64);
imm_product x65(symb_reg[64], out65, toc65);


  always @(posedge clk) begin
    if (reset) begin
      for (i = 0; i < 65; i = i + 1) begin
        symb_reg[i] <= 16'b0000000000000000;
      end
      symb_out = 16'b0000000000000000;
    end else begin 
      if (read_ready == 1) begin
        symb_reg[0] <= symb_in;
      end else begin
        symb_reg[0] <= 0;
      end
      symb_reg[1] <= symb_reg[0]; symb_reg[2] <= symb_reg[1];
      symb_reg[3] <= symb_reg[2]; symb_reg[4] <= symb_reg[3];
      symb_reg[5] <= symb_reg[4]; symb_reg[6] <= symb_reg[5];
      symb_reg[7] <= symb_reg[6]; symb_reg[8] <= symb_reg[7];
      symb_reg[9] <= symb_reg[8]; symb_reg[10] <= symb_reg[9];
      symb_reg[11] <= symb_reg[10]; symb_reg[12] <= symb_reg[11];
      symb_reg[13] <= symb_reg[12]; symb_reg[14] <= symb_reg[13];
      symb_reg[15] <= symb_reg[14]; symb_reg[16] <= symb_reg[15];
      symb_reg[17] <= symb_reg[16]; symb_reg[18] <= symb_reg[17];
      symb_reg[19] <= symb_reg[18]; symb_reg[20] <= symb_reg[19];
      symb_reg[21] <= symb_reg[20]; symb_reg[22] <= symb_reg[21];
      symb_reg[23] <= symb_reg[22]; symb_reg[24] <= symb_reg[23];
      symb_reg[25] <= symb_reg[24]; symb_reg[26] <= symb_reg[25];
      symb_reg[27] <= symb_reg[26]; symb_reg[28] <= symb_reg[27];
      symb_reg[29] <= symb_reg[28]; symb_reg[30] <= symb_reg[29];
      symb_reg[31] <= symb_reg[30]; symb_reg[32] <= symb_reg[31];
      symb_reg[33] <= symb_reg[32]; symb_reg[34] <= symb_reg[33];
      symb_reg[35] <= symb_reg[34]; symb_reg[36] <= symb_reg[35];
      symb_reg[37] <= symb_reg[36]; symb_reg[38] <= symb_reg[37];
      symb_reg[39] <= symb_reg[38]; symb_reg[40] <= symb_reg[39];
      symb_reg[41] <= symb_reg[40]; symb_reg[42] <= symb_reg[41];
      symb_reg[43] <= symb_reg[42]; symb_reg[44] <= symb_reg[43];
      symb_reg[45] <= symb_reg[44]; symb_reg[46] <= symb_reg[45];
      symb_reg[47] <= symb_reg[46]; symb_reg[48] <= symb_reg[47];
      symb_reg[49] <= symb_reg[48]; symb_reg[50] <= symb_reg[49];
      symb_reg[51] <= symb_reg[50]; symb_reg[52] <= symb_reg[51];
      symb_reg[53] <= symb_reg[52]; symb_reg[54] <= symb_reg[53];
      symb_reg[55] <= symb_reg[54]; symb_reg[56] <= symb_reg[55];
      symb_reg[57] <= symb_reg[56]; symb_reg[58] <= symb_reg[57];
      symb_reg[59] <= symb_reg[58]; symb_reg[60] <= symb_reg[59];
      symb_reg[61] <= symb_reg[60]; symb_reg[62] <= symb_reg[61];
      symb_reg[63] <= symb_reg[62]; symb_reg[64] <= symb_reg[63]; 

      symb_out <= toc1 + toc2 + toc3 + toc4 + toc5 + toc6 + toc7 + toc8 +
                  toc9 + toc10 + toc11 + toc12 + toc13 + toc14 + toc15 +
                  toc16 + toc17 + toc18 + toc19 + toc20 + toc21 + toc22 + toc23 + toc24 +
                  toc25 + toc26 + toc27 + toc28 + toc29 + toc30 + toc31 + toc32 + toc33 + 
		  toc34 + toc35 + toc36 + toc37 + toc38 +
                  toc39 + toc40 + toc41 + toc42 + toc43 + toc44 + toc45 +
                  toc46 + toc47 + toc48 + toc49 + toc50 + toc51 + toc52 + toc53 + toc54 +
                  toc55 + toc56 + toc57 + toc58 + toc59 + toc60 + toc61+ toc62 + toc63 + toc64+toc65;

    end

  end
endmodule
