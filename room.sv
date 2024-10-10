module room (
input logic clk, n, s, e, w, v, reset, output logic s6, win, s5, d, s4, s3, sw, s2, s1, s0);

logic room_state_s0, room_state_s1, room_state_s2, room_state_s3, room_state_s4,
room_state_s5, room_state_s6;


assign {s6, s5, s4, s3, sw, s2, s1, s0} = {room_state_s6, room_state_s5, room_state_s4, room_state_s3, room_state_s3, room_state_s2, room_state_s1, room_state_s0};

always_ff @(posedge clk or posedge reset) begin

if (reset) begin
room_state_s0 <= 1; 
room_state_s1 <= 0;
room_state_s2 <= 0;
room_state_s3 <= 0;
room_state_s4 <= 0;
room_state_s5 <= 0;
room_state_s6 <= 0;
win <= 0; 
d <= 0;
end else begin
case (1'b1) 
room_state_s0: begin
if (e) begin
room_state_s0 <= 0;
room_state_s1 <= 1;
end
end
room_state_s1: begin
if (s) begin
room_state_s1 <= 0;
room_state_s2 <= 1;
end else if (w) begin
room_state_s1 <= 0;
room_state_s0 <= 1; 
end
end
room_state_s2: begin
if (s && e) begin
room_state_s2 <= 0;
room_state_s4 <= 1; 
end else if (w) begin
room_state_s2 <= 0;
room_state_s3 <= 1; 
end else if (n) begin
room_state_s2 <= 0;
room_state_s1 <= 1; 
end
end
room_state_s3: begin
if (e) begin
room_state_s3 <= 0;
room_state_s2 <= 1; 
end
end
room_state_s4: begin
if (v) begin
room_state_s4 <= 0;
room_state_s5 <= 1;
end else begin
room_state_s4 <= 0;
room_state_s6 <= 1; 
end
end
room_state_s5: begin
win <= 1; 
room_state_s5 <= 1; 
end
room_state_s6: begin
d <= 1; 
room_state_s6 <= 1; 
end
endcase
end
end
endmodule