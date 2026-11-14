plus_1_neq_0' and andb_commutative'' supplied proofs; intro patterns omit eqn recording.

Source: Basics.v, lines 1354–1387; corresponding section in Basics.html.

(** Before closing the chapter, we should mention one final
    convenience.  As you may have noticed, many proofs perform case
    analysis on a variable right after introducing it:

       intros x y. destruct y as [|y] eqn:E.

    This pattern is so common that Rocq provides a shorthand for it: we
    can perform case analysis on a variable when introducing it by
    using an intro pattern instead of a variable name. For instance,
    here is a shorter proof of the [plus_1_neq_0] theorem
    above.  (You'll also note one downside of this shorthand: we lose
    the equation recording the assumption we are making in each
    subgoal, which we previously got from the [eqn:E] annotation.) *)

Theorem plus_1_neq_0' : forall n : nat,
  (n + 1) =? 0 = false.
Proof.
  intros [|n].
  - reflexivity.
  - reflexivity.  Qed.

(** If there are no constructor arguments that need names, we can just
    write [[]] to get the case analysis. *)

Theorem andb_commutative'' :
  forall b c, andb b c = andb c b.
Proof.
  intros [] [].
  - reflexivity.
  - reflexivity.
  - reflexivity.
  - reflexivity.
Qed.