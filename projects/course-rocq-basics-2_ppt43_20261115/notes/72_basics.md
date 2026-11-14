Exact apply_late_policy_unfold theorem and supplied reflexivity proof; purpose of this equality.

Source: Basics.v, lines 1856–1882; corresponding section in Basics.html.

(** Sometimes it is useful to be able to "unfold" a definition to be
    able to make progress on a proof.  Soon, we will see how to do this
    in a much simpler way automatically, but for now, it is easy to prove
    that a use of any definition like [apply_late_policy] is equal to its
    right hand side just by using reflexivity.

    This result is useful because it allows us to use [rewrite] to
    expose the internals of the definition. *)
Theorem apply_late_policy_unfold :
  forall (late_days : nat) (g : grade),
    (apply_late_policy late_days g)
    =
    (if late_days <? 9 then g  else
       if late_days <? 17 then lower_grade g
       else if late_days <? 21 then lower_grade (lower_grade g)
            else lower_grade (lower_grade (lower_grade g))).
Proof.
  intros. reflexivity.
Qed.

(** Now let's prove some properties about this policy. *)

(** The next theorem states that if a student accrues no more than eight
    late days throughout the semester, their grade is unaffected. It
    is easy to prove: once you use the [apply_late_policy_unfold] you
    can rewrite using the hypothesis. *)