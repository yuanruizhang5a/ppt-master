2 stars; exact theorem and unfinished proof; source exercise label is graded_lowered_once; End LateDays.

Source: Basics.v, lines 1896–1908; corresponding section in Basics.html.

(** **** Exercise: 2 stars, standard (graded_lowered_once) *)
Theorem grade_lowered_once :
  forall (late_days : nat) (g : grade),
    (late_days <? 9 = false) ->
    (late_days <? 17 = true) ->
    (apply_late_policy late_days g) = (lower_grade g).
Proof.
  (* FILL IN HERE *) Admitted.

(** [] *)
End LateDays.

(* ================================================================= *)