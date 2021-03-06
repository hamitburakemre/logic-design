`timescale 1ns / 1ps
module Reg_File(
input [4:0] AddrA, 
input [4:0] AddrB, 
input [4:0] AddrC, 
output reg [31:0] DataA, 
output reg [31:0] DataB, 
input [31:0] DataC, 
input WrC,
input Reset,
input Clk
    );

/*  DO NOT EDIT THIS FILE   */


	reg [31:0] GPR [31:0];
	integer i;
	localparam RF_delay = 4; //4 ns

always @(AddrA or AddrB) 
begin
	DataA <=#RF_delay GPR[AddrA];
	DataB <=#RF_delay GPR[AddrB];
end
always@(Reset) 
begin
	if(Reset)
	begin
		for (i=0;i<=31;i=i+1) GPR[i]=0;
	end
end
always @(posedge Clk)
begin
	if (WrC===1'b1)
	begin
		GPR[AddrC]=DataC;
	end
end

endmodule
