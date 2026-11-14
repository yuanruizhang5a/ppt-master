plus_1_neq_0_firsttry, supplied aborted proof, unknown first argument and blocked match.

Source: Basics.v, lines 1150–1182; corresponding section in Basics.html.

(** * Proof by Case Analysis *)

(** Of course, not everything can be proved by simple
    calculation and rewriting: In general, unknown, hypothetical
    values (arbitrary numbers, booleans, lists, etc.) can block
    simplification.  For example, if we try to prove the following
    fact using the [simpl] tactic as above, we get stuck.  (We then
    use the [Abort] command to give up on it for the moment.)*)

Theorem plus_1_neq_0_firsttry : forall n : nat,
  (n + 1) =? 0 = false.
Proof.
  intros n.
  simpl.  (* does nothing! *)
Abort.

(** The reason for getting stuck is that the definitions of both
    [eqb] and [+] begin by performing a [match] on their first argument.
    Here, the first argument to [+] is the unknown number [n] and the
    argument to [eqb] is the compound expression [n + 1]; neither can
    be simplified.

    To make progress, we need to consider the possible forms of [n],
    separately.  If [n] is [O], then we can calculate the final result
    of [(n + 1) =? 0] and check that it is, indeed, [false].  And if
    [n = S n'] for some [n'], then -- although we don't know exactly
    what number [n + 1] represents -- we can calculate that at least
    it will begin with one [S]; and this is enough to calculate that,
    again, [(n + 1) =? 0] will yield [false].

    The tactic that tells Rocq to consider separate cases where
    [n = O] and [n = S n'] is called [destruct]. *)