Exact plus' definition; strictly smaller arguments, termination and limited decreasing analysis.

Source: Basics.v, lines 1442–1465; corresponding section in Basics.html.

(** ** Fixpoints and Structural Recursion (Optional) *)

(** Here is a copy of the definition of addition: *)

Fixpoint plus' (n : nat) (m : nat) : nat :=
  match n with
  | O => m
  | S n' => S (plus' n' m)
  end.

(** When Rocq checks this definition, it notes that [plus'] is
    "decreasing on 1st argument."  What this means is that we are
    performing a _structural recursion_ over the argument [n] -- i.e.,
    that we make recursive calls only on strictly smaller values of
    [n].  This implies that all calls to [plus'] will eventually
    terminate.  Rocq demands that some argument of _every_ [Fixpoint]
    definition be "decreasing."

    This requirement is a fundamental feature of Rocq's design: In
    particular, it guarantees that every function that can be defined
    in Rocq will terminate on all inputs.  However, because Rocq's
    "decreasing analysis" is not very sophisticated, it is sometimes
    necessary to write functions in slightly unnatural ways. *)