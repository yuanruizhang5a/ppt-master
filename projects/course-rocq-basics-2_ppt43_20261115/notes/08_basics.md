The two source Compute commands and their reported results.

Source: Basics.v, lines 155–170; corresponding section in Basics.html.

    some examples.  There are actually three different ways to do
    examples in Rocq.  First, we can use the command [Compute] to
    evaluate a compound expression involving [next_working_day]. *)

Compute (next_working_day friday).
(* ==> monday : day *)

Compute (next_working_day (next_working_day saturday)).
(* ==> tuesday : day *)

(** (We show Rocq's responses in comments; if you have a computer
    handy, this would be an excellent moment to fire up the Rocq
    interpreter under your favorite IDE (see the [Preface] for
    installation instructions) and try it for yourself.  Load this
    file, [Basics.v], from the book's Rocq sources, find the above
    example, submit it to Rocq, and observe the result.) *)