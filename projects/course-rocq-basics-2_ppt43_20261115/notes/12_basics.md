negb', andb', orb'; first and second constructor branches for any two-constructor type.

Source: Basics.v, lines 282–308; corresponding section in Basics.html.

    font (and without the brackets). *)

(** These examples are also an opportunity to introduce one more
    feature of Rocq's programming language: conditional expressions... *)

Definition negb' (b:bool) : bool :=
  if b then false
  else true.

Definition andb' (b1:bool) (b2:bool) : bool :=
  if b1 then b2
  else false.

Definition orb' (b1:bool) (b2:bool) : bool :=
  if b1 then true
  else b2.

(** Rocq's conditionals are exactly like those found in any other
    language, with one small generalization:

    Since the [bool] type is not built in, Rocq actually supports
    conditional expressions over _any_ inductively defined type with
    exactly two clauses in its definition.  The guard is considered
    true if it evaluates to the "constructor" of the first clause of
    the [Inductive] definition (which happens to be called [true] in
    this case) and false if it evaluates to the second. *)