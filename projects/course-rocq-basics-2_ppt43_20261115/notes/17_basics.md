rgb and color definitions; constructors with arguments and valid/invalid constructor expressions.

Source: Basics.v, lines 414–449; corresponding section in Basics.html.

(** ** New Types from Old *)

(** The types we have defined so far are examples of simple
    "enumerated types": their definitions explicitly enumerate a
    finite set of elements, called _constructors_.  Here is a more
    interesting type definition, [color], where one of the
    constructors takes an argument: *)

Inductive rgb : Type :=
  | red
  | green
  | blue.

Inductive color : Type :=
  | black
  | white
  | primary (p : rgb).

(** Let's look at this in a little more detail.

    An [Inductive] definition does two things:

    - It introduces a set of new _constructors_. E.g., [red],
      [primary], [true], [false], [monday], etc. are constructors.

    - It groups them into a new named type, like [bool], [rgb], or
      [color].

    _Constructor expressions_ are formed by applying a constructor
    to zero or more other constructors or constructor expressions,
    obeying the declared number and types of the constructor arguments.
    E.g., these are valid constructor expressions...
        - [red]
        - [true]
        - [primary red]
        - etc.