//-------------------------------------------------------------------------
//      lab7_usb.sv                                                      --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Fall 2014 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 7                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module  lab8_usb 		( input         Clk,
                                     Reset,
							  output [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
							  output [8:0]  LEDG,
							  output [17:0] LEDR,
							  // VGA Interface 
                       output [7:0]  Red,
							                Green,
												 Blue,
							  output        VGA_clk,
							                sync,
												 blank,
												 vs,
												 hs,
							  // CY7C67200 Interface
							  inout [15:0]  OTG_DATA,						//	CY7C67200 Data bus 16 Bits
							  output [1:0]  OTG_ADDR,						//	CY7C67200 Address 2 Bits
							  output        OTG_CS_N,						//	CY7C67200 Chip Select
												 OTG_RD_N,						//	CY7C67200 Write
												 OTG_WR_N,						//	CY7C67200 Read
												 OTG_RST_N,						//	CY7C67200 Reset
							  input			 OTG_INT,						//	CY7C67200 Interrupt
							  // SDRAM Interface for Nios II Software
							  output [12:0] sdram_wire_addr,				// SDRAM Address 13 Bits
							  inout [31:0]  sdram_wire_dq,				// SDRAM Data 32 Bits
							  output [1:0]  sdram_wire_ba,				// SDRAM Bank Address 2 Bits
							  output [3:0]  sdram_wire_dqm,				// SDRAM Data Mast 4 Bits
							  output			 sdram_wire_ras_n,			// SDRAM Row Address Strobe
							  output			 sdram_wire_cas_n,			// SDRAM Column Address Strobe
							  output			 sdram_wire_cke,				// SDRAM Clock Enable
							  output			 sdram_wire_we_n,				// SDRAM Write Enable
							  output			 sdram_wire_cs_n,				// SDRAM Chip Select
							  output			 sdram_clk						// SDRAM Clock
											);
    
    logic Reset_h;
	 logic [7:0] keycode;
	 wire [9:0] BallX;
	 wire [9:0] BallY;
	 wire[9:0] DrawX;
	 wire[9:0] DrawY;
	 wire [9:0] BallS;
	 
	 assign BallS = 20;
    
    assign {Reset_h}=~ (Reset);  // The push buttons are active low
	 assign OTG_FSPEED = 1'bz;
	 assign OTG_LSPEED = 1'bz;
	 
	 
wire [9:0] F1X;
wire [9:0] F1Y;
wire [9:0] F2X;
wire [9:0] F2Y;
wire [9:0] F3X;
wire [9:0] F3Y;
wire [9:0] F4X;
wire [9:0] F4Y;
wire [9:0] F5X;
wire [9:0] F5Y;
wire [9:0] F6X;
wire [9:0] F6Y;
wire [9:0] F7X;
wire [9:0] F7Y;

wire [9:0] E1X;
wire [9:0] E1Y;
wire [9:0] E2X;
wire [9:0] E2Y;
wire [9:0] E3X;
wire [9:0] E3Y;
wire [9:0] E4X;
wire [9:0] E4Y;
wire [9:0] E5X;
wire [9:0] E5Y;
wire [9:0] E6X;
wire [9:0] E6Y;
wire [9:0] E7X;
wire [9:0] E7Y;

wire [9:0] D1X;
wire [9:0] D1Y;
wire [9:0] D2X;
wire [9:0] D2Y;
wire [9:0] D3X;
wire [9:0] D3Y;
wire [9:0] D4X;
wire [9:0] D4Y;
wire [9:0] D5X;
wire [9:0] D5Y;
wire [9:0] D6X;
wire [9:0] D6Y;
wire [9:0] D7X;
wire [9:0] D7Y;
	 
wire [9:0] C1X;
wire [9:0] C1Y;
wire [9:0] C2X;
wire [9:0] C2Y;
wire [9:0] C3X;
wire [9:0] C3Y;
wire [9:0] C4X;
wire [9:0] C4Y;
wire [9:0] C5X;
wire [9:0] C5Y;
wire [9:0] C6X;
wire [9:0] C6Y;
wire [9:0] C7X;
wire [9:0] C7Y;

wire [9:0] B1X;
wire [9:0] B1Y;
wire [9:0] B2X;
wire [9:0] B2Y;
wire [9:0] B3X;
wire [9:0] B3Y;
wire [9:0] B4X;
wire [9:0] B4Y;
wire [9:0] B5X;
wire [9:0] B5Y;
wire [9:0] B6X;
wire [9:0] B6Y;
wire [9:0] B7X;
wire [9:0] B7Y;

wire [9:0] A1X;
wire [9:0] A1Y;
wire [9:0] A2X;
wire [9:0] A2Y;
wire [9:0] A3X;
wire [9:0] A3Y;
wire [9:0] A4X;
wire [9:0] A4Y;
wire [9:0] A5X;
wire [9:0] A5Y;
wire [9:0] A6X;
wire [9:0] A6Y;
wire [9:0] A7X;
wire [9:0] A7Y;

wire A_1red;
wire A_1black;
wire B_1red;
wire B_1black;
wire C_1red;
wire C_1black;
wire D_1red;
wire D_1black;
wire E_1red;
wire E_1black;
wire F_1red;
wire F_1black;

wire A_2red;
wire A_2black;
wire B_2red;
wire B_2black;
wire C_2red;
wire C_2black;
wire D_2red;
wire D_2black;
wire E_2red;
wire E_2black;
wire F_2red;
wire F_2black;

wire A_3red;
wire A_3black;
wire B_3red;
wire B_3black;
wire C_3red;
wire C_3black;
wire D_3red;
wire D_3black;
wire E_3red;
wire E_3black;
wire F_3red;
wire F_3black;

wire A_4red;
wire A_4black;
wire B_4red;
wire B_4black;
wire C_4red;
wire C_4black;
wire D_4red;
wire D_4black;
wire E_4red;
wire E_4black;
wire F_4red;
wire F_4black;

wire A_5red;
wire A_5black;
wire B_5red;
wire B_5black;
wire C_5red;
wire C_5black;
wire D_5red;
wire D_5black;
wire E_5red;
wire E_5black;
wire F_5red;
wire F_5black;

wire A_6red;
wire A_6black;
wire B_6red;
wire B_6black;
wire C_6red;
wire C_6black;
wire D_6red;
wire D_6black;
wire E_6red;
wire E_6black;
wire F_6red;
wire F_6black;

wire A_7red;
wire A_7black;
wire B_7red;
wire B_7black;
wire C_7red;
wire C_7black;
wire D_7red;
wire D_7black;
wire E_7red;
wire E_7black;
wire F_7red;
wire F_7black;

logic back;
	    
	 usb_system usbsys_instance(
										 .clk_clk(Clk),         
										 .reset_reset_n(1'b1),   
										 .sdram_wire_addr(sdram_wire_addr), 
										 .sdram_wire_ba(sdram_wire_ba),   
										 .sdram_wire_cas_n(sdram_wire_cas_n),
										 .sdram_wire_cke(sdram_wire_cke),  
										 .sdram_wire_cs_n(sdram_wire_cs_n), 
										 .sdram_wire_dq(sdram_wire_dq),   
										 .sdram_wire_dqm(sdram_wire_dqm),  
										 .sdram_wire_ras_n(sdram_wire_ras_n),
										 .sdram_wire_we_n(sdram_wire_we_n), 
										 .sdram_out_clk_clk(sdram_clk),
										 .keycode_export(keycode),  
										 .usb_DATA(OTG_DATA),    
										 .usb_ADDR(OTG_ADDR),    
										 .usb_RD_N(OTG_RD_N),    
										 .usb_WR_N(OTG_WR_N),    
										 .usb_CS_N(OTG_CS_N),    
										 .usb_RST_N(OTG_RST_N),   
										 .usb_INT(OTG_INT) );
										 
	 vga_controller vga 
	 (
		.Clk,
		.Reset(Reset_h),
		.hs,
		.vs,
		.pixel_clk(VGA_clk),
		.blank,
		.DrawX,
		.DrawY,
		.sync
	 );
	 
	 color_mapper color
	 (		
		.F1X,
		.F1Y,
		.F2X,
		.F2Y,
		.F3X,
		.F3Y,
		.F4X,
		.F4Y,
		.F5X,
		.F5Y,
		.F6X,
		.F6Y,
		.F7X,
		.F7Y,
		
		.E1X,
		.E1Y,
		.E2X,
		.E2Y,
		.E3X,
		.E3Y,
		.E4X,
		.E4Y,
		.E5X,
		.E5Y,
		.E6X,
		.E6Y,
		.E7X,
		.E7Y,
		
		.D1X,
		.D1Y,
		.D2X,
		.D2Y,
		.D3X,
		.D3Y,
		.D4X,
		.D4Y,
		.D5X,
		.D5Y,
		.D6X,
		.D6Y,
		.D7X,
		.D7Y,
		
		.C1X,
		.C1Y,
		.C2X,
		.C2Y,
		.C3X,
		.C3Y,
		.C4X,
		.C4Y,
		.C5X,
		.C5Y,
		.C6X,
		.C6Y,
		.C7X,
		.C7Y,
		
		.B1X,
		.B1Y,
		.B2X,
		.B2Y,
		.B3X,
		.B3Y,
		.B4X,
		.B4Y,
		.B5X,
		.B5Y,
		.B6X,
		.B6Y,
		.B7X,
		.B7Y,
		
		.A1X,
		.A1Y,
		.A2X,
		.A2Y,
		.A3X,
		.A3Y,
		.A4X,
		.A4Y,
		.A5X,
		.A5Y,
		.A6X,
		.A6Y,
		.A7X,
		.A7Y,
		
		.A_1red,
		.A_1black,
		.B_1red,
		.B_1black,
		.C_1red,
		.C_1black,
		.D_1red,
		.D_1black,
		.E_1red,
		.E_1black,
		.F_1red,
		.F_1black,
		
		.A_2red,
		.A_2black,
		.B_2red,
		.B_2black,
		.C_2red,
		.C_2black,
		.D_2red,
		.D_2black,
		.E_2red,
		.E_2black,
		.F_2red,
		.F_2black,
		
		.A_3red,
		.A_3black,
		.B_3red,
		.B_3black,
		.C_3red,
		.C_3black,
		.D_3red,
		.D_3black,
		.E_3red,
		.E_3black,
		.F_3red,
		.F_3black,
		
		.A_4red,
		.A_4black,
		.B_4red,
		.B_4black,
		.C_4red,
		.C_4black,
		.D_4red,
		.D_4black,
		.E_4red,
		.E_4black,
		.F_4red,
		.F_4black,
		
		.A_5red,
		.A_5black,
		.B_5red,
		.B_5black,
		.C_5red,
		.C_5black,
		.D_5red,
		.D_5black,
		.E_5red,
		.E_5black,
		.F_5red,
		.F_5black,
		
		.A_6red,
		.A_6black,
		.B_6red,
		.B_6black,
		.C_6red,
		.C_6black,
		.D_6red,
		.D_6black,
		.E_6red,
		.E_6black,
		.F_6red,
		.F_6black,
		
		.A_7red,
		.A_7black,
		.B_7red,
		.B_7black,
		.C_7red,
		.C_7black,
		.D_7red,
		.D_7black,
		.E_7red,
		.E_7black,
		.F_7red,
		.F_7black,
		
		.back,
		
		.DrawX,
		.DrawY,
		.Ball_size(BallS),
		.Red,
		.Green,
		.Blue
	 );
	 
	 f1 F1
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.F1X,
		.F1Y
	 );
	 
	 f2 F2
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.F2X,
		.F2Y
	 );
	 
	 f3 F3
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.F3X,
		.F3Y
	 );
	 
	 f4 F4
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.F4X,
		.F4Y
	 );
	 
	 f5 F5
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.F5X,
		.F5Y
	 );
	 
	 f6 F6
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.F6X,
		.F6Y
	 );
	 
	 f7 F7
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.F7X,
		.F7Y
	 );
		
		
	e1 E1
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.E1X,
		.E1Y
	 );
	 
	 e2 E2
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.E2X,
		.E2Y
	 );
	 
	 e3 E3
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.E3X,
		.E3Y
	 );
	 
	 e4 E4
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.E4X,
		.E4Y
	 );
	 
	 e5 E5
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.E5X,
		.E5Y
	 );
	 
	 e6 E6
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.E6X,
		.E6Y
	 );
	 
	 e7 E7
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.E7X,
		.E7Y
	 );
	 
	 d1 D1
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.D1X,
		.D1Y
	 );
	 
	 d2 D2
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.D2X,
		.D2Y
	 );
	 
	 d3 D3
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.D3X,
		.D3Y
	 );
	 
	 d4 D4
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.D4X,
		.D4Y
	 );
	 
	 d5 D5
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.D5X,
		.D5Y
	 );
	 
	 d6 D6
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.D6X,
		.D6Y
	 );
	 
	 d7 D7
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.D7X,
		.D7Y
	 );
		
		
	c1 C1
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.C1X,
		.C1Y
	 );
	 
	 c2 C2
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.C2X,
		.C2Y
	 );
	 
	 c3 C3
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.C3X,
		.C3Y
	 );
	 
	 c4 C4
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.C4X,
		.C4Y
	 );
	 
	 c5 C5
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.C5X,
		.C5Y
	 );
	 
	 c6 C6
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.C6X,
		.C6Y
	 );
	 
	 c7 C7
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.C7X,
		.C7Y
	 );
	 
	 
	 b1 B1
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.B1X,
		.B1Y
	 );
	 
	 b2 B2
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.B2X,
		.B2Y
	 );
	 
	 b3 B3
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.B3X,
		.B3Y
	 );
	 
	 b4 B4
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.B4X,
		.B4Y
	 );
	 
	 b5 B5
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.B5X,
		.B5Y
	 );
	 
	 b6 B6
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.B6X,
		.B6Y
	 );
	 
	 b7 B7
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.B7X,
		.B7Y
	 );
	 
	 
	 a1 A1
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.A1X,
		.A1Y,
		.A_1red,
		.A_1black,
		.B_1red,
		.B_1black,
		.C_1red,
		.C_1black,
		.D_1red,
		.D_1black,
		.E_1red,
		.E_1black,
		.F_1red,
		.F_1black
	 );
	 
	 a2 A2
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.A2X,
		.A2Y,
		.A_2red,
		.A_2black,
		.B_2red,
		.B_2black,
		.C_2red,
		.C_2black,
		.D_2red,
		.D_2black,
		.E_2red,
		.E_2black,
		.F_2red,
		.F_2black
	 );
	 
	 a3 A3
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.A3X,
		.A3Y,
		.A_3red,
		.A_3black,
		.B_3red,
		.B_3black,
		.C_3red,
		.C_3black,
		.D_3red,
		.D_3black,
		.E_3red,
		.E_3black,
		.F_3red,
		.F_3black
	 );
	 
	 a4 A4
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.A4X,
		.A4Y,
		.A_4red,
		.A_4black,
		.B_4red,
		.B_4black,
		.C_4red,
		.C_4black,
		.D_4red,
		.D_4black,
		.E_4red,
		.E_4black,
		.F_4red,
		.F_4black
	 );
	 
	 a5 A5
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.A5X,
		.A5Y,
		.A_5red,
		.A_5black,
		.B_5red,
		.B_5black,
		.C_5red,
		.C_5black,
		.D_5red,
		.D_5black,
		.E_5red,
		.E_5black,
		.F_5red,
		.F_5black
	 );
	 
	 a6 A6
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.A6X,
		.A6Y,
		.A_6red,
		.A_6black,
		.B_6red,
		.B_6black,
		.C_6red,
		.C_6black,
		.D_6red,
		.D_6black,
		.E_6red,
		.E_6black,
		.F_6red,
		.F_6black
	 );
	 
	 a7 A7
	 (
		.Reset(Reset_h),
		.frame_clk(vs),
		.keycode,
		.A7X,
		.A7Y,
		.A_7red,
		.A_7black,
		.B_7red,
		.B_7black,
		.C_7red,
		.C_7black,
		.D_7red,
		.D_7black,
		.E_7red,
		.E_7black,
		.F_7red,
		.F_7black,
		.back
	 );
		
	 HexDriver hex_inst_0 (keycode[3:0], HEX0);
	 HexDriver hex_inst_1 (keycode[7:4], HEX1);
    

	 /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #1/2:
          What are the advantages and/or disadvantages of using a USB interface over PS/2 interface to
			 connect to the keyboard? List any two.  Give an answer in your Post-Lab.
     **************************************************************************************/
endmodule
