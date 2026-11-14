plus_1_1 and plus_O_n with supplied proofs; general versus concrete claims.

Source: Basics.v, lines 934–964; corresponding section in Basics.html.

(** * Proof by Simplification *)

(** Now that we've looked at a few datatypes and functions,
    let's turn to stating and proving properties of their behavior.

    Actually, we've already started doing this: each [Example] in the
    previous sections made a precise claim about the behavior of some
    function on some particular inputs.  The proofs of these claims
    were always the same: use [simpl] to simplify both sides of the
    equation, then use [reflexivity] to check that both sides contain
    identical values.
 *)
Example plus_1_1 : 1 + 1 = 2.
Proof. simpl. reflexivity. Qed.

(**   The same sort of "proof by simplification" can also be used to
    establish more interesting properties.  For example, the
    fact that [0] is a "neutral element" for [+] on the left can be
    proved just by observing that [0 + n] reduces to [n] no matter
    what [n] is -- a fact that can be read off directly from the
    definition of [plus]. *)

Theorem plus_O_n : forall n : nat, 0 + n = n.
Proof.
  intros n. simpl. reflexivity.  Qed.

(** (You may notice that the above statement looks different if
    you look at the [.v] file in your IDE than it does if you view the
    HTML rendition in your browser. In [.v] files, we write the
    universal quantifier [forall] using the reserved identifier
    "forall."  When the [.v] files are converted to HTML, this gets