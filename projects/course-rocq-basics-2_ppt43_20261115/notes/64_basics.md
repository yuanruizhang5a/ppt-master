2 stars; lexicographic order, unfinished function and all four source named tests and hint.

Source: Basics.v, lines 1647–1684; corresponding section in Basics.html.

(** **** Exercise: 2 stars, standard (grade_comparison)

    Use pattern matching to complete the following definition.

    (This ordering on grades is sometimes called "lexicographic"
    ordering: we first compare the letters, and we only consider the
    modifiers in the case that the letters are equal.  I.e. all grade
    variants of [A] are greater than all grade variants of [B].)

    Hint: match against [g1] and [g2] simultaneously, but don't try to
    enumerate all the cases.  Instead do case analysis on the result
    of a suitable call to [letter_comparison] to end up with just [3]
    possibilities. *)

Definition grade_comparison (g1 g2 : grade) : comparison
  (* REPLACE THIS LINE WITH ":= _your_definition_ ." *). Admitted.

(** The following "unit tests" of your [grade_comparison] function
    should pass once you have defined it correctly. *)

Example test_grade_comparison1 :
  (grade_comparison (Grade A Minus) (Grade B Plus)) = Gt.
(* FILL IN HERE *) Admitted.

Example test_grade_comparison2 :
  (grade_comparison (Grade A Minus) (Grade A Plus)) = Lt.
(* FILL IN HERE *) Admitted.

Example test_grade_comparison3 :
  (grade_comparison (Grade F Plus) (Grade F Plus)) = Eq.
(* FILL IN HERE *) Admitted.

Example test_grade_comparison4 :
  (grade_comparison (Grade B Minus) (Grade C Plus)) = Gt.
(* FILL IN HERE *) Admitted.

(** [] *)