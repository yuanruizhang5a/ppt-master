All three notation declarations, levels, associativity, scope, Check expression; parser-only change.

Source: Basics.v, lines 829–851; corresponding section in Basics.html.

    by introducing notations for addition, subtraction, and
    multiplication. *)

Notation "x + y" := (plus x y)
                       (at level 50, left associativity)
                       : nat_scope.
Notation "x - y" := (minus x y)
                       (at level 50, left associativity)
                       : nat_scope.
Notation "x * y" := (mult x y)
                       (at level 40, left associativity)
                       : nat_scope.

Check ((0 + 1) + 1) : nat.

(** (The [level], [associativity], and [nat_scope] annotations
    control how these notations are treated by Rocq's parser.  The
    details are not important for present purposes, but interested
    readers can check out the "More on Notation" section at the end of
    this chapter.)

    Note that these declarations do not change the definitions we've
    already made: they are simply instructions to Rocq's parser to