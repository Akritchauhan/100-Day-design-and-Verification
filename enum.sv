typedef enum logic [2:0]{
  IDLE =3'b000,
  READ=3'b001,
  WRITE=3'b010,
  ERROR=3'b111
} state_t;

module state_enum;
  state_t current_state;
  
  initial begin
    current_state=READ;
    $display("current state =%s (%d)",current_state.name(),current_state);
  end
endmodule
