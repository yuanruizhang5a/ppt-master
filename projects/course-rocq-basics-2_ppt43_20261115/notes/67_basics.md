2 stars; corrected statement with F comparison hypothesis, unfinished proof.

Source: Basics.v, lines 1730–1742; corresponding section in Basics.html.

(** **** Exercise: 2 stars, standard (lower_letter_lowers)

    Prove the following theorem. *)

Theorem lower_letter_lowers:
  forall (l : letter),
    letter_comparison F l = Lt ->
    letter_comparison (lower_letter l) l = Lt.
Proof.
(* FILL IN HERE *) Admitted.

(** [] *)