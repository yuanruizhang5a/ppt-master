1 star; exact two-hypothesis theorem, unfinished proof, meaning and risk of Admitted.

Source: Basics.v, lines 1085–1112; corresponding section in Basics.html.

(** **** Exercise: 1 star, standard (plus_id_exercise)

    Remove "[Admitted.]" and fill in the proof.  (Note that the
    theorem has _two_ hypotheses -- [n = m] and [m = o] -- each to the
    left of an implication arrow.) *)

Theorem plus_id_exercise : forall n m o : nat,
  n = m -> m = o -> n + m = m + o.
Proof.
  (* FILL IN HERE *) Admitted.
(** [] *)

(** The [Admitted] command tells Rocq that we want to skip trying
    to prove this theorem and just accept it as a given.  This is
    often useful for developing longer proofs: we can state subsidiary
    lemmas that we believe will be useful for making some larger
    argument, use [Admitted] to accept them on faith for the moment,
    and continue working on the main argument until we are sure it
    makes sense; then we can go back and fill in the proofs we
    skipped.

    Be careful, though: every time you say [Admitted] you are leaving
    a door open for total nonsense to enter Rocq's safe, formally
    checked world! *)

(** The [Check] command can also be used to examine the statements of
    previously declared lemmas and theorems.  The two examples below
    are lemmas about multiplication that are proved in the standard