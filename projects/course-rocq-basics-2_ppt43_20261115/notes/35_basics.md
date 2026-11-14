1 star; signature, source hint to reuse a function, notation and all three named tests.

Source: Basics.v, lines 910–933; corresponding section in Basics.html.

(** **** Exercise: 1 star, standard (ltb)

    Fill in the definition of an [ltb] function that tests natural
    numbers for [l]ess-[t]han, yielding a [b]oolean.

    Hint: Instead of making up a new [Fixpoint] for
    this one, define it in terms of a previously defined
    function.  It can be done with just one previously defined
    function, but you can use two if you want. *)

Definition ltb (n m : nat) : bool
  (* REPLACE THIS LINE WITH ":= _your_definition_ ." *). Admitted.

Notation "x <? y" := (ltb x y) (at level 70) : nat_scope.

Example test_ltb1:             (ltb 2 2) = false.
(* FILL IN HERE *) Admitted.
Example test_ltb2:             (ltb 2 4) = true.
(* FILL IN HERE *) Admitted.
Example test_ltb3:             (ltb 4 2) = false.
(* FILL IN HERE *) Admitted.
(** [] *)

(* ################################################################# *)