plus_1_neq_0 complete proof; intro pattern, generated cases and eqn:E.

Source: Basics.v, lines 1183–1220; corresponding section in Basics.html.

Theorem plus_1_neq_0 : forall n : nat,
  (n + 1) =? 0 = false.
Proof.
  intros n. destruct n as [| n'] eqn:E.
  - reflexivity.
  - reflexivity.   Qed.

(** The [destruct] generates _two_ subgoals, which we must then
    prove, separately, in order to get Rocq to accept the theorem.

    The annotation "[as [| n']]" is called an _intro pattern_.  It
    tells Rocq what variable names to introduce in each subgoal.  In
    general, what goes between the square brackets is a _list of
    lists_ of names, separated by [|].  In this case, the first
    component is empty, since the [O] constructor doesn't take any
    arguments.  The second component gives a single name, [n'], since
    [S] is a unary constructor.

    In each subgoal, Rocq remembers the assumption about [n] that is
    relevant for this subgoal -- either [n = 0] or [n = S n'] for some
    n'.  The [eqn:E] annotation tells [destruct] to give the name [E]
    to this equation.  (Leaving off the [eqn:E] annotation causes Rocq
    to elide these assumptions in the subgoals.  This slightly
    streamlines proofs where the assumptions are not explicitly used,
    but it is better practice to keep them for the sake of
    documentation, as they can help keep you oriented when working
    with the subgoals.)

    The [-] signs on the second and third lines are called _bullets_,
    and they mark the parts of the proof that correspond to the two
    generated subgoals.  The part of the proof script that comes after
    a bullet is the entire proof for the corresponding subgoal.  In
    this example, each of the subgoals is easily proved by a single
    use of [reflexivity], which itself performs some simplification --
    e.g., the second one simplifies [(S n' + 1) =? 0] to [false] by
    first rewriting [(S n' + 1)] to [S (n' + 1)], then unfolding
    [eqb], and then simplifying the [match].