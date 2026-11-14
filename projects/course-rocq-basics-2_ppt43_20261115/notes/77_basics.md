All seven named tests and exact assertions; unit tests do not fully establish correctness.

Source: Basics.v, lines 1954–1985; corresponding section in Basics.html.

(** The following "unit tests" of your increment and binary-to-unary
    functions should pass after you have defined those functions correctly.
    Of course, unit tests don't fully demonstrate the correctness of
    your functions!  We'll return to that thought at the end of the
    next chapter. *)

Example test_bin_incr1 : (incr (B1 Z)) = B0 (B1 Z).
(* FILL IN HERE *) Admitted.

Example test_bin_incr2 : (incr (B0 (B1 Z))) = B1 (B1 Z).
(* FILL IN HERE *) Admitted.

Example test_bin_incr3 : (incr (B1 (B1 Z))) = B0 (B0 (B1 Z)).
(* FILL IN HERE *) Admitted.

Example test_bin_incr4 : bin_to_nat (B0 (B1 Z)) = 2.
(* FILL IN HERE *) Admitted.

Example test_bin_incr5 :
        bin_to_nat (incr (B1 Z)) = 1 + bin_to_nat (B1 Z).
(* FILL IN HERE *) Admitted.

Example test_bin_incr6 :
        bin_to_nat (incr (incr (B1 Z))) = 2 + bin_to_nat (B1 Z).
(* FILL IN HERE *) Admitted.

Example test_bin_incr7 : bin_to_nat (B0 (B0 (B0 (B1 Z)))) = 8.
(* FILL IN HERE *) Admitted.

(** [] *)

(* ################################################################# *)