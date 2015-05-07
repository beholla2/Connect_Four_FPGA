module  a6 ( input Reset, frame_clk, input [7:0] keycode,
               output [9:0]  A6X, A6Y,
					inout A_6red,
					inout A_6black,
					inout B_6red,
					inout B_6black,
					inout C_6red,
					inout C_6black,
					inout D_6red,
					inout D_6black,
					inout E_6red,
					inout E_6black,
					inout F_6red,
					inout F_6black
					);
					
	logic invalid_red;
logic invalid_black;

always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Piece
        if (Reset)  // Asynchronous Reset
        begin 
            A_6red <= 1'b0;
				A_6black <= 1'b0;
				B_6red <= 1'b0;
				B_6black <= 1'b0;
				C_6red <= 1'b0;
				C_6black <= 1'b0;
				D_6red <= 1'b0;
				D_6black <= 1'b0;
				E_6red <= 1'b0;
				E_6black <= 1'b0;
				F_6red <= 1'b0;
				F_6black <= 1'b0;
				

        end
           
        else 
        begin 
				 				 
				 case (keycode) 
				 
					8'b00100011: begin
							if(A_6red == 1'b0 && A_6black == 1'b0)
								A_6red = 1'b1;
							else if(B_6red == 1'b0 && B_6black == 1'b0)
								B_6red = 1'b1;
							else if(C_6red == 1'b0 && C_6black == 1'b0)
								C_6red = 1'b1;
							else if(D_6red == 1'b0 && D_6black == 1'b0)
								D_6red = 1'b1;
							else if(E_6red == 1'b0 && E_6black == 1'b0)
								E_6red = 1'b1;
							else if(F_6red == 1'b0 && F_6black == 1'b0) 
								F_6red = 1'b1;
							else
								invalid_red = 1'b1; 
								end
					8'b00011100: begin
					if(A_6red == 1'b0 && A_6black == 1'b0)
						A_6black = 1'b1;
					else if(B_6red == 1'b0 && B_6black == 1'b0)
						B_6black = 1'b1;
					else if(C_6red == 1'b0 && C_6black == 1'b0)
						C_6black = 1'b1;
					else if(D_6red == 1'b0 && D_6black == 1'b0)
						D_6black = 1'b1;
					else if(E_6red == 1'b0 && E_6black == 1'b0)
						E_6black = 1'b1;
					else if(F_6red == 1'b0 && F_6black == 1'b0) 
						F_6black = 1'b1;
					else
						invalid_black = 1'b1;
								end
					default: begin	
									invalid_red = 1'b0;
								end
				 endcase
			
		end  
    end

    assign A6X = 450;
   
    assign A6Y = 450;
    

endmodule