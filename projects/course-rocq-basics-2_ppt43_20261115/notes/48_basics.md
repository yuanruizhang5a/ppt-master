andb_commutative' supplied proof; braces delimit nested subproofs and may reuse bullet shapes.

Source: Basics.v, lines 1292–1310; corresponding section in Basics.html.

Theorem andb_commutative' : forall b c, andb b c = andb c b.
Proof.
  intros b c. destruct b eqn:Eb.
  { destruct c eqn:Ec.
    { reflexivity. }
    { reflexivity. } }
  { destruct c eqn:Ec.
    { reflexivity. }
    { reflexivity. } }
Qed.

(** Since curly braces mark both the beginning and the end of a proof,
    they can be used for multiple subgoal levels, as this example
    shows. Furthermore, curly braces allow us to reuse the same bullet
    shapes at multiple levels in a proof.

    The choice of braces, bullets, or a combination of the two is purely
    a matter of taste. *)