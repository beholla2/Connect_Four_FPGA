module  a4 ( input Reset, frame_clk, input [7:0] keycode,
               output [9:0]  A4X, A4Y,
					inout A_4red,
					inout A_4black,
					inout B_4red,
					inout B_4black,
					inout C_4red,
					inout C_4black,
					inout D_4red,
					inout D_4black,
					inout E_4red,
					inout E_4black,
					inout F_4red,
					inout F_4black
					);
					
	logic invalid_red;
logic invalid_black;

always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Piece
        if (Reset)  // Asynchronous Reset
        begin 
            A_4red <= 1'b0;
				A_4black <= 1'b0;
				B_4red <= 1'b0;
				B_4black <= 1'b0;
				C_4red <= 1'b0;
				C_4black <= 1'b0;
				D_4red <= 1'b0;
				D_4black <= 1'b0;
				E_4red <= 1'b0;
				E_4black <= 1'b0;
				F_4red <= 1'b0;
				F_4black <= 1'b0;
				

        end
           
        else 
        begin 
				 				 
				 case (keycode) 
				 
					8'b00100001: begin
							if(A_4red == 1'b0 && A_4black == 1'b0)
								A_4red = 1'b1;
							else if(B_4red == 1'b0 && B_4black == 1'b0)
								B_4red = 1'b1;
							else if(C_4red == 1'b0 && C_4black == 1'b0)
								C_4red = 1'b1;
							else if(D_4red == 1'b0 && D_4black == 1'b0)
								D_4red = 1'b1;
							else if(E_4red == 1'b0 && E_4black == 1'b0)
								E_4red = 1'b1;
							else if(F_4red == 1'b0 && F_4black == 1'b0) 
								F_4red = 1'b1;
							else
								invalid_red = 1'b1; 
								end
					8'b00010101: begin
					if(A_4red == 1'b0 && A_4black == 1'b0)
						A_4black = 1'b1;
					else if(B_4red == 1'b0 && B_4black == 1'b0)
						B_4black = 1'b1;
					else if(C_4red == 1'b0 && C_4black == 1'b0)
						C_4black = 1'b1;
					else if(D_4red == 1'b0 && D_4black == 1'b0)
						D_4black = 1'b1;
					else if(E_4red == 1'b0 && E_4black == 1'b0)
						E_4black = 1'b1;
					else if(F_4red == 1'b0 && F_4black == 1'b0) 
						F_4black = 1'b1;
					else
						invalid_black = 1'b1;
								end
					default: begin	
									invalid_red = 1'b0;
								end
				 endcase
			
		end  
    end
    
       
       
    assign A4X = 300;
   
    assign A4Y = 450;
    

endmodule