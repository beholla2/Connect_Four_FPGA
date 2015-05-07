//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper 
( input        [9:0] DrawX, DrawY, Ball_size,
input [9:0] A1X, A1Y, 
input [9:0] A2X, A2Y,
input [9:0] A3X, A3Y,
input [9:0] A4X, A4Y, 
input [9:0] A5X, A5Y,
input [9:0] A6X, A6Y,
input [9:0] A7X, A7Y,

input [9:0] B1X, B1Y, 
input [9:0] B2X, B2Y,
input [9:0] B3X, B3Y,
input [9:0] B4X, B4Y, 
input [9:0] B5X, B5Y,
input [9:0] B6X, B6Y,
input [9:0] B7X, B7Y,

input [9:0] C1X, C1Y, 
input [9:0] C2X, C2Y,
input [9:0] C3X, C3Y,
input [9:0] C4X, C4Y, 
input [9:0] C5X, C5Y,
input [9:0] C6X, C6Y,
input [9:0] C7X, C7Y,

input [9:0] D1X, D1Y, 
input [9:0] D2X, D2Y,
input [9:0] D3X, D3Y,
input [9:0] D4X, D4Y, 
input [9:0] D5X, D5Y,
input [9:0] D6X, D6Y,
input [9:0] D7X, D7Y,

input [9:0] E1X, E1Y, 
input [9:0] E2X, E2Y,
input [9:0] E3X, E3Y,
input [9:0] E4X, E4Y, 
input [9:0] E5X, E5Y,
input [9:0] E6X, E6Y,
input [9:0] E7X, E7Y,

input [9:0] F1X, F1Y, 
input [9:0] F2X, F2Y,
input [9:0] F3X, F3Y,
input [9:0] F4X, F4Y, 
input [9:0] F5X, F5Y,
input [9:0] F6X, F6Y,
input [9:0] F7X, F7Y,

input A_1red, A_1black,
input B_1red, B_1black,
input C_1red, C_1black,
input D_1red, D_1black,
input E_1red, E_1black,
input F_1red, F_1black,

input A_2red, A_2black,
input B_2red, B_2black,
input C_2red, C_2black,
input D_2red, D_2black,
input E_2red, E_2black,
input F_2red, F_2black,

input A_3red, A_3black,
input B_3red, B_3black,
input C_3red, C_3black,
input D_3red, D_3black,
input E_3red, E_3black,
input F_3red, F_3black,

input A_4red, A_4black,
input B_4red, B_4black,
input C_4red, C_4black,
input D_4red, D_4black,
input E_4red, E_4black,
input F_4red, F_4black,

input A_5red, A_5black,
input B_5red, B_5black,
input C_5red, C_5black,
input D_5red, D_5black,
input E_5red, E_5black,
input F_5red, F_5black,

input A_6red, A_6black,
input B_6red, B_6black,
input C_6red, C_6black,
input D_6red, D_6black,
input E_6red, E_6black,
input F_6red, F_6black,

input A_7red, A_7black,
input B_7red, B_7black,
input C_7red, C_7black,
input D_7red, D_7black,
input E_7red, E_7black,
input F_7red, F_7black,

input back, 

output logic [7:0]  Red, Green, Blue );
    
	 logic loop;
	 
	 logic f1_on;
	 logic f2_on;
	 logic f3_on;
	 logic f4_on;
	 logic f5_on;
	 logic f6_on;
	 logic f7_on;
	 
	 logic e1_on;
	 logic e2_on;
	 logic e3_on;
	 logic e4_on;
	 logic e5_on;
	 logic e6_on;
	 logic e7_on;
	 
	 logic d1_on;
	 logic d2_on;
	 logic d3_on;
	 logic d4_on;
	 logic d5_on;
	 logic d6_on;
	 logic d7_on;
	 
	 logic c1_on;
	 logic c2_on;
	 logic c3_on;
	 logic c4_on;
	 logic c5_on;
	 logic c6_on;
	 logic c7_on;
	 
	 logic b1_on;
	 logic b2_on;
	 logic b3_on;
	 logic b4_on;
	 logic b5_on;
	 logic b6_on;
	 logic b7_on;
	 
	 logic a1_on;
	 logic a2_on;
	 logic a3_on;
	 logic a4_on;
	 logic a5_on;
	 logic a6_on;
	 logic a7_on;

	 logic black_win = 1'b0;
	 logic red_win = 1'b0;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
	 
	 
	 int DistF1X, DistF1Y;
	 int DistF2X, DistF2Y;
	 int DistF3X, DistF3Y;
	 int DistF4X, DistF4Y;
	 int DistF5X, DistF5Y;
	 int DistF6X, DistF6Y;
	 int DistF7X, DistF7Y;
	 
	 int DistE1X, DistE1Y;
	 int DistE2X, DistE2Y;
	 int DistE3X, DistE3Y;
	 int DistE4X, DistE4Y;
	 int DistE5X, DistE5Y;
	 int DistE6X, DistE6Y;
	 int DistE7X, DistE7Y;
	 
	 int DistD1X, DistD1Y;
	 int DistD2X, DistD2Y;
	 int DistD3X, DistD3Y;
	 int DistD4X, DistD4Y;
	 int DistD5X, DistD5Y;
	 int DistD6X, DistD6Y;
	 int DistD7X, DistD7Y;
	 
	 int DistC1X, DistC1Y;
	 int DistC2X, DistC2Y;
	 int DistC3X, DistC3Y;
	 int DistC4X, DistC4Y;
	 int DistC5X, DistC5Y;
	 int DistC6X, DistC6Y;
	 int DistC7X, DistC7Y;
	 
	 int DistB1X, DistB1Y;
	 int DistB2X, DistB2Y;
	 int DistB3X, DistB3Y;
	 int DistB4X, DistB4Y;
	 int DistB5X, DistB5Y;
	 int DistB6X, DistB6Y;
	 int DistB7X, DistB7Y;
	 
	 int DistA1X, DistA1Y;
	 int DistA2X, DistA2Y;
	 int DistA3X, DistA3Y;
	 int DistA4X, DistA4Y;
	 int DistA5X, DistA5Y;
	 int DistA6X, DistA6Y;
	 int DistA7X, DistA7Y;
	 
	 
	 assign DistF1X = DrawX - F1X;
    assign DistF1Y = DrawY - F1Y;
	 assign DistF2X = DrawX - F2X;
    assign DistF2Y = DrawY - F2Y;
	 assign DistF3X = DrawX - F3X;
    assign DistF3Y = DrawY - F3Y;
	 assign DistF4X = DrawX - F4X;
    assign DistF4Y = DrawY - F4Y;
	 assign DistF5X = DrawX - F5X;
    assign DistF5Y = DrawY - F5Y;
	 assign DistF6X = DrawX - F6X;
    assign DistF6Y = DrawY - F6Y;
	 assign DistF7X = DrawX - F7X;
    assign DistF7Y = DrawY - F7Y;
	 
	 assign DistE1X = DrawX - E1X;
    assign DistE1Y = DrawY - E1Y;
	 assign DistE2X = DrawX - E2X;
    assign DistE2Y = DrawY - E2Y;
	 assign DistE3X = DrawX - E3X;
    assign DistE3Y = DrawY - E3Y;
	 assign DistE4X = DrawX - E4X;
    assign DistE4Y = DrawY - E4Y;
	 assign DistE5X = DrawX - E5X;
    assign DistE5Y = DrawY - E5Y;
	 assign DistE6X = DrawX - E6X;
    assign DistE6Y = DrawY - E6Y;
	 assign DistE7X = DrawX - E7X;
    assign DistE7Y = DrawY - E7Y;
	 
	 assign DistD1X = DrawX - D1X;
    assign DistD1Y = DrawY - D1Y;
	 assign DistD2X = DrawX - D2X;
    assign DistD2Y = DrawY - D2Y;
	 assign DistD3X = DrawX - D3X;
    assign DistD3Y = DrawY - D3Y;
	 assign DistD4X = DrawX - D4X;
    assign DistD4Y = DrawY - D4Y;
	 assign DistD5X = DrawX - D5X;
    assign DistD5Y = DrawY - D5Y;
	 assign DistD6X = DrawX - D6X;
    assign DistD6Y = DrawY - D6Y;
	 assign DistD7X = DrawX - D7X;
    assign DistD7Y = DrawY - D7Y;
	 
	 assign DistC1X = DrawX - C1X;
    assign DistC1Y = DrawY - C1Y;
	 assign DistC2X = DrawX - C2X;
    assign DistC2Y = DrawY - C2Y;
	 assign DistC3X = DrawX - C3X;
    assign DistC3Y = DrawY - C3Y;
	 assign DistC4X = DrawX - C4X;
    assign DistC4Y = DrawY - C4Y;
	 assign DistC5X = DrawX - C5X;
    assign DistC5Y = DrawY - C5Y;
	 assign DistC6X = DrawX - C6X;
    assign DistC6Y = DrawY - C6Y;
	 assign DistC7X = DrawX - C7X;
    assign DistC7Y = DrawY - C7Y;
	 
	 assign DistB1X = DrawX - B1X;
    assign DistB1Y = DrawY - B1Y;
	 assign DistB2X = DrawX - B2X;
    assign DistB2Y = DrawY - B2Y;
	 assign DistB3X = DrawX - B3X;
    assign DistB3Y = DrawY - B3Y;
	 assign DistB4X = DrawX - B4X;
    assign DistB4Y = DrawY - B4Y;
	 assign DistB5X = DrawX - B5X;
    assign DistB5Y = DrawY - B5Y;
	 assign DistB6X = DrawX - B6X;
    assign DistB6Y = DrawY - B6Y;
	 assign DistB7X = DrawX - B7X;
    assign DistB7Y = DrawY - B7Y;
	 
	 assign DistA1X = DrawX - A1X;
    assign DistA1Y = DrawY - A1Y;
	 assign DistA2X = DrawX - A2X;
    assign DistA2Y = DrawY - A2Y;
	 assign DistA3X = DrawX - A3X;
    assign DistA3Y = DrawY - A3Y;
	 assign DistA4X = DrawX - A4X;
    assign DistA4Y = DrawY - A4Y;
	 assign DistA5X = DrawX - A5X;
    assign DistA5Y = DrawY - A5Y;
	 assign DistA6X = DrawX - A6X;
    assign DistA6Y = DrawY - A6Y;
	 assign DistA7X = DrawX - A7X;
    assign DistA7Y = DrawY - A7Y;
	 
    assign Size = Ball_size;
	  
    always_comb
    begin:Ball_on_proc		
		
		
		
		//F Row		
		if ( ( DistF1X*DistF1X + DistF1Y*DistF1Y) <= (Size * Size) ) 
            f1_on = 1'b1;
      else 
            f1_on = 1'b0;
		if ( ( DistF2X*DistF2X + DistF2Y*DistF2Y) <= (Size * Size) ) 
            f2_on = 1'b1;
      else 
            f2_on = 1'b0;
		if ( ( DistF3X*DistF3X + DistF3Y*DistF3Y) <= (Size * Size) ) 
            f3_on = 1'b1;
      else 
            f3_on = 1'b0;
		if ( ( DistF4X*DistF4X + DistF4Y*DistF4Y) <= (Size * Size) ) 
            f4_on = 1'b1;
      else 
            f4_on = 1'b0;
		if ( ( DistF5X*DistF5X + DistF5Y*DistF5Y) <= (Size * Size) ) 
            f5_on = 1'b1;
      else 
            f5_on = 1'b0;
		if ( ( DistF6X*DistF6X + DistF6Y*DistF6Y) <= (Size * Size) ) 
            f6_on = 1'b1;
      else 
            f6_on = 1'b0;
		if ( ( DistF7X*DistF7X + DistF7Y*DistF7Y) <= (Size * Size) ) 
            f7_on = 1'b1;
      else 
            f7_on = 1'b0;
				
		//E Row		
		if ( ( DistE1X*DistE1X + DistE1Y*DistE1Y) <= (Size * Size) ) 
            e1_on = 1'b1;
      else 
            e1_on = 1'b0;
		if ( ( DistE2X*DistE2X + DistE2Y*DistE2Y) <= (Size * Size) ) 
            e2_on = 1'b1;
      else 
            e2_on = 1'b0;
		if ( ( DistE3X*DistE3X + DistE3Y*DistE3Y) <= (Size * Size) ) 
            e3_on = 1'b1;
      else 
            e3_on = 1'b0;
		if ( ( DistE4X*DistE4X + DistE4Y*DistE4Y) <= (Size * Size) ) 
            e4_on = 1'b1;
      else 
            e4_on = 1'b0;
		if ( ( DistE5X*DistE5X + DistE5Y*DistE5Y) <= (Size * Size) ) 
            e5_on = 1'b1;
      else 
            e5_on = 1'b0;
		if ( ( DistE6X*DistE6X + DistE6Y*DistE6Y) <= (Size * Size) ) 
            e6_on = 1'b1;
      else 
            e6_on = 1'b0;
		if ( ( DistE7X*DistE7X + DistE7Y*DistE7Y) <= (Size * Size) ) 
            e7_on = 1'b1;
      else 
            e7_on = 1'b0;
				
		//D Row		
		if ( ( DistD1X*DistD1X + DistD1Y*DistD1Y) <= (Size * Size) ) 
            d1_on = 1'b1;
      else 
            d1_on = 1'b0;
		if ( ( DistD2X*DistD2X + DistD2Y*DistD2Y) <= (Size * Size) ) 
            d2_on = 1'b1;
      else 
            d2_on = 1'b0;
		if ( ( DistD3X*DistD3X + DistD3Y*DistD3Y) <= (Size * Size) ) 
            d3_on = 1'b1;
      else 
            d3_on = 1'b0;
		if ( ( DistD4X*DistD4X + DistD4Y*DistD4Y) <= (Size * Size) ) 
            d4_on = 1'b1;
      else 
            d4_on = 1'b0;
		if ( ( DistD5X*DistD5X + DistD5Y*DistD5Y) <= (Size * Size) ) 
            d5_on = 1'b1;
      else 
            d5_on = 1'b0;
		if ( ( DistD6X*DistD6X + DistD6Y*DistD6Y) <= (Size * Size) ) 
            d6_on = 1'b1;
      else 
            d6_on = 1'b0;
		if ( ( DistD7X*DistD7X + DistD7Y*DistD7Y) <= (Size * Size) ) 
            d7_on = 1'b1;
      else 
            d7_on = 1'b0;
				
		//C Row		
		if ( ( DistC1X*DistC1X + DistC1Y*DistC1Y) <= (Size * Size) ) 
            c1_on = 1'b1;
      else 
            c1_on = 1'b0;
		if ( ( DistC2X*DistC2X + DistC2Y*DistC2Y) <= (Size * Size) ) 
            c2_on = 1'b1;
      else 
            c2_on = 1'b0;
		if ( ( DistC3X*DistC3X + DistC3Y*DistC3Y) <= (Size * Size) ) 
            c3_on = 1'b1;
      else 
            c3_on = 1'b0;
		if ( ( DistC4X*DistC4X + DistC4Y*DistC4Y) <= (Size * Size) ) 
            c4_on = 1'b1;
      else 
            c4_on = 1'b0;
		if ( ( DistC5X*DistC5X + DistC5Y*DistC5Y) <= (Size * Size) ) 
            c5_on = 1'b1;
      else 
            c5_on = 1'b0;
		if ( ( DistC6X*DistC6X + DistC6Y*DistC6Y) <= (Size * Size) ) 
            c6_on = 1'b1;
      else 
            c6_on = 1'b0;
		if ( ( DistC7X*DistC7X + DistC7Y*DistC7Y) <= (Size * Size) ) 
            c7_on = 1'b1;
      else 
            c7_on = 1'b0;
				
		//B Row		
		if ( ( DistB1X*DistB1X + DistB1Y*DistB1Y) <= (Size * Size) ) 
            b1_on = 1'b1;
      else 
            b1_on = 1'b0;
		if ( ( DistB2X*DistB2X + DistB2Y*DistB2Y) <= (Size * Size) ) 
            b2_on = 1'b1;
      else 
            b2_on = 1'b0;
		if ( ( DistB3X*DistB3X + DistB3Y*DistB3Y) <= (Size * Size) ) 
            b3_on = 1'b1;
      else 
            b3_on = 1'b0;
		if ( ( DistB4X*DistB4X + DistB4Y*DistB4Y) <= (Size * Size) ) 
            b4_on = 1'b1;
      else 
            b4_on = 1'b0;
		if ( ( DistB5X*DistB5X + DistB5Y*DistB5Y) <= (Size * Size) ) 
            b5_on = 1'b1;
      else 
            b5_on = 1'b0;
		if ( ( DistB6X*DistB6X + DistB6Y*DistB6Y) <= (Size * Size) ) 
            b6_on = 1'b1;
      else 
            b6_on = 1'b0;
		if ( ( DistB7X*DistB7X + DistB7Y*DistB7Y) <= (Size * Size) ) 
            b7_on = 1'b1;
      else 
            b7_on = 1'b0;
				
		//A Row		
		if ( ( DistA1X*DistA1X + DistA1Y*DistA1Y) <= (Size * Size) ) 
            a1_on = 1'b1;
      else 
            a1_on = 1'b0;
		if ( ( DistA2X*DistA2X + DistA2Y*DistA2Y) <= (Size * Size) ) 
            a2_on = 1'b1;
      else 
            a2_on = 1'b0;
		if ( ( DistA3X*DistA3X + DistA3Y*DistA3Y) <= (Size * Size) ) 
            a3_on = 1'b1;
      else 
            a3_on = 1'b0;
		if ( ( DistA4X*DistA4X + DistA4Y*DistA4Y) <= (Size * Size) ) 
            a4_on = 1'b1;
      else 
            a4_on = 1'b0;
		if ( ( DistA5X*DistA5X + DistA5Y*DistA5Y) <= (Size * Size) ) 
            a5_on = 1'b1;
      else 
            a5_on = 1'b0;
		if ( ( DistA6X*DistA6X + DistA6Y*DistA6Y) <= (Size * Size) ) 
            a6_on = 1'b1;
      else 
            a6_on = 1'b0;
		if ( ( DistA7X*DistA7X + DistA7Y*DistA7Y) <= (Size * Size) ) 
            a7_on = 1'b1;
      else 
            a7_on = 1'b0;
				
		end
		
		always_comb
		begin: test_black
				
		//Testing Conditions
		//Test for black win
	
        if(A_1black == 1'b1 && A_2black == 1'b1 && A_3black == 1'b1 && A_4black == 1'b1)
				black_win = 1'b1;
			else if(A_5black == 1'b1 && A_2black == 1'b1 && A_3black == 1'b1 && A_4black == 1'b1)
				black_win = 1'b1;
			else if(A_5black == 1'b1 && A_6black == 1'b1 && A_3black == 1'b1 && A_4black == 1'b1)
				black_win = 1'b1;
			else if(A_5black == 1'b1 && A_6black == 1'b1 && A_7black == 1'b1 && A_4black == 1'b1)
				black_win = 1'b1;
				
			else if(B_1black == 1'b1 && B_2black == 1'b1 && B_3black == 1'b1 && B_4black == 1'b1)
				black_win = 1'b1;
			else if(B_5black == 1'b1 && B_2black == 1'b1 && B_3black == 1'b1 && B_4black == 1'b1)
				black_win = 1'b1;
			else if(B_5black == 1'b1 && B_6black == 1'b1 && B_3black == 1'b1 && B_4black == 1'b1)
				black_win = 1'b1;
			else if(B_5black == 1'b1 && B_6black == 1'b1 && B_7black == 1'b1 && B_4black == 1'b1)
				black_win = 1'b1;
				
			else if(C_1black == 1'b1 && C_2black == 1'b1 && C_3black == 1'b1 && C_4black == 1'b1)
				black_win = 1'b1;
			else if(C_5black == 1'b1 && C_2black == 1'b1 && C_3black == 1'b1 && C_4black == 1'b1)
				black_win = 1'b1;
			else if(C_5black == 1'b1 && C_6black == 1'b1 && C_3black == 1'b1 && C_4black == 1'b1)
				black_win = 1'b1;
			else if(C_5black == 1'b1 && C_6black == 1'b1 && C_7black == 1'b1 && C_4black == 1'b1)
				black_win = 1'b1;
				
			else if(D_1black == 1'b1 && D_2black == 1'b1 && D_3black == 1'b1 && D_4black == 1'b1)
				black_win = 1'b1;
			else if(D_5black == 1'b1 && D_2black == 1'b1 && D_3black == 1'b1 && D_4black == 1'b1)
				black_win = 1'b1;
			else if(D_5black == 1'b1 && D_6black == 1'b1 && D_3black == 1'b1 && D_4black == 1'b1)
				black_win = 1'b1;
			else if(D_5black == 1'b1 && D_6black == 1'b1 && D_7black == 1'b1 && D_4black == 1'b1)
				black_win = 1'b1;
				
			else if(E_1black == 1'b1 && E_2black == 1'b1 && E_3black == 1'b1 && E_4black == 1'b1)
				black_win = 1'b1;
			else if(E_5black == 1'b1 && E_2black == 1'b1 && E_3black == 1'b1 && E_4black == 1'b1)
				black_win = 1'b1;
			else if(E_5black == 1'b1 && E_6black == 1'b1 && E_3black == 1'b1 && E_4black == 1'b1)
				black_win = 1'b1;
			else if(E_5black == 1'b1 && E_6black == 1'b1 && E_7black == 1'b1 && E_4black == 1'b1)
				black_win = 1'b1;
				
			else if(F_1black == 1'b1 && F_2black == 1'b1 && F_3black == 1'b1 && F_4black == 1'b1)
				black_win = 1'b1;
			else if(F_5black == 1'b1 && F_2black == 1'b1 && F_3black == 1'b1 && F_4black == 1'b1)
				black_win = 1'b1;
			else if(F_5black == 1'b1 && F_6black == 1'b1 && F_3black == 1'b1 && F_4black == 1'b1)
				black_win = 1'b1;
			else if(F_5black == 1'b1 && F_6black == 1'b1 && F_7black == 1'b1 && F_4black == 1'b1)
				black_win = 1'b1;
				
			else if(A_1black == 1'b1 && B_1black == 1'b1 && C_1black == 1'b1 && D_1black == 1'b1)
				black_win = 1'b1;
			else if(E_1black == 1'b1 && B_1black == 1'b1 && C_1black == 1'b1 && D_1black == 1'b1)
				black_win = 1'b1;
			else if(E_1black == 1'b1 && F_1black == 1'b1 && C_1black == 1'b1 && D_1black == 1'b1)
				black_win = 1'b1;
				
			else if(A_2black == 1'b1 && B_2black == 1'b1 && C_2black == 1'b1 && D_2black == 1'b1)
				black_win = 1'b1;
			else if(E_2black == 1'b1 && B_2black == 1'b1 && C_2black == 1'b1 && D_2black == 1'b1)
				black_win = 1'b1;
			else if(E_2black == 1'b1 && F_2black == 1'b1 && C_2black == 1'b1 && D_2black == 1'b1)
				black_win = 1'b1;
				
			else if(A_3black == 1'b1 && B_3black == 1'b1 && C_3black == 1'b1 && D_3black == 1'b1)
				black_win = 1'b1;
			else if(E_3black == 1'b1 && B_3black == 1'b1 && C_3black == 1'b1 && D_3black == 1'b1)
				black_win = 1'b1;
			else if(E_3black == 1'b1 && F_3black == 1'b1 && C_3black == 1'b1 && D_3black == 1'b1)
				black_win = 1'b1;
				
			else if(A_4black == 1'b1 && B_4black == 1'b1 && C_4black == 1'b1 && D_4black == 1'b1)
				black_win = 1'b1;
			else if(E_4black == 1'b1 && B_4black == 1'b1 && C_4black == 1'b1 && D_4black == 1'b1)
				black_win = 1'b1;
			else if(E_4black == 1'b1 && F_4black == 1'b1 && C_4black == 1'b1 && D_4black == 1'b1)
				black_win = 1'b1;
				
			else if(A_5black == 1'b1 && B_5black == 1'b1 && C_5black == 1'b1 && D_5black == 1'b1)
				black_win = 1'b1;
			else if(E_5black == 1'b1 && B_5black == 1'b1 && C_5black == 1'b1 && D_5black == 1'b1)
				black_win = 1'b1;
			else if(E_5black == 1'b1 && F_5black == 1'b1 && C_5black == 1'b1 && D_5black == 1'b1)
				black_win = 1'b1;
				
			else if(A_6black == 1'b1 && B_6black == 1'b1 && C_6black == 1'b1 && D_6black == 1'b1)
				black_win = 1'b1;
			else if(E_6black == 1'b1 && B_6black == 1'b1 && C_6black == 1'b1 && D_6black == 1'b1)
				black_win = 1'b1;
			else if(E_6black == 1'b1 && F_6black == 1'b1 && C_6black == 1'b1 && D_6black == 1'b1)
				black_win = 1'b1;
				
			else if(A_7black == 1'b1 && B_7black == 1'b1 && C_7black == 1'b1 && D_7black == 1'b1)
				black_win = 1'b1;
			else if(E_7black == 1'b1 && B_7black == 1'b1 && C_7black == 1'b1 && D_7black == 1'b1)
				black_win = 1'b1;
			else if (E_7black == 1'b1 && F_7black == 1'b1 && C_7black == 1'b1 && D_7black == 1'b1)
				black_win = 1'b1;
			//Diagnol Blacks start here	
			else if(C_1black == 1'b1 && D_2black == 1'b1 && E_3black == 1'b1 && F_4black == 1'b1)
				black_win = 1'b1;
				
			else if(C_2black == 1'b1 && D_3black == 1'b1 && E_4black == 1'b1 && B_1black == 1'b1)
				black_win = 1'b1;
			else if(C_2black == 1'b1 && D_3black == 1'b1 && E_4black == 1'b1 && F_5black == 1'b1)
				black_win = 1'b1;
				
			else if(C_3black == 1'b1 && D_4black == 1'b1 && A_1black == 1'b1 && B_2black == 1'b1)
				black_win = 1'b1;
			else if(C_3black == 1'b1 && D_4black == 1'b1 && E_5black == 1'b1 && B_2black == 1'b1)
				black_win = 1'b1;
			else if(C_3black == 1'b1 && D_4black == 1'b1 && E_5black == 1'b1 && F_6black == 1'b1)
				black_win = 1'b1;
				
			else if(C_4black == 1'b1 && D_5black == 1'b1 && A_2black == 1'b1 && B_3black == 1'b1)
				black_win = 1'b1;
			else if(C_4black == 1'b1 && D_5black == 1'b1 && E_6black == 1'b1 && B_3black == 1'b1)
				black_win = 1'b1;
			else if(C_4black == 1'b1 && D_5black == 1'b1 && E_6black == 1'b1 && F_7black == 1'b1)
				black_win = 1'b1;
				
			else if(C_5black == 1'b1 && D_6black == 1'b1 && A_3black == 1'b1 && B_4black == 1'b1)
				black_win = 1'b1;
			else if(C_5black == 1'b1 && D_6black == 1'b1 && E_7black == 1'b1 && B_4black == 1'b1)
				black_win = 1'b1;
				
			else if(C_6black == 1'b1 && D_7black == 1'b1 && A_4black == 1'b1 && B_5black == 1'b1)
				black_win = 1'b1;
				
			else if(D_1black == 1'b1 && C_2black == 1'b1 && B_3black == 1'b1 && A_4black == 1'b1)
				black_win = 1'b1;
				
			else if(E_1black == 1'b1 && D_2black == 1'b1 && C_3black == 1'b1 && B_4black == 1'b1)
				black_win = 1'b1;
			else if(A_5black == 1'b1 && D_2black == 1'b1 && C_3black == 1'b1 && B_4black == 1'b1)
				black_win = 1'b1;
				
			else if(F_1black == 1'b1 && E_2black == 1'b1 && D_3black == 1'b1 && C_4black == 1'b1)
				black_win = 1'b1;
			else if(B_5black == 1'b1 && E_2black == 1'b1 && D_3black == 1'b1 && C_4black == 1'b1)
				black_win = 1'b1;
			else if(B_5black == 1'b1 && A_6black == 1'b1 && D_3black == 1'b1 && C_4black == 1'b1)
				black_win = 1'b1;
				
			else if(F_2black == 1'b1 && E_3black == 1'b1 && D_4black == 1'b1 && C_5black == 1'b1)
				black_win = 1'b1;
			else if(B_6black == 1'b1 && E_3black == 1'b1 && D_4black == 1'b1 && C_5black == 1'b1)
				black_win = 1'b1;
			else if(B_6black == 1'b1 && A_7black == 1'b1 && D_4black == 1'b1 && C_5black == 1'b1)
				black_win = 1'b1;
				
			else if(F_3black == 1'b1 && E_4black == 1'b1 && D_5black == 1'b1 && C_6black == 1'b1)
				black_win = 1'b1;
			else if(B_7black == 1'b1 && E_3black == 1'b1 && D_4black == 1'b1 && C_5black == 1'b1)
				black_win = 1'b1;
				
			else if(F_4black == 1'b1 && E_5black == 1'b1 && D_6black == 1'b1 && C_7black == 1'b1)
				black_win = 1'b1;
			else
				black_win = 1'b0;

			end
			
			
			//Test for red win
		always_comb
			begin: test_red

       if(A_1red == 1'b1 && A_2red == 1'b1 && A_3red == 1'b1 && A_4red == 1'b1)
				red_win = 1'b1;
			else if(A_5red == 1'b1 && A_2red == 1'b1 && A_3red == 1'b1 && A_4red == 1'b1)
				red_win = 1'b1;
			else if(A_5red == 1'b1 && A_6red == 1'b1 && A_3red == 1'b1 && A_4red == 1'b1)
				red_win = 1'b1;
			else if(A_5red == 1'b1 && A_6red == 1'b1 && A_7red == 1'b1 && A_4red == 1'b1)
				red_win = 1'b1;
				
		else if(B_1red == 1'b1 && B_2red == 1'b1 && B_3red == 1'b1 && B_4red == 1'b1)
				red_win = 1'b1;
		else if(B_5red == 1'b1 && B_2red == 1'b1 && B_3red == 1'b1 && B_4red == 1'b1)
				red_win = 1'b1;
			else if(B_5red == 1'b1 && B_6red == 1'b1 && B_3red == 1'b1 && B_4red == 1'b1)
				red_win = 1'b1;
			else if(B_5red == 1'b1 && B_6red == 1'b1 && B_7red == 1'b1 && B_4red == 1'b1)
				red_win = 1'b1;
				
			else if(C_1red == 1'b1 && C_2red == 1'b1 && C_3red == 1'b1 && C_4red == 1'b1)
				red_win = 1'b1;
			else if(C_5red == 1'b1 && C_2red == 1'b1 && C_3red == 1'b1 && C_4red == 1'b1)
				red_win = 1'b1;
			else if(C_5red == 1'b1 && C_6red == 1'b1 && C_3red == 1'b1 && C_4red == 1'b1)
				red_win = 1'b1;
			else if(C_5red == 1'b1 && C_6red == 1'b1 && C_7red == 1'b1 && C_4red == 1'b1)
				red_win = 1'b1;
				
			else if(D_1red == 1'b1 && D_2red == 1'b1 && D_3red == 1'b1 && D_4red == 1'b1)
				red_win = 1'b1;
			else if(D_5red == 1'b1 && D_2red == 1'b1 && D_3red == 1'b1 && D_4red == 1'b1)
				red_win = 1'b1;
			else if(D_5red == 1'b1 && D_6red == 1'b1 && D_3red == 1'b1 && D_4red == 1'b1)
				red_win = 1'b1;
			else if(D_5red == 1'b1 && D_6red == 1'b1 && D_7red == 1'b1 && D_4red == 1'b1)
				red_win = 1'b1;
				
			else if(E_1red == 1'b1 && E_2red == 1'b1 && E_3red == 1'b1 && E_4red == 1'b1)
				red_win = 1'b1;
			else if(E_5red == 1'b1 && E_2red == 1'b1 && E_3red == 1'b1 && E_4red == 1'b1)
				red_win = 1'b1;
			else if(E_5red == 1'b1 && E_6red == 1'b1 && E_3red == 1'b1 && E_4red == 1'b1)
				red_win = 1'b1;
			else if(E_5red == 1'b1 && E_6red == 1'b1 && E_7red == 1'b1 && E_4red == 1'b1)
				red_win = 1'b1;
				
			else if(F_1red == 1'b1 && F_2red == 1'b1 && F_3red == 1'b1 && F_4red == 1'b1)
				red_win = 1'b1;
			else if(F_5red == 1'b1 && F_2red == 1'b1 && F_3red == 1'b1 && F_4red == 1'b1)
				red_win = 1'b1;
			else if(F_5red == 1'b1 && F_6red == 1'b1 && F_3red == 1'b1 && F_4red == 1'b1)
				red_win = 1'b1;
			else if(F_5red == 1'b1 && F_6red == 1'b1 && F_7red == 1'b1 && F_4red == 1'b1)
				red_win = 1'b1;
				
			else if(A_1red == 1'b1 && B_1red == 1'b1 && C_1red == 1'b1 && D_1red == 1'b1)
				red_win = 1'b1;
			else if(E_1red == 1'b1 && B_1red == 1'b1 && C_1red == 1'b1 && D_1red == 1'b1)
				red_win = 1'b1;
			else if(E_1red == 1'b1 && F_1red == 1'b1 && C_1red == 1'b1 && D_1red == 1'b1)
				red_win = 1'b1;
				
			else if(A_2red == 1'b1 && B_2red == 1'b1 && C_2red == 1'b1 && D_2red == 1'b1)
				red_win = 1'b1;
			else if(E_2red == 1'b1 && B_2red == 1'b1 && C_2red == 1'b1 && D_2red == 1'b1)
				red_win = 1'b1;
			else if(E_2red == 1'b1 && F_2red == 1'b1 && C_2red == 1'b1 && D_2red == 1'b1)
				red_win = 1'b1;
				
			else if(A_3red == 1'b1 && B_3red == 1'b1 && C_3red == 1'b1 && D_3red == 1'b1)
				red_win = 1'b1;
			else if(E_3red == 1'b1 && B_3red == 1'b1 && C_3red == 1'b1 && D_3red == 1'b1)
				red_win = 1'b1;
			else if(E_3red == 1'b1 && F_3red == 1'b1 && C_3red == 1'b1 && D_3red == 1'b1)
				red_win = 1'b1;
				
			else if(A_4red == 1'b1 && B_4red == 1'b1 && C_4red == 1'b1 && D_4red == 1'b1)
				red_win = 1'b1;
			else if(E_4red == 1'b1 && B_4red == 1'b1 && C_4red == 1'b1 && D_4red == 1'b1)
				red_win = 1'b1;
			else if(E_4red == 1'b1 && F_4red == 1'b1 && C_4red == 1'b1 && D_4red == 1'b1)
				red_win = 1'b1;
				
			else if(A_5red == 1'b1 && B_5red == 1'b1 && C_5red == 1'b1 && D_5red == 1'b1)
				red_win = 1'b1;
			else if(E_5red == 1'b1 && B_5red == 1'b1 && C_5red == 1'b1 && D_5red == 1'b1)
				red_win = 1'b1;
			else if(E_5red == 1'b1 && F_5red == 1'b1 && C_5red == 1'b1 && D_5red == 1'b1)
				red_win = 1'b1;
				
			else if(A_6red == 1'b1 && B_6red == 1'b1 && C_6red == 1'b1 && D_6red == 1'b1)
				red_win = 1'b1;
			else if(E_6red == 1'b1 && B_6red == 1'b1 && C_6red == 1'b1 && D_6red == 1'b1)
				red_win = 1'b1;
			else if(E_6red == 1'b1 && F_6red == 1'b1 && C_6red == 1'b1 && D_6red == 1'b1)
				red_win = 1'b1;
				
			else if(A_7red == 1'b1 && B_7red == 1'b1 && C_7red == 1'b1 && D_7red == 1'b1)
				red_win = 1'b1;
			else if(E_7red == 1'b1 && B_7red == 1'b1 && C_7red == 1'b1 && D_7red == 1'b1)
				red_win = 1'b1;
			else if(E_7red == 1'b1 && F_7red == 1'b1 && C_7red == 1'b1 && D_7red == 1'b1)
				red_win = 1'b1;
				
			else if(C_1red == 1'b1 && D_2red == 1'b1 && E_3red == 1'b1 && F_4red == 1'b1)
				red_win = 1'b1;
				
			else if(C_2red == 1'b1 && D_3red == 1'b1 && E_4red == 1'b1 && B_1red == 1'b1)
				red_win = 1'b1;
			else if(C_2red == 1'b1 && D_3red == 1'b1 && E_4red == 1'b1 && F_5red == 1'b1)
				red_win = 1'b1;
				
			else if(C_3red == 1'b1 && D_4red == 1'b1 && A_1red == 1'b1 && B_2red == 1'b1)
				red_win = 1'b1;
			else if(C_3red == 1'b1 && D_4red == 1'b1 && E_5red == 1'b1 && B_2red == 1'b1)
				red_win = 1'b1;
			else if(C_3red == 1'b1 && D_4red == 1'b1 && E_5red == 1'b1 && F_6red == 1'b1)
				red_win = 1'b1;
				
			else if(C_4red == 1'b1 && D_5red == 1'b1 && A_2red == 1'b1 && B_3red == 1'b1)
				red_win = 1'b1;
			else if(C_4red == 1'b1 && D_5red == 1'b1 && E_6red == 1'b1 && B_3red == 1'b1)
				red_win = 1'b1;
			else if(C_4red == 1'b1 && D_5red == 1'b1 && E_6red == 1'b1 && F_7red == 1'b1)
				red_win = 1'b1;
				
			else if(C_5red == 1'b1 && D_6red == 1'b1 && A_3red == 1'b1 && B_4red == 1'b1)
				red_win = 1'b1;
			else if(C_5red == 1'b1 && D_6red == 1'b1 && E_7red == 1'b1 && B_4red == 1'b1)
				red_win = 1'b1;
				
			else if(C_6red == 1'b1 && D_7red == 1'b1 && A_4red == 1'b1 && B_5red == 1'b1)
				red_win = 1'b1;
				
		else if(D_1red == 1'b1 && C_2red == 1'b1 && B_3red == 1'b1 && A_4red == 1'b1)
				red_win = 1'b1;
				
			else if(E_1red == 1'b1 && D_2red == 1'b1 && C_3red == 1'b1 && B_4red == 1'b1)
				red_win = 1'b1;
			else if(A_5red == 1'b1 && D_2red == 1'b1 && C_3red == 1'b1 && B_4red == 1'b1)
				red_win = 1'b1;
				
			else if(F_1red == 1'b1 && E_2red == 1'b1 && D_3red == 1'b1 && C_4red == 1'b1)
				red_win = 1'b1;
			else if(B_5red == 1'b1 && E_2red == 1'b1 && D_3red == 1'b1 && C_4red == 1'b1)
				red_win = 1'b1;
			else if(B_5red == 1'b1 && A_6red == 1'b1 && D_3red == 1'b1 && C_4red == 1'b1)
				red_win = 1'b1;
				
			else if(F_2red == 1'b1 && E_3red == 1'b1 && D_4red == 1'b1 && C_5red == 1'b1)
				red_win = 1'b1;
			else if(B_6red == 1'b1 && E_3red == 1'b1 && D_4red == 1'b1 && C_5red == 1'b1)
				red_win = 1'b1;
			else if(B_6red == 1'b1 && A_7red == 1'b1 && D_4red == 1'b1 && C_5red == 1'b1)
				red_win = 1'b1;
				
			else if(F_3red == 1'b1 && E_4red == 1'b1 && D_5red == 1'b1 && C_6red == 1'b1)
				red_win = 1'b1;
			else if(B_7red == 1'b1 && E_3red == 1'b1 && D_4red == 1'b1 && C_5red == 1'b1)
				red_win = 1'b1;
				
			else if(F_4red == 1'b1 && E_5red == 1'b1 && D_6red == 1'b1 && C_7red == 1'b1)
				red_win = 1'b1; 
			else
				red_win = 1'b0;
				

				
     end 
       
    always_comb
    begin:RGB_Display
			if(red_win == 1'b1)
				begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
				end
			else if(black_win == 1'b1)
				begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
				end
			else 
			begin
			if ((f1_on == 1'b1))
			begin 
            if(F_1red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(F_1black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((f2_on == 1'b1))
			begin 
            if(F_2red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(F_2black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((f3_on == 1'b1))
			begin 
            if(F_3red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(F_3black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((f4_on == 1'b1))
			begin 
            if(F_4red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(F_4black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((f5_on == 1'b1))
			begin 
            if(F_5red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(F_5black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((f6_on == 1'b1))
			begin 
            if(F_6red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(F_6black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((f7_on == 1'b1))
			begin 
            if(F_7red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(F_7black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  
		  else if ((e1_on == 1'b1))
			begin 
            if(E_1red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(E_1black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((e2_on == 1'b1))
			begin 
            if(E_2red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(E_2black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((e3_on == 1'b1))
			begin 
            if(E_3red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(E_3black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((e4_on == 1'b1))
			begin 
            if(E_4red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(E_4black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((e5_on == 1'b1))
			begin 
            if(E_5red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(E_5black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((e6_on == 1'b1))
			begin 
            if(E_6red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(E_6black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((e7_on == 1'b1))
			begin 
            if(E_7red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(E_7black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  
		  else if ((d1_on == 1'b1))
			begin 
            if(D_1red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(D_1black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((d2_on == 1'b1))
			begin 
            if(D_2red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(D_2black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((d3_on == 1'b1))
			begin 
            if(D_3red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(D_3black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((d4_on == 1'b1))
			begin 
            if(D_4red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(D_4black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((d5_on == 1'b1))
			begin 
            if(D_5red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(D_5black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((d6_on == 1'b1))
			begin 
            if(D_6red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(D_6black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((d7_on == 1'b1))
			begin 
            if(D_7red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(D_7black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  
		  else if ((c1_on == 1'b1))
			begin 
            if(C_1red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(C_1black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((c2_on == 1'b1))
			begin 
            if(C_2red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(C_2black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((c3_on == 1'b1))
			begin 
            if(C_3red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(C_3black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((c4_on == 1'b1))
			begin 
            if(C_4red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(C_4black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((c5_on == 1'b1))
			begin 
            if(C_5red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(C_5black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((c6_on == 1'b1))
			begin 
            if(C_6red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(C_6black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((c7_on == 1'b1))
			begin 
            if(C_7red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(C_7black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  
		  else if ((b1_on == 1'b1))
			begin 
            if(B_1red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(B_1black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((b2_on == 1'b1))
			begin 
            if(B_2red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(B_2black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((b3_on == 1'b1))
			begin 
            if(B_3red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(B_3black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((b4_on == 1'b1))
			begin 
            if(B_4red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(B_4black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((b5_on == 1'b1))
			begin 
            if(B_5red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(B_5black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((b6_on == 1'b1))
			begin 
            if(B_6red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(B_6black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((b7_on == 1'b1))
			begin 
            if(B_7red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(B_7black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  
		  else if ((a1_on == 1'b1))
			begin
				if(A_1red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(A_1black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((a2_on == 1'b1))
			begin
				if(A_2red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(A_2black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((a3_on == 1'b1))
			begin
				if(A_3red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(A_3black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((a4_on == 1'b1))
			begin
				if(A_4red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(A_4black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((a5_on == 1'b1))
			begin
				if(A_5red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(A_5black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((a6_on == 1'b1))
			begin
				if(A_6red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(A_6black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  else if ((a7_on == 1'b1))
			begin
				if(A_7red == 1'b1)
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if(A_7black == 1'b1)
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
        end
		  
		  else 
        begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'h00; 
        end		  
    end 
	 
	 end
    
endmodule
