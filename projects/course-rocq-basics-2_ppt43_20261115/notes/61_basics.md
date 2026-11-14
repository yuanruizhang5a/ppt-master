Exact letter_comparison definition; all three Compute examples and results.

Source: Basics.v, lines 1597–1625; corresponding section in Basics.html.

Definition letter_comparison (l1 l2 : letter) : comparison :=
  match l1, l2 with
  | A, A => Eq
  | A, _ => Gt
  | B, A => Lt
  | B, B => Eq
  | B, _ => Gt
  | C, (A | B) => Lt
  | C, C => Eq
  | C, _ => Gt
  | D, (A | B | C) => Lt
  | D, D => Eq
  | D, _ => Gt
  | F, (A | B | C | D) => Lt
  | F, F => Eq
  end.

(** We can test the [letter_comparison] operation by trying it out on a few
    examples. *)
Compute letter_comparison B A.
(** ==> Lt *)
Compute letter_comparison D D.
(** ==> Eq *)
Compute letter_comparison B F.
(** ==> Gt *)

(** As a further sanity check, we can prove that the
    [letter_comparison] function does indeed give the result [Eq] when
    comparing a letter [l] against itself.  *)