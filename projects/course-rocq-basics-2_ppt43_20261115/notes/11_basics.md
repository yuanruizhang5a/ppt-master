All five orb tests and proofs; && and || notation; bracket conventions in comments versus HTML.

Source: Basics.v, lines 251–281; corresponding section in Basics.html.

(** The last two of these illustrate Rocq's syntax for
    multi-argument function definitions.  The corresponding
    multi-argument _application_ syntax is illustrated by the
    following "unit tests," which constitute a complete specification
    -- a truth table -- for the [orb] function: *)

Example test_orb1:  (orb true  false) = true.
Proof. simpl. reflexivity.  Qed.
Example test_orb2:  (orb false false) = false.
Proof. simpl. reflexivity.  Qed.
Example test_orb3:  (orb false true)  = true.
Proof. simpl. reflexivity.  Qed.
Example test_orb4:  (orb true  true)  = true.
Proof. simpl. reflexivity.  Qed.

(** We can also introduce more familiar and readable infix
    syntax for the boolean operations we have just defined. The
    [Notation] command defines a new symbolic notation for an existing
    definition. *)

Notation "x && y" := (andb x y).
Notation "x || y" := (orb x y).

Example test_orb5:  false || false || true = true.
Proof. simpl. reflexivity. Qed.

(** _A note on notation_: In [.v] files, we use square brackets
    to delimit fragments of Rocq code within comments; this
    convention, also used by the [rocq doc] documentation tool, keeps
    them visually separate from the surrounding text.  In the HTML
    version of the files, these pieces of text appear in a different