Check with and without type annotation; functions as values and arrow types.

Source: Basics.v, lines 381–413; corresponding section in Basics.html.

(** ** Types *)

(** Every expression in Rocq has a type describing what sort of
    thing it computes. The [Check] command asks Rocq to print the type
    of an expression. *)

Check true.
(* ===> true : bool *)

(** If the thing after [Check] is followed by a colon and a type
    declaration, Rocq will verify that the type of the expression
    matches the given type and signal an error if not. *)

Check true
  : bool.
Check (negb true)
  : bool.

(** Functions like [negb] itself are also data values, just like
    [true] and [false].  Their types are called _function types_, and
    they are written with arrows. *)

Check negb
  : bool -> bool.

(** The type of [negb], written [bool -> bool] and pronounced
    "[bool] arrow [bool]," can be read, "Given an input of type
    [bool], this function produces an output of type [bool]."
    Similarly, the type of [andb], written [bool -> bool -> bool], can
    be read, "Given two inputs, each of type [bool], this function
    produces an output of type [bool]." *)

(* ================================================================= *)