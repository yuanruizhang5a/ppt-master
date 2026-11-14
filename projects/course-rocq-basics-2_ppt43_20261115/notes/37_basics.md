plus_O_n' proof; simpl versus unfolding by reflexivity; theorem synonyms, forall, intros and context.

Source: Basics.v, lines 965–1006; corresponding section in Basics.html.

    transformed into the standard upside-down-A symbol.)

    This is a good place to mention that [reflexivity] is a bit more
    powerful than we have suggested. In the examples we have seen,
    the calls to [simpl] were actually not required because
    [reflexivity] will do some simplification automatically when
    checking that two sides are equal; [simpl] was just added so that
    we could see the intermediate state, after simplification but
    before finishing the proof.  Here is a shorter proof: *)

Theorem plus_O_n' : forall n : nat, 0 + n = n.
Proof.
  intros n. reflexivity. Qed.

(** Moreover, it is useful to know that [reflexivity] does
    somewhat _more_ simplification than [simpl] does -- for example,
    it tries "unfolding" defined terms, replacing them with their
    right-hand sides.  The reason for this difference is that, if
    reflexivity succeeds, the whole goal is finished and we don't need
    to look at whatever expanded expressions [reflexivity] has created
    by all this simplification and unfolding; by contrast, [simpl] is
    used in situations where we may have to read and understand the
    new goal that it creates, so we would not want it blindly
    expanding definitions and leaving the goal in a messy state.

    The form of the theorem we just stated and its proof are almost
    exactly the same as the simpler examples we saw earlier; there are
    just a few differences.

    First, we've used the keyword [Theorem] instead of [Example].
    This difference is just a matter of style; the keywords
    [Example] and [Theorem] (and a few others, including [Lemma],
    [Fact], and [Remark]) mean pretty much the same thing to Rocq.

    Second, we've added the quantifier [forall n:nat], so that our
    theorem talks about _all_ natural numbers [n].  Informally, to
    prove theorems of this form, we generally start by saying "Suppose
    [n] is some number..."  Formally, this is achieved in the proof by
    [intros n], which moves [n] from the quantifier in the goal to a
    _context_ of current assumptions.

    Incidentally, we could have used another identifier instead of [n]