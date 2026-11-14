bool, negb, andb, orb; two arguments and matching definitions.

Source: Basics.v, lines 213–250; corresponding section in Basics.html.

(** ** Booleans *)

(** Following the pattern of the days of the week above, we can
    define the standard type [bool] of booleans, with members [true]
    and [false]. *)

Inductive bool : Type :=
  | true
  | false.

(** Functions over booleans can be defined in the same way as
    above: *)

Definition negb (b:bool) : bool :=
  match b with
  | true => false
  | false => true
  end.

Definition andb (b1:bool) (b2:bool) : bool :=
  match b1 with
  | true => b2
  | false => false
  end.

Definition orb (b1:bool) (b2:bool) : bool :=
  match b1 with
  | true => true
  | false => b2
  end.

(** (Although we are rolling our own booleans here for the sake
    of building up everything from scratch, Rocq does, of course,
    provide a default implementation of the booleans, together with a
    multitude of useful functions and lemmas.  Wherever possible,
    we've named our own definitions and theorems to match the ones in
    the standard library.) *)