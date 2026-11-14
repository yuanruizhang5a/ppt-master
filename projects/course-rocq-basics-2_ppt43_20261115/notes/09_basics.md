test_next_working_day, supplied proof, extraction purpose and trust, String import.

Source: Basics.v, lines 171–212; corresponding section in Basics.html.


(** Second, we can record what we _expect_ the result to be in the
    form of a Rocq "example": *)

Example test_next_working_day:
  (next_working_day (next_working_day saturday)) = tuesday.

(** This declaration does two things: it makes an assertion
    (that the second working day after [saturday] is [tuesday]), and it
    gives the assertion a name that can be used to refer to it later.
    Having made the assertion, we can also ask Rocq to _verify_ it, like
    this: *)

Proof. simpl. reflexivity.  Qed.

(** The details are not important just now, but essentially this
    little script can be read as "The assertion we've just made can be
    proved by observing that both sides of the equality evaluate to
    the same thing." *)

(** Third, we can ask Rocq to _extract_, from our [Definition], a
    program in a more conventional programming language (OCaml,
    Scheme, or Haskell) with a high-performance compiler.  This
    facility is very useful, since it gives us a path from
    proved-correct algorithms written in Gallina to efficient machine
    code.

    (Of course, we are trusting the correctness of the
    OCaml/Haskell/Scheme compiler, and of Rocq's extraction facility
    itself, but this is still a big step forward from the way most
    software is developed today!)

    Indeed, this is one of the main uses for which Rocq was developed.
    We'll come back to this topic in later chapters. *)

(** The [Require Export] statement on the next line tells Rocq to use
    the [String] module from the standard library.  We'll use strings
    for various things in later chapters, but we need to [Require] it here so
    that the grading scripts can use it for internal purposes. *)
From Stdlib Require Export String.

(* ================================================================= *)