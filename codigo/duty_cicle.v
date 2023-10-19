/*****************************************************************************
* Generate 4 bit duty cycle word,  each count (6.25%) corresponding to 
* 1 of 16 duty cycle percentages
******************************************************************************/
module duty_cycle (
	input clk,
	input up, 
	input dn,
	output reg [3:0] duty_cycle
);
reg oldup;
reg olddn;
initial 
begin
	duty_cycle=4'b0001;
	olddn=1'b0;
	oldup=1'b0;
	
end




always @(posedge clk)
begin
	if (dn == 1 && dn != olddn )begin    		// detect rising edge on the dn button input
		if (duty_cycle!=4'b0000 )    				// lower limit
			duty_cycle <= duty_cycle - 1'b1;
	end
	else begin
		if (up == 1 && up != oldup )begin		// detect rising edge on the up button input
			if (duty_cycle!=4'b1111 )				// upper limit
			duty_cycle <= duty_cycle + 1'b1;
		end
	end
	oldup = up; //save away previous value of up button for edge detection
	olddn = dn; //save away previous value of dn button for edge detection
end

endmodule