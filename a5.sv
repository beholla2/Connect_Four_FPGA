module  a5 ( input Reset, frame_clk, input [7:0] keycode,
               output [9:0]  A5X, A5Y,
					inout A_5red,
					inout A_5black,
					inout B_5red,
					inout B_5black,
					inout C_5red,
					inout C_5black,
					inout D_5red,
					inout D_5black,
					inout E_5red,
					inout E_5black,
					inout F_5red,
					inout F_5black
					);
					
	logic invalid_red;
logic invalid_black;

always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Piece
        if (Reset)  // Asynchronous Reset
        begin 
            A_5red <= 1'b0;
				A_5black <= 1'b0;
				B_5red <= 1'b0;
				B_5black <= 1'b0;
				C_5red <= 1'b0;
				C_5black <= 1'b0;
				D_5red <= 1'b0;
				D_5black <= 1'b0;
				E_5red <= 1'b0;
				E_5black <= 1'b0;
				F_5red <= 1'b0;
				F_5black <= 1'b0;
				

        end
           
        else 
        begin 
				 				 
				 case (keycode) 
				 
					8'b00100010: begin
							if(A_5red == 1'b0 && A_5black == 1'b0)
								A_5red = 1'b1;
							else if(B_5red == 1'b0 && B_5black == 1'b0)
								B_5red = 1'b1;
							else if(C_5red == 1'b0 && C_5black == 1'b0)
								C_5red = 1'b1;
							else if(D_5red == 1'b0 && D_5black == 1'b0)
								D_5red = 1'b1;
							else if(E_5red == 1'b0 && E_5black == 1'b0)
								E_5red = 1'b1;
							else if(F_5red == 1'b0 && F_5black == 1'b0) 
								F_5red = 1'b1;
							else
								invalid_red = 1'b1; 
								end
					8'b00010111: begin
					if(A_5red == 1'b0 && A_5black == 1'b0)
						A_5black = 1'b1;
					else if(B_5red == 1'b0 && B_5black == 1'b0)
						B_5black = 1'b1;
					else if(C_5red == 1'b0 && C_5black == 1'b0)
						C_5black = 1'b1;
					else if(D_5red == 1'b0 && D_5black == 1'b0)
						D_5black = 1'b1;
					else if(E_5red == 1'b0 && E_5black == 1'b0)
						E_5black = 1'b1;
					else if(F_5red == 1'b0 && F_5black == 1'b0) 
						F_5black = 1'b1;
					else
						invalid_black = 1'b1;
								end
					default: begin	
									invalid_red = 1'b0;
								end
				 endcase
			
		end  
    end
    
    
       
    assign A5X = 375;
   
    assign A5Y = 450;
    

endmodule