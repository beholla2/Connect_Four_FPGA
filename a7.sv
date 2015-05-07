module  a7 ( input Reset, frame_clk, input [7:0] keycode,
               output [9:0]  A7X, A7Y,
					inout A_7red,
					inout A_7black,
					inout B_7red,
					inout B_7black,
					inout C_7red,
					inout C_7black,
					inout D_7red,
					inout D_7black,
					inout E_7red,
					inout E_7black,
					inout F_7red,
					inout F_7black,
					output back
					);
					
	logic invalid_red;
logic invalid_black;

always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Piece
        if (Reset)  // Asynchronous Reset
        begin 
            A_7red <= 1'b0;
				A_7black <= 1'b0;
				B_7red <= 1'b0;
				B_7black <= 1'b0;
				C_7red <= 1'b0;
				C_7black <= 1'b0;
				D_7red <= 1'b0;
				D_7black <= 1'b0;
				E_7red <= 1'b0;
				E_7black <= 1'b0;
				F_7red <= 1'b0;
				F_7black <= 1'b0;
				

        end
           
        else 
        begin 
				 				 
				 case (keycode) 
				 
					8'b00100100: begin
							if(A_7red == 1'b0 && A_7black == 1'b0)
								A_7red = 1'b1;
							else if(B_7red == 1'b0 && B_7black == 1'b0)
								B_7red = 1'b1;
							else if(C_7red == 1'b0 && C_7black == 1'b0)
								C_7red = 1'b1;
							else if(D_7red == 1'b0 && D_7black == 1'b0)
								D_7red = 1'b1;
							else if(E_7red == 1'b0 && E_7black == 1'b0)
								E_7red = 1'b1;
							else if(F_7red == 1'b0 && F_7black == 1'b0) 
								F_7red = 1'b1;
							else
								invalid_red = 1'b1; 
								end
								
					8'b00011000: begin
					if(A_7red == 1'b0 && A_7black == 1'b0)
						A_7black = 1'b1;
					else if(B_7red == 1'b0 && B_7black == 1'b0)
						B_7black = 1'b1;
					else if(C_7red == 1'b0 && C_7black == 1'b0)
						C_7black = 1'b1;
					else if(D_7red == 1'b0 && D_7black == 1'b0)
						D_7black = 1'b1;
					else if(E_7red == 1'b0 && E_7black == 1'b0)
						E_7black = 1'b1;
					else if(F_7red == 1'b0 && F_7black == 1'b0) 
						F_7black = 1'b1;
					else
						invalid_black = 1'b1;
								end
								
					8'b00000101: begin
					
						back = 1'b1;
					end
					
					default: begin	
									invalid_red = 1'b0;
								end
				 endcase
			
		end  
    end
    
       
    assign A7X = 525;
   
    assign A7Y = 450;
    

endmodule