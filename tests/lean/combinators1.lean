open tactic

example (p q : Prop) : p → q → (p ∧ p) ∧ q :=
by do
  intros, constructor, focus [trace "first goal" >> trace_state >> constructor, trace "--- Second goal: " >> trace_state >> assumption],
  trace "--- After", trace_state,
  solve [trace "should not work", assumption],
  first [trace "should not work" >> failed, constructor, trace "should work" >> assumption]

example (p q : Prop) : p → q → p ∧ q :=
by do intros, constructor; assumption
