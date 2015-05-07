


module  a2 ( input Reset, frame_clk, input [7:0] keycode,
               output [9:0]  A2X, A2Y,
					
					inout A_2red,
					inout A_2black,
					inout B_2red,
					inout B_2black,
					inout C_2red,
					inout C_2black,
					inout D_2red,
					inout D_2black,
					inout E_2red,
					inout E_2black,
					inout F_2red,
					inout F_2black
					
					);
					
logic invalid_red;
logic invalid_black;

always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Piece
        if (Reset)  // Asynchronous Reset
        begin 
            A_2red <= 1'b0;
				A_2black <= 1'b0;
				B_2red <= 1'b0;
				B_2black <= 1'b0;
				C_2red <= 1'b0;
				C_2black <= 1'b0;
				D_2red <= 1'b0;
				D_2black <= 1'b0;
				E_2red <= 1'b0;
				E_2black <= 1'b0;
				F_2red <= 1'b0;
				F_2black <= 1'b0;
				

        end
           
        else 
        begin 
				 
				 
				 case (keycode) 
				 
					8'b00011111: begin
							if(A_2red == 1'b0 && A_2black == 1'b0)
								A_2red = 1'b1;
							else if(B_2red == 1'b0 && B_2black == 1'b0)
								B_2red = 1'b1;
							else if(C_2red == 1'b0 && C_2black == 1'b0)
								C_2red = 1'b1;
							else if(D_2red == 1'b0 && D_2black == 1'b0)
								D_2red = 1'b1;
							else if(E_2red == 1'b0 && E_2black == 1'b0)
								E_2red = 1'b1;
							else if(F_2red == 1'b0 && F_2black == 1'b0) 
								F_2red = 1'b1;
							else
								invalid_red = 1'b1; 
								end
					8'b00011010: begin
					if(A_2red == 1'b0 && A_2black == 1'b0)
						A_2black = 1'b1;
					else if(B_2red == 1'b0 && B_2black == 1'b0)
						B_2black = 1'b1;
					else if(C_2red == 1'b0 && C_2black == 1'b0)
						C_2black = 1'b1;
					else if(D_2red == 1'b0 && D_2black == 1'b0)
						D_2black = 1'b1;
					else if(E_2red == 1'b0 && E_2black == 1'b0)
						E_2black = 1'b1;
					else if(F_2red == 1'b0 && F_2black == 1'b0) 
						F_2black = 1'b1;
					else
						invalid_black = 1'b1;
								end
					default: begin	
									invalid_red = 1'b0;
								end
				 endcase
			
		end  
    end
    
       
    assign A2X = 150;
   
    assign A2Y = 450;
    

endmodule
