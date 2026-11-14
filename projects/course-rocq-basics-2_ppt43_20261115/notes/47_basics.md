andb_commutative exact supplied proof with nested bullets.

Source: Basics.v, lines 1273–1291; corresponding section in Basics.html.

Theorem andb_commutative : forall b c, andb b c = andb c b.
Proof.
  intros b c. destruct b eqn:Eb.
  - destruct c eqn:Ec.
    + reflexivity.
    + reflexivity.
  - destruct c eqn:Ec.
    + reflexivity.
    + reflexivity.
Qed.

(** Each pair of calls to [reflexivity] corresponds to the
    subgoals that were generated after the execution of the [destruct c]
    line right above it. *)

(** Besides [-] and [+], we can use [*] (asterisk) or any repetition
    of a bullet symbol (e.g. [--] or [***]) as a bullet.  We can also
    enclose sub-proofs in curly braces instead of using bullets: *)