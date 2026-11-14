The only values of rgb and color; constructor rules, argument typing, monochrome definition.

Source: Basics.v, lines 450–480; corresponding section in Basics.html.

    ...but these are not:
        - [red primary]
        - [true red]
        - [primary (primary red)]
        - etc.
*)

(** In particular, the definitions of [rgb] and [color] say
    which constructor expressions belong to the sets [rgb] and
    [color]:

    - [red], [green], and [blue] belong to the set [rgb];
    - [black] and [white] belong to the set [color];
    - if [p] is a constructor expression belonging to the set [rgb],
      then [primary p] ("the constructor [primary] applied to the
      argument [p]") is a constructor expression belonging to the set
      [color]; and
    - constructor expressions formed in these ways are the _only_ ones
      belonging to the sets [rgb] and [color]. *)

(** We can define functions on colors using pattern matching just as
    we did for [day] and [bool]. *)

Definition monochrome (c : color) : bool :=
  match c with
  | black => true
  | white => true
  | primary p => false
  end.

(** Since the [primary] constructor takes an argument, a pattern