Exact lower_letter; F is fixed; introduce the proposed strict-lowering claim.

Source: Basics.v, lines 1685–1704; corresponding section in Basics.html.

(** Now that we have a definition of grades and how they compare to
    one another, let us implement a late-penalty fuction. *)

(** First, we define what it means to lower the [letter] component of
    a grade.  Since [F] is already the lowest grade possible, we just
    leave it alone.  *)
Definition lower_letter (l : letter) : letter :=
  match l with
  | A => B
  | B => C
  | C => D
  | D => F
  | F => F  (* Can't go lower than [F]! *)
  end.

(** Our formalization can already help us understand some corner cases
    of the grading policy.  For example, we might expect that if we
    use the [lower_letter] function its result will actually be lower,
    as claimed in the following theorem.  But this theorem is not
    provable!  (Do you see why?) *)