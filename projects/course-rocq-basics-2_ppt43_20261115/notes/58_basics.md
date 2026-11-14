3 stars; exact theorem, unfinished proof, source hint on judicious destruct and rewrite.

Source: Basics.v, lines 1515–1531; corresponding section in Basics.html.

(** **** Exercise: 3 stars, standard, optional (andb_eq_orb)

    Prove the following theorem.  (Hint: This can be a bit tricky,
    depending on how you approach it.  You will probably need both
    [destruct] and [rewrite], but destructing everything in sight is
    not the best way.) *)

Theorem andb_eq_orb :
  forall (b c : bool),
  (andb b c = orb b c) ->
  b = c.
Proof.
  (* FILL IN HERE *) Admitted.

(** [] *)

(* ================================================================= *)