Exact isred definition; variable and wildcard patterns; ordered branches.

Source: Basics.v, lines 481–499; corresponding section in Basics.html.

    matching [primary] should include either a variable, as we just
    did (note that we can choose its name freely), or a constant of
    appropriate type (as below). *)

Definition isred (c : color) : bool :=
  match c with
  | black => false
  | white => false
  | primary red => true
  | primary _ => false
  end.

(** The pattern "[primary _]" here is shorthand for "the constructor
    [primary] applied to any [rgb] constructor except [red]." *)

(** (The wildcard pattern [_] has the same effect as the dummy
    pattern variable [p] in the definition of [monochrome].) *)

(* ================================================================= *)