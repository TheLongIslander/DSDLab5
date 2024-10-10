module sword (input logic sw, reset, clk, output logic v);

logic sword_state;
always_ff @(posedge clk or posedge reset) begin
if (reset) begin
sword_state <= 0;
end else begin
sword_state <= sword_state || sw; 
end
end

assign v = sword_state;
endmodule