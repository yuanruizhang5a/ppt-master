Finite earlier types versus infinite naturals; decimal, hex, octal, binary and unary; proof convenience.

Source: Basics.v, lines 564–602; corresponding section in Basics.html.

(** ** Numbers *)

(** We put this section in a module so that our own definition of
    natural numbers does not interfere with the one from the
    standard library.  In the rest of the book, we'll want to use
    the standard library's. *)

Module NatPlayground.

(** All the types we have defined so far -- both "enumerated
    types" such as [day], [bool], and [bit] and tuple types such as
    [nybble] built from them -- are finite.  The natural numbers, on
    the other hand, are an infinite set, so we'll need to use a
    slightly richer form of type declaration to represent them.

    There are many representations of numbers to choose from. You are
    certainly familiar with decimal notation (base 10), using the
    digits 0 through 9, for example, to form the number 123. You may
    very likely also have encountered hexadecimal notation (base 16),
    in which the same number is represented as 7B, or octal (base 8),
    where it is 173, or binary (base 2), where it is 1111011. Using an
    enumerated type to represent digits, we could use any of these as
    our representation natural numbers. Indeed, there are
    circumstances where each of these choices would be useful.

    The binary representation is valuable in computer hardware because
    the digits can be represented with just two distinct voltage
    levels, resulting in simple circuitry. Analogously, we wish here
    to choose a representation that makes _proofs_ simpler.

    In fact, there is a representation of numbers that is even simpler
    than binary, namely unary (base 1), in which only a single digit
    is used -- as our forebears might have done to count days by
    making scratches on the walls of their caves. To represent unary
    numbers with a Rocq datatype, we use two constructors. The
    capital-letter [O] constructor represents zero. The [S]
    constructor can be applied to the representation of the natural
    number [n], yielding the representation of [n+1], where [S] stands for
    "successor" (or "scratch").  Here is the complete datatype