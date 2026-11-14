2 stars; exact function signature, one-step specification, F- floor, nested-match hint; first examples.

Source: Basics.v, lines 1743–1772; corresponding section in Basics.html.

(** **** Exercise: 2 stars, standard (lower_grade)

    We can now use the [lower_letter] definition as a helper to define
    what it means to lower a grade by one step.  Complete the
    definition below so that it sends a grade [g] to one step lower
    (unless it is already [Grade F Minus], which should remain
    unchanged).  Once you have implemented it correctly, the subsequent
    "unit test" examples should hold trivially.

    Hint: To make this a succinct definition that is easy to prove
    properties about, you will probably want to use nested pattern
    matching. The outer match should not match on the specific letter
    component of the grade -- it should consider only the modifier.
    You should definitely _not_ try to enumerate all of the
    cases.

    Our solution is under 10 lines of code total. *)
Definition lower_grade (g : grade) : grade
  (* REPLACE THIS LINE WITH ":= _your_definition_ ." *). Admitted.

Example lower_grade_A_Plus :
  lower_grade (Grade A Plus) = (Grade A Natural).
Proof.
(* FILL IN HERE *) Admitted.

Example lower_grade_A_Natural :
  lower_grade (Grade A Natural) = (Grade A Minus).
Proof.
(* FILL IN HERE *) Admitted.