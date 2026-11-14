bw and invert, both Compute commands and results.

Source: Basics.v, lines 309–327; corresponding section in Basics.html.

(** For example we can define the following datatype [bw], with
    two constructors representing black ([b]) and white ([w]) and
    define a function [invert] that inverts values of this type using
    a conditional. *)

Inductive bw : Type :=
  | bw_black
  | bw_white.

Definition invert (x: bw) : bw :=
  if x then bw_white
  else bw_black.

Compute (invert bw_black).
(* ==> bw_white : bw *)

Compute (invert bw_white).
(* ==> bw_black : bw *)