module  a3 ( input Reset, frame_clk, input [7:0] keycode,
               output [9:0]  A3X, A3Y,
					inout A_3red,
					inout A_3black,
					inout B_3red,
					inout B_3black,
					inout C_3red,
					inout C_3black,
					inout D_3red,
					inout D_3black,
					inout E_3red,
					inout E_3black,
					inout F_3red,
					inout F_3black
					);
					
	logic invalid_red;
logic invalid_black;

always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Piece
        if (Reset)  // Asynchronous Reset
        begin 
            A_3red <= 1'b0;
				A_3black <= 1'b0;
				B_3red <= 1'b0;
				B_3black <= 1'b0;
				C_3red <= 1'b0;
				C_3black <= 1'b0;
				D_3red <= 1'b0;
				D_3black <= 1'b0;
				E_3red <= 1'b0;
				E_3black <= 1'b0;
				F_3red <= 1'b0;
				F_3black <= 1'b0;
				

        end
           
        else 
        begin 
				 				 
				 case (keycode) 
				 
					8'b00100000: begin
							if(A_3red == 1'b0 && A_3black == 1'b0)
								A_3red = 1'b1;
							else if(B_3red == 1'b0 && B_3black == 1'b0)
								B_3red = 1'b1;
							else if(C_3red == 1'b0 && C_3black == 1'b0)
								C_3red = 1'b1;
							else if(D_3red == 1'b0 && D_3black == 1'b0)
								D_3red = 1'b1;
							else if(E_3red == 1'b0 && E_3black == 1'b0)
								E_3red = 1'b1;
							else if(F_3red == 1'b0 && F_3black == 1'b0) 
								F_3red = 1'b1;
							else
								invalid_red = 1'b1; 
								end
					8'b00001000: begin
					if(A_3red == 1'b0 && A_3black == 1'b0)
						A_3black = 1'b1;
					else if(B_3red == 1'b0 && B_3black == 1'b0)
						B_3black = 1'b1;
					else if(C_3red == 1'b0 && C_3black == 1'b0)
						C_3black = 1'b1;
					else if(D_3red == 1'b0 && D_3black == 1'b0)
						D_3black = 1'b1;
					else if(E_3red == 1'b0 && E_3black == 1'b0)
						E_3black = 1'b1;
					else if(F_3red == 1'b0 && F_3black == 1'b0) 
						F_3black = 1'b1;
					else
						invalid_black = 1'b1;
								end
					default: begin	
									invalid_red = 1'b0;
								end
				 endcase
			
		end  
    end
    
       
    assign A3X = 225;
   
    assign A3Y = 450;
    

endmodule