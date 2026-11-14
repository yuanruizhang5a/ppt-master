2 stars; exact theorem, unfinished proof; source rewrite hint.

Source: Basics.v, lines 1883–1895; corresponding section in Basics.html.

(** **** Exercise: 2 stars, standard (no_penalty_for_mostly_on_time) *)
Theorem no_penalty_for_mostly_on_time :
  forall (late_days : nat) (g : grade),
    (late_days <? 9 = true) ->
    apply_late_policy late_days g = g.
Proof.
  (* FILL IN HERE *) Admitted.

(** [] *)

(** The following theorem states that, if a student has between 9 and
    16 late days, their final grade is lowered by one step. *)