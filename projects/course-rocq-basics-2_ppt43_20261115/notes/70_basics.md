3 stars; exact theorem, unfinished proof, source hints on destruct, rewrite and F case.

Source: Basics.v, lines 1816–1837; corresponding section in Basics.html.

(** **** Exercise: 3 stars, standard (lower_grade_lowers)

    Prove the following theorem, which says that, as long as the grade
    starts out above F-, the [lower_grade] option does indeed lower
    the grade.  As usual, destructing everything in sight is _not_ a
    good idea.  Judicious use of [destruct] along with rewriting is a
    better strategy.

    Hint: If you defined your [grade_comparison] function as suggested,
    you will only need to destruct a [letter] in one case.
    The case for [F] will probably benefit from [lower_grade_F_Minus].
  *)
Theorem lower_grade_lowers :
  forall (g : grade),
    grade_comparison (Grade F Minus) g = Lt ->
    grade_comparison (lower_grade g) g = Lt.
Proof.
  (* FILL IN HERE *) Admitted.

(** [] *)

(** Now that we have implemented and tested a function that lowers a