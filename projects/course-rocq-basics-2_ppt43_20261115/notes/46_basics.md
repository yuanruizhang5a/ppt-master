negb_involutive and supplied proof; no as required when no arguments need names.

Source: Basics.v, lines 1250–1272; corresponding section in Basics.html.

    negation is involutive -- i.e., that negation is its own
    inverse. *)

Theorem negb_involutive : forall b : bool,
  negb (negb b) = b.
Proof.
  intros b. destruct b eqn:E.
  - reflexivity.
  - reflexivity.  Qed.

(** Note that the [destruct] here has no [as] clause because
    none of the subcases of the [destruct] need to bind any variables,
    so there is no need to specify any names.  In fact, we can omit
    the [as] clause from _any_ [destruct] and Rocq will fill in
    variable names automatically.  This is generally considered bad
    style, since Rocq often makes confusing choices of names when left
    to its own devices.

    It is sometimes useful to invoke [destruct] inside a subgoal,
    generating yet more proof obligations. In this case, we use
    different kinds of bullets to mark goals on different "levels."
    For example: *)