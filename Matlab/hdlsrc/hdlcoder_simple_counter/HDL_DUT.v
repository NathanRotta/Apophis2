// -------------------------------------------------------------
// 
// File Name: hdlsrc\hdlcoder_simple_counter\HDL_DUT.v
// Created: 2022-03-24 14:28:22
// 
// Generated by MATLAB 9.10 and HDL Coder 3.18
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 0.2
// Target subsystem base rate: 0.2
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        0.2
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// out                           ce_out        0.2
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: HDL_DUT
// Source Path: hdlcoder_simple_counter/HDL_DUT
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module HDL_DUT
          (clk,
           reset,
           clk_enable,
           count_threshold,
           Enable,
           ce_out,
           out);


  input   clk;
  input   reset;
  input   clk_enable;
  input   [7:0] count_threshold;  // uint8
  input   Enable;
  output  ce_out;
  output  [7:0] out;  // uint8


  wire enb;
  wire switch_compare_1;
  wire [7:0] Constant1_out1;  // uint8
  wire [7:0] Constant_out1;  // uint8
  reg [7:0] Delay1_out1;  // uint8
  wire [7:0] Add_out1;  // uint8
  wire Relational_Operator_relop1;
  wire switch_compare_1_1;
  wire [7:0] Switch_out1;  // uint8
  wire [7:0] Switch1_out1;  // uint8
  reg [7:0] Delay_out1;  // uint8


  assign switch_compare_1 = Enable > 1'b0;



  assign enb = clk_enable;

  assign Constant1_out1 = 8'b00000001;



  assign Constant_out1 = 8'b00000000;



  assign Add_out1 = Delay1_out1 + Constant1_out1;



  assign Relational_Operator_relop1 = Add_out1 > count_threshold;



  assign switch_compare_1_1 = Relational_Operator_relop1 > 1'b0;



  assign Switch_out1 = (switch_compare_1_1 == 1'b0 ? Add_out1 :
              Constant_out1);



  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= Switch1_out1;
        end
      end
    end



  assign Switch1_out1 = (switch_compare_1 == 1'b0 ? Delay1_out1 :
              Switch_out1);



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay_out1 <= Switch1_out1;
        end
      end
    end



  assign out = Delay_out1;

  assign ce_out = clk_enable;

endmodule  // HDL_DUT

