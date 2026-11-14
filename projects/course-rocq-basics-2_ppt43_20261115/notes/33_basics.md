Exact nested matches in eqb; boolean result.

Source: Basics.v, lines 852–875; corresponding section in Basics.html.

    accept [x + y] in place of [plus x y] and, conversely, to its
    pretty-printer to display [plus x y] as [x + y]. *)

(** When we say that Rocq comes with almost nothing built-in, we really
    mean it: even testing equality is a user-defined operation!
    Here is a function [eqb] that tests natural numbers for
    [eq]uality, yielding a [b]oolean.  Note the use of nested
    [match]es -- we could also have used a simultaneous match, as
    in [minus]. *)

Fixpoint eqb (n m : nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => eqb n' m'
            end
  end.

(** Similarly, the [leb] function tests whether its first argument is
    less than or equal to its second argument, yielding a boolean. *)