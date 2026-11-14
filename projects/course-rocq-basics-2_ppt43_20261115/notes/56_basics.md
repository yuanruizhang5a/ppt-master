1 star; exact function-hypothesis theorem and unfinished proof.

Source: Basics.v, lines 1482–1500; corresponding section in Basics.html.

(** * More Exercises *)

(* ================================================================= *)
(** ** Warmups *)

(** **** Exercise: 1 star, standard (identity_fn_applied_twice)

    Use the tactics you have learned so far to prove the following
    theorem about boolean functions. *)

Theorem identity_fn_applied_twice :
  forall (f : bool -> bool),
  (forall (x : bool), f x = x) ->
  forall (b : bool), f (f b) = b.
Proof.
  (* FILL IN HERE *) Admitted.

(** [] *)