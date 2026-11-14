all_zero, wildcards, both Compute examples and End TuplePlayground.

Source: Basics.v, lines 542–563; corresponding section in Basics.html.

(** The [bits] constructor acts as a wrapper for its contents.
    Unwrapping can be done by pattern-matching, as in the [all_zero]
    function below, which tests a nybble to see if all its bits are
    [B0]. *)

Definition all_zero (nb : nybble) : bool :=
  match nb with
  | (bits B0 B0 B0 B0) => true
  | (bits _ _ _ _) => false
  end.

(** (The underscore (_) here is a _wildcard pattern_, which avoids
    inventing variable names that will not be used.) *)

Compute (all_zero (bits B1 B0 B1 B0)).
(* ===> false : bool *)
Compute (all_zero (bits B0 B0 B0 B0)).
(* ===> true : bool *)

End TuplePlayground.

(* ================================================================= *)