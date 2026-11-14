otherNat, arbitrary constructor names, interpretation via computation, pred and End NatPlayground.

Source: Basics.v, lines 641–670; corresponding section in Basics.html.

    [nat] will be written as some string of [S] marks followed by an
    [O].  If we like, we can write essentially the same definition
    this way: *)

Inductive otherNat : Type :=
  | stop
  | tick (foo : otherNat).

(** The _interpretation_ of these marks arises from how we use them to
    compute. *)

(** We can do this by writing functions that pattern match on
    representations of natural numbers just as we did above with
    booleans and days -- for example, here is the predecessor
    function: *)

Definition pred (n : nat) : nat :=
  match n with
  | O => O
  | S n' => n'
  end.

(** The second branch can be read: "if [n] has the form [S n']
    for some [n'], then return [n']."  *)

(** The following [End] command closes the current module, so
    [nat] will refer back to the type from the standard library. *)

End NatPlayground.