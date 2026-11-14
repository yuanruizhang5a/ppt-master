Playground.foo versus foo; exact module example and Check commands.

Source: Basics.v, lines 500–519; corresponding section in Basics.html.

(** ** Modules *)

(** Rocq provides a _module system_ to aid in organizing large
    developments.  We won't need most of its features, but one is
    useful here: If we enclose a collection of declarations between
    [Module X] and [End X] markers, then, in the remainder of the file
    after the [End], these definitions are referred to by names like
    [X.foo] instead of just [foo].  We will use this feature to limit
    the scope of definitions, so that we are free to reuse names. *)

Module Playground.
  Definition foo : rgb := blue.
End Playground.

Definition foo : bool := true.

Check Playground.foo : rgb.
Check foo : bool.

(* ================================================================= *)