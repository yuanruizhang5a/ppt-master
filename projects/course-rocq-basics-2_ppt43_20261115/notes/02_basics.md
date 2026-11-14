Pure input-output reasoning, first-class functions, algebraic types, pattern matching, polymorphism; Gallina then tactics.

Source: Basics.v, lines 13–43; corresponding section in Basics.html.

(** * Introduction *)

(** The _functional style_ of programming is founded on simple,
    everyday mathematical intuitions: If a procedure or method has no
    side effects, then (ignoring efficiency) all we need to understand
    about it is how it maps inputs to outputs -- that is, we can think
    of it as just a concrete method for computing a mathematical
    function.  This is one sense of the word "functional" in
    "functional programming."  The direct connection between programs
    and simple mathematical objects supports both formal correctness
    proofs and sound informal reasoning about program behavior.

    The other sense in which functional programming is "functional" is
    that it emphasizes the use of functions as _first-class_ values --
    i.e., values that can be passed as arguments to other functions,
    returned as results, included in data structures, etc.  The
    recognition that functions can be treated as data gives rise to a
    host of useful and powerful programming idioms.

    Other common features of functional languages include _algebraic
    data types_ and _pattern matching_, which make it easy to
    construct and manipulate rich data structures, and _polymorphic
    type systems_ supporting abstraction and code reuse.  Rocq offers
    all of these features.

    The first half of this chapter introduces some key elements of
    Rocq's native functional programming language, _Gallina_.  The
    second half introduces some basic _tactics_ that can be used to
    prove properties of Gallina programs. *)

(* ################################################################# *)