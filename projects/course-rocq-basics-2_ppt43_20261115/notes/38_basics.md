plus_O_n'' with renamed binder, plus_1_l and mult_0_l; tactics and left suffix.

Source: Basics.v, lines 1007–1038; corresponding section in Basics.html.

    in the [intros] clause, (though of course this might be confusing
    to human readers of the proof): *)

Theorem plus_O_n'' : forall n : nat, 0 + n = n.
Proof.
  intros m. reflexivity. Qed.

(** The keywords [intros], [simpl], and [reflexivity] are
    examples of _tactics_.  A tactic is a command that is used between
    [Proof] and [Qed] to guide the process of checking some claim we
    are making.  We will see several more tactics in the rest of this
    chapter and many more in future chapters. *)

(** Other similar theorems can be proved with the same pattern. *)

Theorem plus_1_l : forall n:nat, 1 + n = S n.
Proof.
  intros n. reflexivity.  Qed.

Theorem mult_0_l : forall n:nat, 0 * n = 0.
Proof.
  intros n. reflexivity.  Qed.

(** The [_l] suffix in the names of these theorems is
    pronounced "on the left." *)

(** It is worth stepping through these proofs to observe how the
    context and the goal change.  You may want to add calls to [simpl]
    before [reflexivity] to see the simplifications that Rocq performs
    on the terms before checking that they are equal. *)

(* ################################################################# *)