Precedence, associativity, 1+2*3*4 parse; notation scopes, %nat, %Z and source limitations.

Source: Basics.v, lines 1396–1441; corresponding section in Basics.html.

(** ** More on Notation (Optional) *)

(** (In general, sections marked Optional are not needed to follow the
    rest of the book, except possibly other Optional sections.  On a
    first reading, you might want to just skim these sections so that
    you know what's there for future reference.)

    Recall the notation definitions for infix plus and times: *)

Notation "x + y" := (plus x y)
                       (at level 50, left associativity)
                       : nat_scope.
Notation "x * y" := (mult x y)
                       (at level 40, left associativity)
                       : nat_scope.

(** For each notation symbol in Rocq, we can specify its _precedence
    level_ and its _associativity_.  The precedence level [n] is
    specified by writing [at level n]; this helps Rocq parse compound
    expressions.  The associativity setting helps to disambiguate
    expressions containing multiple occurrences of the same
    symbol. For example, the parameters specified above for [+] and
    [*] say that the expression [1+2*3*4] is shorthand for
    [(1+((2*3)*4))]. Rocq uses precedence levels from 0 to 100, and
    _left_, _right_, or _no_ associativity.  We will see more examples
    of this later, e.g., in the [Lists] chapter.

    Each notation symbol is also associated with a _notation scope_.
    Rocq tries to guess what scope is meant from context, so when it
    sees [S (O*O)] it guesses [nat_scope], but when it sees the pair
    type type [bool*bool] (which we'll see in a later chapter) it
    guesses [type_scope].  Occasionally, it is necessary to help it
    out by writing, for example, [(x*y)%nat], and sometimes in what
    Rocq prints it will use [%nat] to indicate what scope a notation is
    in.

    Notation scopes also apply to numeral notations ([3], [4], [5],
    [42], etc.), so you may sometimes see [0%nat], which means
    [O] (the natural number [0] that we're using in this chapter), or
    [0%Z], which means the integer zero (which comes from a different
    part of the standard library).

    Pro tip: Rocq's notation mechanism is not especially powerful.
    Don't expect too much from it. *)

(* ================================================================= *)