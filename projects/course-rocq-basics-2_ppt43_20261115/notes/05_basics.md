Small core and user-defined types; standard library and the course rebuild strategy.

Source: Basics.v, lines 95–114; corresponding section in Basics.html.

(** * Data and Functions *)

(* ================================================================= *)
(** ** Enumerated Types *)

(** One notable thing about Rocq is that its set of built-in
    features is _extremely_ small.  For example, instead of the usual
    palette of atomic data types (booleans, integers, strings, etc.),
    Rocq offers a powerful mechanism for defining new data types from
    scratch, with all these familiar types as instances.

    Naturally, the Rocq distribution also comes with an extensive
    standard library providing definitions of booleans, numbers, and
    many common data structures like lists and hash tables.  But there
    is nothing magic or primitive about these library definitions.  To
    illustrate this, in this course we will explicitly recapitulate
    almost all the definitions we need, rather than getting them
    from the standard library. *)

(* ================================================================= *)