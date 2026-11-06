(* Standalone verification for the confirmed 64-slide Basics teaching deck.
   Compiler: Rocq 9.1.0; no dependency on LF.Basics or its exercise holes.
   Source: projects/course-rocq/lf/Basics.v
   Source SHA256: cb21119b21292016b3d7f6e26d2a1786080b75d57553f88f932f7d943044c2e1
   Plan: projects/rocq_basics_20261106/deck_plan.md
   Plan SHA256: 3a28fc6f14bb28bd60e2482ca4c2c1aeb19d1b277dd6edacda3983bc609077ad

   Reproduce in a temporary directory containing a copy of this file:
     rocq compile -q -noglob verified_examples.v > verified_examples_output.txt
   The delivered output is exactly successful compilation stdout. Build products
   are confined to /tmp; original inputs and repository package files are immutable.

   Unmarked definitions reproduce the chapter. Completed exercise definitions
   and proofs are explicitly labeled WORKED SOLUTION. All proofs use only
   intros, simpl (including simpl in H), rewrite, destruct, and reflexivity,
   with bullets/braces. No induction or contradiction-solving tactic is needed.

   Naming and library distinctions for slides 15, 17, 33, 44, 54, 55, 61:
   - The outer VerifiedBasics module isolates this copy. A source name such as
     Basics.LateDays.lower_grade becomes
     verified_examples.VerifiedBasics.LateDays.lower_grade in an importing file.
   - bool/true/false/negb/andb/orb are chapter definitions. They are distinct
     from Datatypes.bool and its library operations. eqb/leb/ltb return the
     chapter bool; substituting Nat.eqb/Nat.leb/Nat.ltb changes that result type.
   - NatPlayground.nat/O/S/pred are a separate teaching datatype. After End,
     decimal numerals and nat/O/S/pred refer to the library natural numbers.
   - NatPlayground2.plus/mult/minus are demonstration copies; outside that
     module, plus/mult/minus resolve to Nat.add/Nat.mul/Nat.sub. Thus the
     chapter's mult_n_O and mult_n_Sm lemmas apply without any bridge proof.
   - In this installation the source lemma names are available unchanged:
       mult_n_O  : forall n, 0 = n * 0
       mult_n_Sm : forall n m, n * m + n = n * S m
     Both are deliberately oriented toward multiplication on their right.
     Nat.mul_0_r is not available from the source's String import alone.
   - plus_O_n uses the letter O, not decimal 0. mult_n_0_m_0 uses decimal 0.
   - LateDays.comparison/Eq/Lt/Gt are separate from Datatypes.comparison.
   - The one-step theorem is grade_lowered_once. The source exercise heading
     says graded_lowered_once, but that is not the declaration's identifier.
   - TuplePlayground.B0/B1 are nullary bit constructors; the binary B0/B1
     below take a bin argument. Binary Z is unrelated to an integer scope.
   - String is exported exactly as in the source for later course tooling.

   The false unconditional lower_letter claim is represented by a checked
   counterexample, not an incomplete declaration. The general binary increment
   correctness theorem belongs to later work and is not asserted here.
*)

From Stdlib Require Export String.

Module VerifiedBasics.

(* Slides 04-07: enumerated data, computation, types, checked examples. *)
Inductive day : Type :=
  | monday | tuesday | wednesday | thursday | friday | saturday | sunday.

Definition next_working_day (d : day) : day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday
  end.

Compute (next_working_day friday).
Compute (next_working_day (next_working_day saturday)).
Check next_working_day : day -> day.

Example test_next_working_day :
  next_working_day (next_working_day saturday) = tuesday.
Proof. simpl. reflexivity. Qed.

(* Slides 08-12: use the chapter's own boolean datatype. *)
Inductive bool : Type := true | false.

Definition negb (b : bool) : bool :=
  match b with true => false | false => true end.

Definition andb (b1 b2 : bool) : bool :=
  match b1 with true => b2 | false => false end.

Definition orb (b1 b2 : bool) : bool :=
  match b1 with true => true | false => b2 end.

Local Notation "x && y" := (andb x y).
Local Notation "x || y" := (orb x y).

Example test_orb1 : orb true false = true.
Proof. simpl. reflexivity. Qed.
Example test_orb2 : orb false false = false.
Proof. simpl. reflexivity. Qed.
Example test_orb3 : orb false true = true.
Proof. simpl. reflexivity. Qed.
Example test_orb4 : orb true true = true.
Proof. simpl. reflexivity. Qed.
Example test_orb5 : false || false || true = true.
Proof. simpl. reflexivity. Qed.

Definition negb' (b : bool) : bool :=
  if b then false else true.
Definition andb' (b1 b2 : bool) : bool :=
  if b1 then b2 else false.
Definition orb' (b1 b2 : bool) : bool :=
  if b1 then true else b2.

Inductive bw : Type := bw_black | bw_white.
Definition invert (x : bw) : bw :=
  if x then bw_white else bw_black.

Compute (negb true, negb false).
Compute (invert bw_black, invert bw_white).
Check true : bool.
Check negb : bool -> bool.
Check andb : bool -> bool -> bool.
Check (andb true) : bool -> bool.

(* WORKED SOLUTION: nandb and its complete two-input truth table. *)
Definition nandb (b1 b2 : bool) : bool := negb (andb b1 b2).

Example test_nandb1 : nandb true false = true.
Proof. reflexivity. Qed.
Example test_nandb2 : nandb false false = true.
Proof. reflexivity. Qed.
Example test_nandb3 : nandb false true = true.
Proof. reflexivity. Qed.
Example test_nandb4 : nandb true true = false.
Proof. reflexivity. Qed.

(* WORKED SOLUTION: andb3, the source tests, and the remaining four cases. *)
Definition andb3 (b1 b2 b3 : bool) : bool := andb b1 (andb b2 b3).

Example test_andb31 : andb3 true true true = true.
Proof. reflexivity. Qed.
Example test_andb32 : andb3 false true true = false.
Proof. reflexivity. Qed.
Example test_andb33 : andb3 true false true = false.
Proof. reflexivity. Qed.
Example test_andb34 : andb3 true true false = false.
Proof. reflexivity. Qed.
Example test_andb3_tff : andb3 true false false = false.
Proof. reflexivity. Qed.
Example test_andb3_ftf : andb3 false true false = false.
Proof. reflexivity. Qed.
Example test_andb3_fft : andb3 false false true = false.
Proof. reflexivity. Qed.
Example test_andb3_fff : andb3 false false false = false.
Proof. reflexivity. Qed.

(* Slides 13-16: constructor parameters, ordered patterns, modules, tuples. *)
Inductive rgb : Type := red | green | blue.
Inductive color : Type := black | white | primary (p : rgb).

Definition monochrome (c : color) : bool :=
  match c with
  | black => true
  | white => true
  | primary p => false
  end.

Definition isred (c : color) : bool :=
  match c with
  | black => false
  | white => false
  | primary red => true
  | primary _ => false
  end.

Check primary : rgb -> color.
Check (primary red) : color.
(* Intentionally invalid terms are comments, never presented as working code:
   red primary; true red; primary (primary red). *)
Compute (monochrome black, monochrome (primary red)).
Compute (isred (primary red), isred (primary blue)).

Module Playground.
  Definition foo : rgb := blue.
End Playground.
Definition foo : bool := true.
Check Playground.foo : rgb.
Check foo : bool.

Module TuplePlayground.
  Inductive bit : Type := B1 | B0.
  Inductive nybble : Type := bits (b0 b1 b2 b3 : bit).

  Definition all_zero (nb : nybble) : bool :=
    match nb with
    | bits B0 B0 B0 B0 => true
    | bits _ _ _ _ => false
    end.

  Check (bits B1 B0 B1 B0) : nybble.
  Compute (all_zero (bits B1 B0 B1 B0)).
  Compute (all_zero (bits B0 B0 B0 B0)).
End TuplePlayground.

(* Slides 17-18: the pedagogical nat is isolated from the library nat. *)
Module NatPlayground.
  Inductive nat : Type := O | S (n : nat).
  Inductive otherNat : Type := stop | tick (foo : otherNat).

  Definition pred (n : nat) : nat :=
    match n with O => O | S n' => n' end.

  Check S : nat -> nat.
  Compute (pred (S (S O))).
End NatPlayground.

Check (S (S (S (S O)))).
Check S : nat -> nat.
Check pred : nat -> nat.

Definition minustwo (n : nat) : nat :=
  match n with
  | O => O
  | S O => O
  | S (S n') => n'
  end.

Check minustwo : nat -> nat.
Compute (pred 0, pred 4).
Compute (minustwo 0, minustwo 1, minustwo 4).

(* Slides 19-23: recursive computations and isolated arithmetic copies. *)
Fixpoint even (n : nat) : bool :=
  match n with
  | O => true
  | S O => false
  | S (S n') => even n'
  end.
Definition odd (n : nat) : bool := negb (even n).

Example test_odd1 : odd 1 = true.
Proof. simpl. reflexivity. Qed.
Example test_odd2 : odd 4 = false.
Proof. simpl. reflexivity. Qed.
Compute (even 4, odd 4, odd 1).

Module NatPlayground2.
  Fixpoint plus (n m : nat) : nat :=
    match n with O => m | S n' => S (plus n' m) end.

  Fixpoint mult (n m : nat) : nat :=
    match n with O => O | S n' => plus m (mult n' m) end.

  Fixpoint minus (n m : nat) : nat :=
    match n, m with
    | O, _ => O
    | S _, O => n
    | S n', S m' => minus n' m'
    end.

  Compute (plus 3 2).
  Example test_mult1 : mult 3 3 = 9.
  Proof. simpl. reflexivity. Qed.
  Compute (mult 3 3).
  Compute (minus 2 5, minus 5 2).
End NatPlayground2.

Fixpoint exp (base power : nat) : nat :=
  match power with
  | O => S O
  | S p => mult base (exp base p)
  end.

(* WORKED SOLUTION: factorial. *)
Fixpoint factorial (n : nat) : nat :=
  match n with
  | O => 1
  | S n' => mult (S n') (factorial n')
  end.

Example test_factorial1 : factorial 3 = 6.
Proof. reflexivity. Qed.
Example test_factorial2 : factorial 5 = mult 10 12.
Proof. reflexivity. Qed.
Example test_factorial_zero : factorial 0 = 1.
Proof. reflexivity. Qed.
Compute (exp 2 3).
Compute (factorial 0, factorial 3, factorial 5).

Local Notation "x + y" := (plus x y)
  (at level 50, left associativity) : nat_scope.
Local Notation "x - y" := (minus x y)
  (at level 50, left associativity) : nat_scope.
Local Notation "x * y" := (mult x y)
  (at level 40, left associativity) : nat_scope.

(* Slides 24-28: comparisons return chapter booleans, equality is a Prop. *)
Fixpoint eqb (n m : nat) : bool :=
  match n with
  | O => match m with O => true | S m' => false end
  | S n' => match m with O => false | S m' => eqb n' m' end
  end.

Fixpoint leb (n m : nat) : bool :=
  match n with
  | O => true
  | S n' => match m with O => false | S m' => leb n' m' end
  end.

Local Notation "x =? y" := (eqb x y) (at level 70) : nat_scope.
Local Notation "x <=? y" := (leb x y) (at level 70) : nat_scope.

Example test_leb1 : leb 2 2 = true.
Proof. simpl. reflexivity. Qed.
Example test_leb2 : leb 2 4 = true.
Proof. simpl. reflexivity. Qed.
Example test_leb3 : leb 4 2 = false.
Proof. simpl. reflexivity. Qed.
Example test_leb3' : (4 <=? 2) = false.
Proof. simpl. reflexivity. Qed.

(* WORKED SOLUTION: strict comparison from one previously defined function. *)
Definition ltb (n m : nat) : bool := leb (S n) m.
Local Notation "x <? y" := (ltb x y) (at level 70) : nat_scope.

Example test_ltb1 : ltb 2 2 = false.
Proof. reflexivity. Qed.
Example test_ltb2 : ltb 2 4 = true.
Proof. reflexivity. Qed.
Example test_ltb3 : ltb 4 2 = false.
Proof. reflexivity. Qed.
Example test_ltb_zero : ltb 0 0 = false.
Proof. reflexivity. Qed.

Compute (2 =? 2, 2 =? 4).
Compute (2 <=? 2, 2 <=? 4, 4 <=? 2).
Compute (2 <? 2, 2 <? 4, 4 <? 2).
Check (2 =? 2) : bool.
Check (2 = 2) : Prop.
Check (1 + 2 * 3 * 4)%nat : nat.
Compute (1 + 2 * 3 * 4)%nat.

Fixpoint plus' (n m : nat) : nat :=
  match n with O => m | S n' => S (plus' n' m) end.
Compute (plus' 3 2).

(* Slides 29-34: simplification and rewriting, preserving source names. *)
Example plus_1_1 : 1 + 1 = 2.
Proof. simpl. reflexivity. Qed.

Theorem plus_O_n : forall n : nat, 0 + n = n.
Proof. intros n. simpl. reflexivity. Qed.
Theorem plus_O_n' : forall n : nat, 0 + n = n.
Proof. intros n. reflexivity. Qed.
Theorem plus_1_l : forall n : nat, 1 + n = S n.
Proof. intros n. reflexivity. Qed.
Theorem mult_0_l : forall n : nat, 0 * n = 0.
Proof. intros n. reflexivity. Qed.

Theorem plus_id_example : forall n m : nat,
  n = m -> n + n = m + m.
Proof.
  intros n m H.
  rewrite -> H.
  reflexivity.
Qed.

(* WORKED SOLUTION: chained equality proof. *)
Theorem plus_id_exercise : forall n m o : nat,
  n = m -> m = o -> n + m = m + o.
Proof.
  intros n m o Hnm Hmo.
  rewrite -> Hnm.
  rewrite -> Hmo.
  reflexivity.
Qed.

(* These are real library lemmas, not locally postulated helpers. *)
Check plus.
Check mult.
Check minus.
Check mult_n_O.
Check mult_n_Sm.
Print Assumptions mult_n_O.
Print Assumptions mult_n_Sm.

Theorem mult_n_0_m_0 : forall p q : nat,
  p * 0 + q * 0 = 0.
Proof.
  intros p q.
  rewrite <- mult_n_O.
  rewrite <- mult_n_O.
  reflexivity.
Qed.

(* WORKED SOLUTION: both library rewrites must be right to left. *)
Theorem mult_n_1 : forall p : nat, p * 1 = p.
Proof.
  intros p.
  rewrite <- mult_n_Sm.
  rewrite <- mult_n_O.
  reflexivity.
Qed.

(* Slides 35-40: only completed proofs appear in this verification file.
   The source's stuck simplification attempt is discussed as a failed attempt;
   the successful proof exposes n's constructor without using induction. *)
Theorem plus_1_neq_0 : forall n : nat, (n + 1) =? 0 = false.
Proof.
  intros n. destruct n as [| n'] eqn:E.
  - reflexivity.
  - reflexivity.
Qed.

Theorem negb_involutive : forall b : bool, negb (negb b) = b.
Proof.
  intros b. destruct b eqn:E.
  - reflexivity.
  - reflexivity.
Qed.

Theorem andb_commutative : forall b c, andb b c = andb c b.
Proof.
  intros b c. destruct b eqn:Eb.
  - destruct c eqn:Ec.
    + reflexivity.
    + reflexivity.
  - destruct c eqn:Ec.
    + reflexivity.
    + reflexivity.
Qed.

Theorem andb_commutative' : forall b c, andb b c = andb c b.
Proof.
  intros b c. destruct b eqn:Eb.
  { destruct c eqn:Ec.
    { reflexivity. }
    { reflexivity. } }
  { destruct c eqn:Ec.
    { reflexivity. }
    { reflexivity. } }
Qed.

Theorem andb3_exchange :
  forall b c d, andb (andb b c) d = andb (andb b d) c.
Proof.
  intros b c d. destruct b eqn:Eb.
  - destruct c eqn:Ec.
    { destruct d eqn:Ed.
      - reflexivity.
      - reflexivity. }
    { destruct d eqn:Ed.
      - reflexivity.
      - reflexivity. }
  - destruct c eqn:Ec.
    { destruct d eqn:Ed.
      - reflexivity.
      - reflexivity. }
    { destruct d eqn:Ed.
      - reflexivity.
      - reflexivity. }
Qed.

(* WORKED SOLUTION, slide 41: even a contradictory equality is used only
   by rewriting. No discriminate, inversion, exact, apply, or automation. *)
Theorem andb_true_elim2 : forall b c : bool,
  andb b c = true -> c = true.
Proof.
  intros b c H.
  destruct b.
  - simpl in H. rewrite -> H. reflexivity.
  - simpl in H. destruct c.
    + reflexivity.
    + rewrite -> H. reflexivity.
Qed.

Theorem plus_1_neq_0' : forall n : nat, (n + 1) =? 0 = false.
Proof.
  intros [| n].
  - reflexivity.
  - reflexivity.
Qed.

Theorem andb_commutative'' : forall b c, andb b c = andb c b.
Proof.
  intros [] [].
  - reflexivity.
  - reflexivity.
  - reflexivity.
  - reflexivity.
Qed.

(* WORKED SOLUTION, slide 43. *)
Theorem zero_nbeq_plus_1 : forall n : nat, 0 =? (n + 1) = false.
Proof.
  intros [| n].
  - reflexivity.
  - reflexivity.
Qed.

(* WORKED SOLUTION, slide 42: f is a value; H rewrites function applications. *)
Theorem identity_fn_applied_twice :
  forall f : bool -> bool,
    (forall x : bool, f x = x) ->
    forall b : bool, f (f b) = b.
Proof.
  intros f H b.
  rewrite -> H.
  rewrite -> H.
  reflexivity.
Qed.

(* WORKED SOLUTION: the source asks students to state this theorem too. *)
Theorem negation_fn_applied_twice :
  forall f : bool -> bool,
    (forall x : bool, f x = negb x) ->
    forall b : bool, f (f b) = b.
Proof.
  intros f H b.
  rewrite -> H.
  rewrite -> H.
  rewrite -> negb_involutive.
  reflexivity.
Qed.

(* WORKED SOLUTION: only one boolean needs case analysis. *)
Theorem andb_eq_orb : forall b c : bool,
  andb b c = orb b c -> b = c.
Proof.
  intros b c H.
  destruct b.
  - simpl in H. rewrite -> H. reflexivity.
  - simpl in H. rewrite <- H. reflexivity.
Qed.

(* Slides 44-54: the chapter's example policy, not an actual course policy. *)
Module LateDays.
  Inductive letter : Type := A | B | C | D | F.
  Inductive modifier : Type := Plus | Natural | Minus.
  Inductive grade : Type := Grade (l : letter) (m : modifier).
  Inductive comparison : Type := Eq | Lt | Gt.

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

  Compute (letter_comparison B A).
  Compute (letter_comparison D D).
  Compute (letter_comparison B F).

  (* WORKED SOLUTION: needed to simplify comparisons of a letter with itself. *)
  Theorem letter_comparison_Eq : forall l, letter_comparison l l = Eq.
  Proof.
    intros l. destruct l.
    - reflexivity.
    - reflexivity.
    - reflexivity.
    - reflexivity.
    - reflexivity.
  Qed.

  Definition modifier_comparison (m1 m2 : modifier) : comparison :=
    match m1, m2 with
    | Plus, Plus => Eq
    | Plus, _ => Gt
    | Natural, Plus => Lt
    | Natural, Natural => Eq
    | Natural, _ => Gt
    | Minus, (Plus | Natural) => Lt
    | Minus, Minus => Eq
    end.

  (* WORKED SOLUTION: lexicographic comparison, three letter-result cases. *)
  Definition grade_comparison (g1 g2 : grade) : comparison :=
    match g1, g2 with
    | Grade l1 m1, Grade l2 m2 =>
        match letter_comparison l1 l2 with
        | Eq => modifier_comparison m1 m2
        | Lt => Lt
        | Gt => Gt
        end
    end.

  Example test_grade_comparison1 :
    grade_comparison (Grade A Minus) (Grade B Plus) = Gt.
  Proof. reflexivity. Qed.
  Example test_grade_comparison2 :
    grade_comparison (Grade A Minus) (Grade A Plus) = Lt.
  Proof. reflexivity. Qed.
  Example test_grade_comparison3 :
    grade_comparison (Grade F Plus) (Grade F Plus) = Eq.
  Proof. reflexivity. Qed.
  Example test_grade_comparison4 :
    grade_comparison (Grade B Minus) (Grade C Plus) = Gt.
  Proof. reflexivity. Qed.
  Compute (grade_comparison (Grade A Minus) (Grade B Plus)).
  Compute (grade_comparison (Grade A Minus) (Grade A Plus)).
  Compute (grade_comparison (Grade F Plus) (Grade F Plus)).

  Definition lower_letter (l : letter) : letter :=
    match l with A => B | B => C | C => D | D => F | F => F end.

  Theorem lower_letter_F_is_F : lower_letter F = F.
  Proof. simpl. reflexivity. Qed.

  (* Checked counterexample to the source's deliberately failed first theorem. *)
  Example lower_letter_unconditional_counterexample :
    letter_comparison (lower_letter F) F = Eq.
  Proof. reflexivity. Qed.
  Compute (letter_comparison (lower_letter F) F).

  (* WORKED SOLUTION: preserve the corrected source precondition exactly. *)
  Theorem lower_letter_lowers : forall l : letter,
    letter_comparison F l = Lt ->
    letter_comparison (lower_letter l) l = Lt.
  Proof.
    intros l H. destruct l.
    - reflexivity.
    - reflexivity.
    - reflexivity.
    - reflexivity.
    - simpl in H. simpl. rewrite -> H. reflexivity.
  Qed.

  (* WORKED SOLUTION: modifier changes first; only Minus needs letter cases.
     In particular, F Minus must not wrap around to F Plus. *)
  Definition lower_grade (g : grade) : grade :=
    match g with
    | Grade l Plus => Grade l Natural
    | Grade l Natural => Grade l Minus
    | Grade l Minus =>
        match l with F => Grade F Minus | _ => Grade (lower_letter l) Plus end
    end.

  Example lower_grade_A_Plus : lower_grade (Grade A Plus) = Grade A Natural.
  Proof. reflexivity. Qed.
  Example lower_grade_A_Natural : lower_grade (Grade A Natural) = Grade A Minus.
  Proof. reflexivity. Qed.
  Example lower_grade_A_Minus : lower_grade (Grade A Minus) = Grade B Plus.
  Proof. reflexivity. Qed.
  Example lower_grade_B_Plus : lower_grade (Grade B Plus) = Grade B Natural.
  Proof. reflexivity. Qed.
  Example lower_grade_F_Natural : lower_grade (Grade F Natural) = Grade F Minus.
  Proof. reflexivity. Qed.
  Example lower_grade_twice :
    lower_grade (lower_grade (Grade B Minus)) = Grade C Natural.
  Proof. reflexivity. Qed.
  Example lower_grade_thrice :
    lower_grade (lower_grade (lower_grade (Grade B Minus))) = Grade C Minus.
  Proof. reflexivity. Qed.
  Theorem lower_grade_F_Minus : lower_grade (Grade F Minus) = Grade F Minus.
  Proof. reflexivity. Qed.

  (* WORKED SOLUTION: destruct a letter only in the Minus case. The other
     modifiers use letter_comparison_Eq, without enumerating all 15 grades. *)
  Theorem lower_grade_lowers : forall g : grade,
    grade_comparison (Grade F Minus) g = Lt ->
    grade_comparison (lower_grade g) g = Lt.
  Proof.
    intros [l m] H. destruct m.
    - simpl. rewrite -> letter_comparison_Eq. reflexivity.
    - simpl. rewrite -> letter_comparison_Eq. reflexivity.
    - destruct l.
      + reflexivity.
      + reflexivity.
      + reflexivity.
      + reflexivity.
      + rewrite -> lower_grade_F_Minus. rewrite -> H. reflexivity.
  Qed.

  Compute (lower_grade (Grade A Plus), lower_grade (Grade A Natural)).
  Compute (lower_grade (Grade A Minus), lower_grade (Grade F Minus)).
  Compute (lower_grade (lower_grade (Grade B Minus))).
  Compute (lower_grade (lower_grade (lower_grade (Grade B Minus)))).

  Definition apply_late_policy (late_days : nat) (g : grade) : grade :=
    if late_days <? 9 then g
    else if late_days <? 17 then lower_grade g
    else if late_days <? 21 then lower_grade (lower_grade g)
    else lower_grade (lower_grade (lower_grade g)).

  Theorem apply_late_policy_unfold : forall (late_days : nat) (g : grade),
    apply_late_policy late_days g =
    (if late_days <? 9 then g
     else if late_days <? 17 then lower_grade g
     else if late_days <? 21 then lower_grade (lower_grade g)
     else lower_grade (lower_grade (lower_grade g))).
  Proof. intros. reflexivity. Qed.

  (* WORKED SOLUTION: expose the definition by rewriting a proved equality. *)
  Theorem no_penalty_for_mostly_on_time :
    forall (late_days : nat) (g : grade),
      (late_days <? 9 = true) -> apply_late_policy late_days g = g.
  Proof.
    intros late_days g H.
    rewrite -> apply_late_policy_unfold.
    rewrite -> H.
    reflexivity.
  Qed.

  (* WORKED SOLUTION: source theorem name has grade_, not graded_. *)
  Theorem grade_lowered_once : forall (late_days : nat) (g : grade),
    (late_days <? 9 = false) ->
    (late_days <? 17 = true) ->
    apply_late_policy late_days g = lower_grade g.
  Proof.
    intros late_days g H9 H17.
    rewrite -> apply_late_policy_unfold.
    rewrite -> H9.
    rewrite -> H17.
    reflexivity.
  Qed.

  (* Slide 52: each output carries its day label. Starting at A Plus makes
     all four policy bands observable: A Plus, A Natural, A Minus, B Plus. *)
  Compute (8, apply_late_policy 8 (Grade A Plus)).
  Compute (9, apply_late_policy 9 (Grade A Plus)).
  Compute (16, apply_late_policy 16 (Grade A Plus)).
  Compute (17, apply_late_policy 17 (Grade A Plus)).
  Compute (20, apply_late_policy 20 (Grade A Plus)).
  Compute (21, apply_late_policy 21 (Grade A Plus)).

  Example late_boundary_8 : apply_late_policy 8 (Grade A Plus) = Grade A Plus.
  Proof. reflexivity. Qed.
  Example late_boundary_9 : apply_late_policy 9 (Grade A Plus) = Grade A Natural.
  Proof. reflexivity. Qed.
  Example late_boundary_16 : apply_late_policy 16 (Grade A Plus) = Grade A Natural.
  Proof. reflexivity. Qed.
  Example late_boundary_17 : apply_late_policy 17 (Grade A Plus) = Grade A Minus.
  Proof. reflexivity. Qed.
  Example late_boundary_20 : apply_late_policy 20 (Grade A Plus) = Grade A Minus.
  Proof. reflexivity. Qed.
  Example late_boundary_21 : apply_late_policy 21 (Grade A Plus) = Grade B Plus.
  Proof. reflexivity. Qed.

  (* Additional zero-day and saturation checks guard the two edge cases. *)
  Example late_boundary_0 : apply_late_policy 0 (Grade A Plus) = Grade A Plus.
  Proof. reflexivity. Qed.
  Example late_saturates : apply_late_policy 21 (Grade F Natural) = Grade F Minus.
  Proof. reflexivity. Qed.
  Compute (21, apply_late_policy 21 (Grade F Natural)).
End LateDays.

(* Slides 55-59: B0 and B1 contain the remaining, more significant bits. *)
Inductive bin : Type := Z | B0 (n : bin) | B1 (n : bin).

(* WORKED SOLUTION: propagate carry only through a one bit. *)
Fixpoint incr (m : bin) : bin :=
  match m with
  | Z => B1 Z
  | B0 n => B1 n
  | B1 n => B0 (incr n)
  end.

(* WORKED SOLUTION: outer constructor is the least significant bit. *)
Fixpoint bin_to_nat (m : bin) : nat :=
  match m with
  | Z => 0
  | B0 n => 2 * bin_to_nat n
  | B1 n => 1 + 2 * bin_to_nat n
  end.

Example test_bin_incr1 : incr (B1 Z) = B0 (B1 Z).
Proof. reflexivity. Qed.
Example test_bin_incr2 : incr (B0 (B1 Z)) = B1 (B1 Z).
Proof. reflexivity. Qed.
Example test_bin_incr3 : incr (B1 (B1 Z)) = B0 (B0 (B1 Z)).
Proof. reflexivity. Qed.
Example test_bin_incr4 : bin_to_nat (B0 (B1 Z)) = 2.
Proof. reflexivity. Qed.
Example test_bin_incr5 :
  bin_to_nat (incr (B1 Z)) = 1 + bin_to_nat (B1 Z).
Proof. reflexivity. Qed.
Example test_bin_incr6 :
  bin_to_nat (incr (incr (B1 Z))) = 2 + bin_to_nat (B1 Z).
Proof. reflexivity. Qed.
Example test_bin_incr7 : bin_to_nat (B0 (B0 (B0 (B1 Z)))) = 8.
Proof. reflexivity. Qed.

Example test_bin_zero : bin_to_nat Z = 0.
Proof. reflexivity. Qed.
Example test_bin_noncanonical_zero : bin_to_nat (B0 Z) = 0.
Proof. reflexivity. Qed.
Example test_bin_incr_zero : incr Z = B1 Z.
Proof. reflexivity. Qed.
Example test_bin_incr_noncanonical_zero : incr (B0 Z) = B1 Z.
Proof. reflexivity. Qed.
Example test_bin_long_carry :
  incr (B1 (B1 (B1 Z))) = B0 (B0 (B0 (B1 Z))).
Proof. reflexivity. Qed.

Compute (incr Z).
Compute (incr (B1 Z)).
Compute (incr (B0 (B1 Z))).
Compute (incr (B1 (B1 Z))).
Compute (incr (B1 (B1 (B1 Z)))).
Compute (bin_to_nat Z, bin_to_nat (B0 Z)).
Compute (bin_to_nat (B0 (B1 Z))).
Compute (bin_to_nat (B0 (B0 (B0 (B1 Z))))).
Compute (bin_to_nat (incr (B1 Z))).
Compute (bin_to_nat (incr (incr (B1 Z)))).
Compute (bin_to_nat (incr (B1 (B1 (B1 Z))))).

End VerifiedBasics.

(* ASSUMPTION AUDIT: generated below from every Definition, Fixpoint,
   Example, Theorem, and Lemma in the VerifiedBasics module tree.
   Each Check identifies the next Print Assumptions result. A successful
   audit must report "Closed under the global context" for every entry. *)
Check VerifiedBasics.next_working_day.
Print Assumptions VerifiedBasics.next_working_day.
Check VerifiedBasics.test_next_working_day.
Print Assumptions VerifiedBasics.test_next_working_day.
Check VerifiedBasics.negb.
Print Assumptions VerifiedBasics.negb.
Check VerifiedBasics.andb.
Print Assumptions VerifiedBasics.andb.
Check VerifiedBasics.orb.
Print Assumptions VerifiedBasics.orb.
Check VerifiedBasics.test_orb1.
Print Assumptions VerifiedBasics.test_orb1.
Check VerifiedBasics.test_orb2.
Print Assumptions VerifiedBasics.test_orb2.
Check VerifiedBasics.test_orb3.
Print Assumptions VerifiedBasics.test_orb3.
Check VerifiedBasics.test_orb4.
Print Assumptions VerifiedBasics.test_orb4.
Check VerifiedBasics.test_orb5.
Print Assumptions VerifiedBasics.test_orb5.
Check VerifiedBasics.negb'.
Print Assumptions VerifiedBasics.negb'.
Check VerifiedBasics.andb'.
Print Assumptions VerifiedBasics.andb'.
Check VerifiedBasics.orb'.
Print Assumptions VerifiedBasics.orb'.
Check VerifiedBasics.invert.
Print Assumptions VerifiedBasics.invert.
Check VerifiedBasics.nandb.
Print Assumptions VerifiedBasics.nandb.
Check VerifiedBasics.test_nandb1.
Print Assumptions VerifiedBasics.test_nandb1.
Check VerifiedBasics.test_nandb2.
Print Assumptions VerifiedBasics.test_nandb2.
Check VerifiedBasics.test_nandb3.
Print Assumptions VerifiedBasics.test_nandb3.
Check VerifiedBasics.test_nandb4.
Print Assumptions VerifiedBasics.test_nandb4.
Check VerifiedBasics.andb3.
Print Assumptions VerifiedBasics.andb3.
Check VerifiedBasics.test_andb31.
Print Assumptions VerifiedBasics.test_andb31.
Check VerifiedBasics.test_andb32.
Print Assumptions VerifiedBasics.test_andb32.
Check VerifiedBasics.test_andb33.
Print Assumptions VerifiedBasics.test_andb33.
Check VerifiedBasics.test_andb34.
Print Assumptions VerifiedBasics.test_andb34.
Check VerifiedBasics.test_andb3_tff.
Print Assumptions VerifiedBasics.test_andb3_tff.
Check VerifiedBasics.test_andb3_ftf.
Print Assumptions VerifiedBasics.test_andb3_ftf.
Check VerifiedBasics.test_andb3_fft.
Print Assumptions VerifiedBasics.test_andb3_fft.
Check VerifiedBasics.test_andb3_fff.
Print Assumptions VerifiedBasics.test_andb3_fff.
Check VerifiedBasics.monochrome.
Print Assumptions VerifiedBasics.monochrome.
Check VerifiedBasics.isred.
Print Assumptions VerifiedBasics.isred.
Check VerifiedBasics.Playground.foo.
Print Assumptions VerifiedBasics.Playground.foo.
Check VerifiedBasics.foo.
Print Assumptions VerifiedBasics.foo.
Check VerifiedBasics.TuplePlayground.all_zero.
Print Assumptions VerifiedBasics.TuplePlayground.all_zero.
Check VerifiedBasics.NatPlayground.pred.
Print Assumptions VerifiedBasics.NatPlayground.pred.
Check VerifiedBasics.minustwo.
Print Assumptions VerifiedBasics.minustwo.
Check VerifiedBasics.even.
Print Assumptions VerifiedBasics.even.
Check VerifiedBasics.odd.
Print Assumptions VerifiedBasics.odd.
Check VerifiedBasics.test_odd1.
Print Assumptions VerifiedBasics.test_odd1.
Check VerifiedBasics.test_odd2.
Print Assumptions VerifiedBasics.test_odd2.
Check VerifiedBasics.NatPlayground2.plus.
Print Assumptions VerifiedBasics.NatPlayground2.plus.
Check VerifiedBasics.NatPlayground2.mult.
Print Assumptions VerifiedBasics.NatPlayground2.mult.
Check VerifiedBasics.NatPlayground2.minus.
Print Assumptions VerifiedBasics.NatPlayground2.minus.
Check VerifiedBasics.NatPlayground2.test_mult1.
Print Assumptions VerifiedBasics.NatPlayground2.test_mult1.
Check VerifiedBasics.exp.
Print Assumptions VerifiedBasics.exp.
Check VerifiedBasics.factorial.
Print Assumptions VerifiedBasics.factorial.
Check VerifiedBasics.test_factorial1.
Print Assumptions VerifiedBasics.test_factorial1.
Check VerifiedBasics.test_factorial2.
Print Assumptions VerifiedBasics.test_factorial2.
Check VerifiedBasics.test_factorial_zero.
Print Assumptions VerifiedBasics.test_factorial_zero.
Check VerifiedBasics.eqb.
Print Assumptions VerifiedBasics.eqb.
Check VerifiedBasics.leb.
Print Assumptions VerifiedBasics.leb.
Check VerifiedBasics.test_leb1.
Print Assumptions VerifiedBasics.test_leb1.
Check VerifiedBasics.test_leb2.
Print Assumptions VerifiedBasics.test_leb2.
Check VerifiedBasics.test_leb3.
Print Assumptions VerifiedBasics.test_leb3.
Check VerifiedBasics.test_leb3'.
Print Assumptions VerifiedBasics.test_leb3'.
Check VerifiedBasics.ltb.
Print Assumptions VerifiedBasics.ltb.
Check VerifiedBasics.test_ltb1.
Print Assumptions VerifiedBasics.test_ltb1.
Check VerifiedBasics.test_ltb2.
Print Assumptions VerifiedBasics.test_ltb2.
Check VerifiedBasics.test_ltb3.
Print Assumptions VerifiedBasics.test_ltb3.
Check VerifiedBasics.test_ltb_zero.
Print Assumptions VerifiedBasics.test_ltb_zero.
Check VerifiedBasics.plus'.
Print Assumptions VerifiedBasics.plus'.
Check VerifiedBasics.plus_1_1.
Print Assumptions VerifiedBasics.plus_1_1.
Check VerifiedBasics.plus_O_n.
Print Assumptions VerifiedBasics.plus_O_n.
Check VerifiedBasics.plus_O_n'.
Print Assumptions VerifiedBasics.plus_O_n'.
Check VerifiedBasics.plus_1_l.
Print Assumptions VerifiedBasics.plus_1_l.
Check VerifiedBasics.mult_0_l.
Print Assumptions VerifiedBasics.mult_0_l.
Check VerifiedBasics.plus_id_example.
Print Assumptions VerifiedBasics.plus_id_example.
Check VerifiedBasics.plus_id_exercise.
Print Assumptions VerifiedBasics.plus_id_exercise.
Check VerifiedBasics.mult_n_0_m_0.
Print Assumptions VerifiedBasics.mult_n_0_m_0.
Check VerifiedBasics.mult_n_1.
Print Assumptions VerifiedBasics.mult_n_1.
Check VerifiedBasics.plus_1_neq_0.
Print Assumptions VerifiedBasics.plus_1_neq_0.
Check VerifiedBasics.negb_involutive.
Print Assumptions VerifiedBasics.negb_involutive.
Check VerifiedBasics.andb_commutative.
Print Assumptions VerifiedBasics.andb_commutative.
Check VerifiedBasics.andb_commutative'.
Print Assumptions VerifiedBasics.andb_commutative'.
Check VerifiedBasics.andb3_exchange.
Print Assumptions VerifiedBasics.andb3_exchange.
Check VerifiedBasics.andb_true_elim2.
Print Assumptions VerifiedBasics.andb_true_elim2.
Check VerifiedBasics.plus_1_neq_0'.
Print Assumptions VerifiedBasics.plus_1_neq_0'.
Check VerifiedBasics.andb_commutative''.
Print Assumptions VerifiedBasics.andb_commutative''.
Check VerifiedBasics.zero_nbeq_plus_1.
Print Assumptions VerifiedBasics.zero_nbeq_plus_1.
Check VerifiedBasics.identity_fn_applied_twice.
Print Assumptions VerifiedBasics.identity_fn_applied_twice.
Check VerifiedBasics.negation_fn_applied_twice.
Print Assumptions VerifiedBasics.negation_fn_applied_twice.
Check VerifiedBasics.andb_eq_orb.
Print Assumptions VerifiedBasics.andb_eq_orb.
Check VerifiedBasics.LateDays.letter_comparison.
Print Assumptions VerifiedBasics.LateDays.letter_comparison.
Check VerifiedBasics.LateDays.letter_comparison_Eq.
Print Assumptions VerifiedBasics.LateDays.letter_comparison_Eq.
Check VerifiedBasics.LateDays.modifier_comparison.
Print Assumptions VerifiedBasics.LateDays.modifier_comparison.
Check VerifiedBasics.LateDays.grade_comparison.
Print Assumptions VerifiedBasics.LateDays.grade_comparison.
Check VerifiedBasics.LateDays.test_grade_comparison1.
Print Assumptions VerifiedBasics.LateDays.test_grade_comparison1.
Check VerifiedBasics.LateDays.test_grade_comparison2.
Print Assumptions VerifiedBasics.LateDays.test_grade_comparison2.
Check VerifiedBasics.LateDays.test_grade_comparison3.
Print Assumptions VerifiedBasics.LateDays.test_grade_comparison3.
Check VerifiedBasics.LateDays.test_grade_comparison4.
Print Assumptions VerifiedBasics.LateDays.test_grade_comparison4.
Check VerifiedBasics.LateDays.lower_letter.
Print Assumptions VerifiedBasics.LateDays.lower_letter.
Check VerifiedBasics.LateDays.lower_letter_F_is_F.
Print Assumptions VerifiedBasics.LateDays.lower_letter_F_is_F.
Check VerifiedBasics.LateDays.lower_letter_unconditional_counterexample.
Print Assumptions VerifiedBasics.LateDays.lower_letter_unconditional_counterexample.
Check VerifiedBasics.LateDays.lower_letter_lowers.
Print Assumptions VerifiedBasics.LateDays.lower_letter_lowers.
Check VerifiedBasics.LateDays.lower_grade.
Print Assumptions VerifiedBasics.LateDays.lower_grade.
Check VerifiedBasics.LateDays.lower_grade_A_Plus.
Print Assumptions VerifiedBasics.LateDays.lower_grade_A_Plus.
Check VerifiedBasics.LateDays.lower_grade_A_Natural.
Print Assumptions VerifiedBasics.LateDays.lower_grade_A_Natural.
Check VerifiedBasics.LateDays.lower_grade_A_Minus.
Print Assumptions VerifiedBasics.LateDays.lower_grade_A_Minus.
Check VerifiedBasics.LateDays.lower_grade_B_Plus.
Print Assumptions VerifiedBasics.LateDays.lower_grade_B_Plus.
Check VerifiedBasics.LateDays.lower_grade_F_Natural.
Print Assumptions VerifiedBasics.LateDays.lower_grade_F_Natural.
Check VerifiedBasics.LateDays.lower_grade_twice.
Print Assumptions VerifiedBasics.LateDays.lower_grade_twice.
Check VerifiedBasics.LateDays.lower_grade_thrice.
Print Assumptions VerifiedBasics.LateDays.lower_grade_thrice.
Check VerifiedBasics.LateDays.lower_grade_F_Minus.
Print Assumptions VerifiedBasics.LateDays.lower_grade_F_Minus.
Check VerifiedBasics.LateDays.lower_grade_lowers.
Print Assumptions VerifiedBasics.LateDays.lower_grade_lowers.
Check VerifiedBasics.LateDays.apply_late_policy.
Print Assumptions VerifiedBasics.LateDays.apply_late_policy.
Check VerifiedBasics.LateDays.apply_late_policy_unfold.
Print Assumptions VerifiedBasics.LateDays.apply_late_policy_unfold.
Check VerifiedBasics.LateDays.no_penalty_for_mostly_on_time.
Print Assumptions VerifiedBasics.LateDays.no_penalty_for_mostly_on_time.
Check VerifiedBasics.LateDays.grade_lowered_once.
Print Assumptions VerifiedBasics.LateDays.grade_lowered_once.
Check VerifiedBasics.LateDays.late_boundary_8.
Print Assumptions VerifiedBasics.LateDays.late_boundary_8.
Check VerifiedBasics.LateDays.late_boundary_9.
Print Assumptions VerifiedBasics.LateDays.late_boundary_9.
Check VerifiedBasics.LateDays.late_boundary_16.
Print Assumptions VerifiedBasics.LateDays.late_boundary_16.
Check VerifiedBasics.LateDays.late_boundary_17.
Print Assumptions VerifiedBasics.LateDays.late_boundary_17.
Check VerifiedBasics.LateDays.late_boundary_20.
Print Assumptions VerifiedBasics.LateDays.late_boundary_20.
Check VerifiedBasics.LateDays.late_boundary_21.
Print Assumptions VerifiedBasics.LateDays.late_boundary_21.
Check VerifiedBasics.LateDays.late_boundary_0.
Print Assumptions VerifiedBasics.LateDays.late_boundary_0.
Check VerifiedBasics.LateDays.late_saturates.
Print Assumptions VerifiedBasics.LateDays.late_saturates.
Check VerifiedBasics.incr.
Print Assumptions VerifiedBasics.incr.
Check VerifiedBasics.bin_to_nat.
Print Assumptions VerifiedBasics.bin_to_nat.
Check VerifiedBasics.test_bin_incr1.
Print Assumptions VerifiedBasics.test_bin_incr1.
Check VerifiedBasics.test_bin_incr2.
Print Assumptions VerifiedBasics.test_bin_incr2.
Check VerifiedBasics.test_bin_incr3.
Print Assumptions VerifiedBasics.test_bin_incr3.
Check VerifiedBasics.test_bin_incr4.
Print Assumptions VerifiedBasics.test_bin_incr4.
Check VerifiedBasics.test_bin_incr5.
Print Assumptions VerifiedBasics.test_bin_incr5.
Check VerifiedBasics.test_bin_incr6.
Print Assumptions VerifiedBasics.test_bin_incr6.
Check VerifiedBasics.test_bin_incr7.
Print Assumptions VerifiedBasics.test_bin_incr7.
Check VerifiedBasics.test_bin_zero.
Print Assumptions VerifiedBasics.test_bin_zero.
Check VerifiedBasics.test_bin_noncanonical_zero.
Print Assumptions VerifiedBasics.test_bin_noncanonical_zero.
Check VerifiedBasics.test_bin_incr_zero.
Print Assumptions VerifiedBasics.test_bin_incr_zero.
Check VerifiedBasics.test_bin_incr_noncanonical_zero.
Print Assumptions VerifiedBasics.test_bin_incr_noncanonical_zero.
Check VerifiedBasics.test_bin_long_carry.
Print Assumptions VerifiedBasics.test_bin_long_carry.
