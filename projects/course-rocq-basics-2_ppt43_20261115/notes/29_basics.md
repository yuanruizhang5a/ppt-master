mult definition, grouped argument syntax, test_mult1 and proof.

Source: Basics.v, lines 772–786; corresponding section in Basics.html.


(** As a notational convenience, if two or more arguments have
    the same type, they can be grouped together.  In the following
    definition, [(n m : nat)] means just the same as if we had written
    [(n : nat) (m : nat)]. *)

Fixpoint mult (n m : nat) : nat :=
  match n with
  | O => O
  | S n' => plus m (mult n' m)
  end.

Example test_mult1: (mult 3 3) = 9.
Proof. simpl. reflexivity.  Qed.