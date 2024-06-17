// -------------------------------------------------------------
// 
// File Name: C:\Users\bryan\Downloads\viterbi\gm_hdlcoder_commviterbi\ACSUnit.v
// Created: 2024-06-16 16:50:07
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: ACSUnit
// Source Path: gm_hdlcoder_commviterbi/Viterbi Decoder Subsystem/Viterbi Decoder1/ACS/ACSEngine/ACSUnit
// Hierarchy Level: 4
// Model version: 10.10
// 
// Add Compare Select Unit
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module ACSUnit
          (bmet0,
           bmet1,
           smet0,
           smet1,
           branchdec,
           nextsmet);


  input   [3:0] bmet0;  // ufix4
  input   [3:0] bmet1;  // ufix4
  input   [3:0] smet0;  // ufix4
  input   [3:0] smet1;  // ufix4
  output  branchdec;  // ufix1
  output  [3:0] nextsmet;  // ufix4


  wire [3:0] sum0;  // ufix4
  wire [3:0] sum1;  // ufix4
  wire relop_relop1;


  // Add branch metric and state metric
  assign sum0 = bmet0 + smet0;



  // Add branch metric and state metric
  assign sum1 = bmet1 + smet1;



  // Compare
  assign relop_relop1 = sum0 > sum1;



  assign branchdec = relop_relop1;

  // Select
  assign nextsmet = (relop_relop1 == 1'b0 ? sum0 :
              sum1);



endmodule  // ACSUnit

