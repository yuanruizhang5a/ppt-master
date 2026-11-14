2 stars; exact theorem and all three source hints; no added proof.

Source: Basics.v, lines 1331–1353; corresponding section in Basics.html.

(** **** Exercise: 2 stars, standard (andb_true_elim2)

    Prove the following claim, marking cases (and subcases) with
    bullets when you use [destruct].

    Hint 1: Thus far, we've only ever used [simpl] to simplify the goal.
    It is also possible to use it to simplify hypotheses:
    use [simpl in H], where [H] is a hypothesis, to simplify it.
    You may find this useful in this exercise.

    Hint 2: You will eventually need to destruct both booleans, as in
    the theorems above. It is better to simplify the hypothesis
    before attempting to destruct the second boolean.

    Hint 3: If you reach a contradiction in the hypotheses, focus on
    how to [rewrite] using that contradiction. *)

Theorem andb_true_elim2 : forall b c : bool,
  andb b c = true -> c = true.
Proof.
  (* FILL IN HERE *) Admitted.
(** [] *)