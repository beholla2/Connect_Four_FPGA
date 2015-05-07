//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  a1 ( input Reset, frame_clk, input [7:0] keycode,
               output [9:0]  A1X, A1Y,
					inout A_1red,
					inout A_1black,
					inout B_1red,
					inout B_1black,
					inout C_1red,
					inout C_1black,
					inout D_1red,
					inout D_1black,
					inout E_1red,
					inout E_1black,
					inout F_1red,
					inout F_1black
					);
					
logic invalid_red;
logic invalid_black;

always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Piece
        if (Reset)  // Asynchronous Reset
        begin 
            A_1red <= 1'b0;
				A_1black <= 1'b0;
				B_1red <= 1'b0;
				B_1black <= 1'b0;
				C_1red <= 1'b0;
				C_1black <= 1'b0;
				D_1red <= 1'b0;
				D_1black <= 1'b0;
				E_1red <= 1'b0;
				E_1black <= 1'b0;
				F_1red <= 1'b0;
				F_1black <= 1'b0;
				

        end
           
        else 
        begin 
				 				 
				 case (keycode) 
				 
					8'b00011110: begin
							if(A_1red == 1'b0 && A_1black == 1'b0)
								A_1red = 1'b1;
							else if(B_1red == 1'b0 && B_1black == 1'b0)
								B_1red = 1'b1;
							else if(C_1red == 1'b0 && C_1black == 1'b0)
								C_1red = 1'b1;
							else if(D_1red == 1'b0 && D_1black == 1'b0)
								D_1red = 1'b1;
							else if(E_1red == 1'b0 && E_1black == 1'b0)
								E_1red = 1'b1;
							else if(F_1red == 1'b0 && F_1black == 1'b0) 
								F_1red = 1'b1;
							else
								invalid_red = 1'b1; 
								end
					8'b00010100: begin
					if(A_1red == 1'b0 && A_1black == 1'b0)
						A_1black = 1'b1;
					else if(B_1red == 1'b0 && B_1black == 1'b0)
						B_1black = 1'b1;
					else if(C_1red == 1'b0 && C_1black == 1'b0)
						C_1black = 1'b1;
					else if(D_1red == 1'b0 && D_1black == 1'b0)
						D_1black = 1'b1;
					else if(E_1red == 1'b0 && E_1black == 1'b0)
						E_1black = 1'b1;
					else if(F_1red == 1'b0 && F_1black == 1'b0) 
						F_1black = 1'b1;
					else
						invalid_black = 1'b1;
								end
					default: begin	
									invalid_red = 1'b0;
								end
				 endcase
			
		end  
    end
    
       
    assign A1X = 75;
   
    assign A1Y = 450;
    

endmodule
