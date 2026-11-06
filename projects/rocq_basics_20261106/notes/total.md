# 01_cover

This lesson introduces functional programming in Rocq through the Basics chapter of Logical Foundations. We will define data, write computations over that data, and prove properties of those computations. The opening example asks for the next working day after Friday and computes Monday. Keep the distinction between a program, its result, and a claim about its behavior in mind throughout the lecture.

---

# 02_learning_map

We begin with the shapes of data: constructors, patterns, modules, and tuples. Then we add recursion over natural numbers and use it for arithmetic and comparison. The proof section develops simplification, rewriting, and case analysis in that order. Finally, the grading-policy and binary examples combine the same skills in larger models. Successful learning means being able to read a definition, predict its result, and explain which proof obligation remains after testing.

---

# 03_functional_style

A pure function can be understood as a mapping from inputs to outputs, without reasoning about hidden changes to state. This connection to mathematical functions makes both informal reasoning and formal proofs more direct. Functions are also first-class values: they can be passed, returned, and stored. Gallina provides algebraic data types, pattern matching, and polymorphic types. In this chapter, Gallina defines our programs, while tactics guide the proofs about them.

---

# 04_days

The Inductive declaration introduces a type called day and seven constructors belonging to it. Each constructor here takes no arguments, so the complete set of day values is explicitly enumerated. The period terminates the declaration. Checking monday reports that it has type day. Although the standard library already provides many familiar data types, rebuilding small examples makes the underlying mechanism visible.

---

# 05_working_day

The function header says that next_working_day consumes a day and returns a day. Its match expression supplies a branch for every constructor. Friday, Saturday, and Sunday all lead to Monday; applying the function again after Saturday therefore gives Tuesday. Function application uses spaces rather than a comma-separated argument list. Ask students to predict the result for Thursday and for two successive applications starting at Friday.

---

# 06_commands

Compute evaluates an expression and displays its value and type. Check reports an expression's type; checking next_working_day describes a function from days to days. Example introduces a named proposition, such as the claim that the next working day after Friday is Monday. Declaring that proposition creates a proof obligation. Computing an answer and stating a claim are related activities, but they are different commands with different purposes.

---

# 07_example_proof

The example asserts that two applications of next_working_day to Saturday yield Tuesday. Simplification exposes the common computed value, and reflexivity finishes the equality. Qed closes the checked proof. The chapter also points toward extraction: a Gallina program can become OCaml, Haskell, or Scheme code for compiled execution. The proof concerns the Gallina program; confidence in execution additionally depends on extraction and the target-language compiler.

---

# 08_booleans

Booleans use exactly the same inductive mechanism as days. There are two constructors, true and false, and negb examines which one it receives. Its computation rules exchange the constructors. Evaluating negb true returns false, while negb false returns true. The point of redefining these familiar objects is to see that their behavior follows from ordinary declarations rather than an unexplained primitive operation.

---

# 09_boolean_operations

Conjunction and disjunction each take two boolean arguments. Conjunction returns the second input when the first is true and otherwise returns false; disjunction returns true when the first input is true and otherwise returns the second input. The four truth-table rows specify every possible input pair. The infix notations give those same functions familiar syntax without changing their meanings. For the final expression, the first disjunction is false and the remaining disjunction with true evaluates to true.

---

# 10_conditionals

The conditional version of negation is equivalent to the earlier match. Rocq can also use conditionals with an inductive type having exactly two constructors, so the guard need not have the particular type named bool. The first constructor selects the then branch and the second selects the else branch. In the black-and-white example, the two evaluations exchange bw_black and bw_white. Constructor order matters; the spelling of the names does not determine the branch.

---

# 11_function_types

Every expression has a type, including a function before it is applied. Negation has a boolean input and boolean result. Conjunction's arrow type describes two boolean inputs supplied successively, followed by a boolean result. Check can verify an explicit expected type and rejects a mismatch. Rocq often infers omitted types, but writing argument and result types helps us understand the definition. Later examples quantify over function values directly.

---

# 12_boolean_practice

First translate the informal behavior into a precise boolean specification. NAND is false only when both inputs are true, so composing negation with conjunction is a short implementation. The three-input conjunction is true only when all three arguments are true, which can be implemented by composing two conjunctions. These are worked exercise completions rather than definitions supplied by the chapter. Have students verify the remaining source examples with reflexivity and explain why testing all input combinations is feasible for these finite boolean functions.

---

# 13_colors

The rgb declaration is an enumeration, while color introduces a constructor that carries an rgb argument. Primary therefore has a function-like type from rgb to color, but its purpose is to build data. Primary red is a valid color. Red is not a function, true does not accept red, and primary cannot accept a color where it requires an rgb. These examples make the arity and type restrictions of constructor application concrete.

---

# 14_color_patterns

Monochrome checks whether a color is black or white; the rgb payload of a primary color is irrelevant to this test. Isred needs more detail, so it first recognizes the primary red pattern. The later wildcard branch catches the primary colors not already handled. Patterns are tried in order. A variable such as p binds an argument, while the underscore avoids naming an argument that will not be used. Evaluate primary green and primary red to check that the cases express the intended distinction.

---

# 15_modules

The module encloses a local definition named foo. After its End declaration, Playground.foo refers to that particular rgb value. A separate unqualified foo can then be defined with type bool without losing the earlier definition. Checking each qualified or unqualified name makes the distinction explicit. The chapter uses this simple module feature to explore alternative definitions without interfering with the versions needed from the standard library.

---

# 16_tuples

A type with one constructor and several arguments can represent a tuple. The bits constructor wraps four bit values into one nybble. Pattern matching unwraps the fields: the first all_zero pattern recognizes exactly four zero bits, and the later wildcard pattern covers every remaining combination. The examples produce false for the alternating bits and true for the all-zero value. These bit constructors are scoped in TuplePlayground; later binary constructors will have the same short names but different types and arities.

---

# 17_naturals

Natural numbers require an infinite collection of values, so the successor constructor carries another natural number. Zero is represented by the capital letter O, and each additional S adds one to the represented number. Every individual value is still a finite constructor expression. Ordinary decimal numerals are convenient parsing and printing notation for these values. The choice of names is arbitrary; computation over the representation is what connects these marks to their intended numerical interpretation.

---

# 18_constructors_functions

Predecessor removes one successor if one is present and returns zero at the bottom. Minustwo handles zero and one explicitly, then removes two successors. These definitions have the same input and output type as S, but their roles differ: S constructs a data value, while pred and minustwo come with reduction rules that inspect data. The examples highlight both normal reductions and the zero boundary. After the chapter's experimental natural-number module ends, the unqualified nat again refers to the library version.

---

# 19_even_odd

Even needs recursion because it may repeatedly remove two successors. Zero is even, one is not, and the remaining case delegates to the strictly smaller inner value. Fixpoint permits that recursive reference, whereas the definition of odd simply reuses even and negation. Following even four through even two to even zero gives true. Odd one is true and odd four is false. Emphasize that the smaller argument is obtained by pattern matching, not by an unrestricted recursive call.

---

# 20_addition

Addition recurses on its first argument. At zero it returns the other argument; at a successor it returns a successor around a smaller addition. The trace of plus three two follows those clauses exactly until the first argument reaches zero. The result is three successors in front of two, hence five. This operational detail will matter later: a theorem with zero on the first input can compute immediately, while an unknown first input may block reduction.

---

# 21_multiplication

Multiplication reuses addition instead of introducing another unexplained arithmetic operation. Zero copies of m give zero, and one more copy gives m plus the recursive result. The grouped binders mean that both n and m have type nat. Tracing three times three produces three additions of three and evaluates to nine. The named example records this concrete result and closes by computation. As with addition, the definition's recursion direction will influence which general equalities simplify directly.

---

# 22_subtraction

The simultaneous match inspects both inputs and abbreviates nested case analysis. If the first input is zero, subtraction returns zero. If only the second input is zero, it returns the first input. If both are successors, it strips one from each and recurses. This natural-number subtraction saturates at zero: two minus five is zero, while five minus two is three. There is no negative result available in this type.

---

# 23_powers_factorial

Exponentiation recurses on the exponent, with one as its zero-exponent result. Its successor branch multiplies the base by the smaller power. The factorial code is a worked completion of the source exercise: zero factorial is one, and a successor input multiplies the current number by the factorial of its predecessor. The recursive argument is the predecessor field, which is structurally smaller. The evaluated results are eight for two cubed, six for factorial three, and one hundred twenty for factorial five.

---

# 24_eqb

Even equality testing can be programmed through pattern matching. Two zeros are equal; zero and successor are unequal; and two successors are compared by recursively comparing their inner numbers. The nested matches shown here could also be written as a simultaneous match. The traces for two and two, and for two and three, eventually expose either the matching-zero or mismatched-constructor case. The equals-question-mark notation refers to this boolean-valued function.

---

# 25_order_tests

Less-than-or-equal returns true immediately when its first argument is zero. A positive first argument exceeds zero; if both inputs are successors, comparison continues with their predecessors. Strict less-than can then be defined without another Fixpoint: n is strictly below m exactly when the successor of n is at most m. The examples include equality and both comparison directions. The less-than-or-equal-question-mark and less-than-question-mark notations are executable boolean tests.

---

# 26_bool_prop

An equality test and an equality proposition have different types and different jobs. Two equals-question-mark three is an expression of type bool and evaluates to false. Two equals three is a proposition, of type Prop, for which one might attempt to provide evidence. An Example declaration similarly states a proposition. A boolean expression can also occur inside a proposition: the claim that the computed test equals false is itself something we can prove. Avoid treating the test and its correctness claim as interchangeable.

---

# 27_notation

Notation instructs the parser and pretty-printer; it does not change the underlying functions. Lower numerical precedence levels bind more tightly, so multiplication at level forty binds more tightly than addition at level fifty. Left associativity groups the multiplications from left to right. The displayed parenthesized expression makes both choices visible. Scopes resolve overloaded symbols and numerals: the nat annotation selects natural-number notation, while the Z annotation selects integer notation. These optional details are useful when a printed expression looks ambiguous.

---

# 28_termination

The recursive call in plus-prime uses n-prime, a strict structural subterm exposed by matching a successor. Rocq recognizes the decrease and knows that evaluation must eventually reach the zero case. Its Fixpoint checking requires a recognizable structural decrease in some argument. This is a conservative check, not a solver for every possible termination argument. A program that does terminate can therefore still be rejected in this form. The chapter's optional exercise asks students to find such an example without leaving rejected code active in a submission.

---

# 29_general_theorems

The first example proves a particular arithmetic equality. The second statement quantifies over every natural number, but its proof can still be very short because zero plus an arbitrary number reduces by definition. The keyword forall in the source is rendered as the universal-quantifier symbol in the HTML. Example, Theorem, and Lemma are primarily stylistic choices of declaration name. The tactics between Proof and Qed guide construction of the evidence that Rocq checks.

---

# 30_goal_context

Read a proof state as available information together with an outstanding obligation. Initially the goal is universally quantified. Intros names an arbitrary natural number and moves it into the context, leaving the body of the claim as the goal. Simplification changes zero plus n into n. Reflexivity closes the resulting n equals n goal. The name chosen by intros need not match the binder spelling, although consistent naming generally makes the proof easier to follow.

---

# 31_simplification

The first input to addition determines its next computation step. A zero first input chooses the zero branch even if the other number is unknown. An unknown first input prevents the match from selecting a branch, so n plus zero does not simplify in the same way. This is a distinction about reduction, not a claim that right-zero addition is false. Reflexivity itself performs computation and unfolding to check equality, so the separate simpl tactic can be omitted from this easy proof. We often retain simpl to observe an understandable intermediate state.

---

# 32_rewrite_hypothesis

Intros brings the two numbers and the equality assumption into the context. Since the numbers are arbitrary, computation alone does not connect their sums. Rewriting with H replaces n by m throughout the goal, leaving identical sums on both sides. Reversing the rewrite would replace m by n and also finish this example. The arrow in the theorem denotes implication; the arrow supplied to rewrite specifies replacement direction. Without an explicit rewrite arrow, the default is left to right.

---

# 33_rewrite_lemmas

Rewrite can use an established theorem as well as a local equality assumption. The orientation of the library multiplication theorem is zero equals n times zero, so a backward rewrite replaces a multiplication by zero with zero. Rocq matches the quantified variable to the needed input. Two such rewrites turn the sum of the two zero products into zero plus zero. The successor-multiplication theorem will be useful in the next exercise. Always inspect the statement's direction rather than guessing it from its name.

---

# 34_rewrite_practice

In the chained-equality exercise, the first hypothesis replaces n by m, and the second replaces m by o. The goal then has the same sum on both sides. In the multiplication-by-one exercise, view one as successor zero and use the successor theorem backward. This gives p times zero plus p; the zero-product theorem then turns it into zero plus p. Reflexivity finishes because addition computes on its first argument. Both examples use the statements and tactics already introduced in the chapter.

---

# 35_proof_endings

Qed records a theorem only after all proof obligations have been solved. Admitted records the statement without evidence, which is useful temporarily but leaves an assumption that can propagate to later theorems. Abort abandons the declaration entirely, so the attempted theorem is unavailable afterward. These distinctions matter for both development and grading. An unfinished homework exercise should retain its required name and declaration with Admitted, rather than disappear through Abort. Admitted helper lemmas must not be mistaken for completed assurance.

---

# 36_stuck_simpl

This attempt deliberately shows a failure, not an accepted proof. After intros, simpl makes no progress on the test that n plus one is unequal to zero. Addition first needs to inspect n, and equality testing then needs the result of that blocked addition. The goal is still mathematically true, but its relevant constructor is not visible. The useful next question is whether n is zero or a successor. Abort lets the source leave the failed attempt behind before giving the successful proof.

---

# 37_destruct_nat

Destruct replaces one obligation with a separate obligation for each constructor of nat. The intro pattern contains no argument name for zero and one argument name for successor. Keeping eqn E records the corresponding case equation for orientation. In the zero case, the calculation reduces one compared with zero to false. In the successor case, the sum visibly starts with a successor, which already suffices to distinguish it from zero. Neither branch needs to know the exact value of the predecessor. Both close by reflexivity.

---

# 38_negb_involution

To show that negation is its own inverse, split the unknown boolean into its two constructors. For true, the inner negation produces false and the outer negation produces true. For false, the corresponding reduction returns false. Each constructor case therefore matches its original input. Because these are all possible boolean values, the case split establishes the universal property. No constructor fields need names in this example.

---

# 39_nested_cases

Conjunction commutativity involves two unknown booleans. Splitting the first boolean and then the second within each branch produces four obligations, corresponding exactly to the full truth table. Each side then computes to the same result. The minus bullets identify the outer cases, and the plus bullets identify the inner cases. Bullets communicate the structure and also help ensure one obligation is finished before the next begins. This is an exhaustive proof for this finite input type, rather than a sample of cases.

---

# 40_subgoal_structure

Curly braces provide another way to mark the beginning and end of each subproof. Nested bullet symbols and repeated bullets can also distinguish levels. Intro patterns combine introduction and immediate case analysis: the natural-number pattern creates zero and successor cases, while two empty patterns create the four combinations for two booleans. The shorthand omits the retained equation supplied by eqn E in an explicit destruct. Choose names and formatting that keep the proof readable rather than compressing it as far as possible.

---

# 41_hypothesis_simpl

This worked proof demonstrates that simplification can target a hypothesis as well as the goal. When b is true, simplification of H gives c equals true, which can directly rewrite the goal. When b is false, H simplifies to the contradictory equation false equals true. Splitting c makes one goal reflexive; in the other, rewriting with that contradictory equation also makes both sides identical. The proof deliberately uses only the tactics learned so far. Simplifying before another destruct keeps the reasoning focused.

---

# 42_function_values_proofs

The quantified object f is itself a function value. In the identity exercise, H describes its behavior on every boolean argument, allowing rewrite to remove both applications in f of f of b. In the negation exercise, the corresponding hypothesis replaces each function application with negation. The result then follows from the previously established involution theorem. These are worked completions of the two higher-order exercises. The proofs reason from the behavior required of f without inspecting its implementation.

---

# 43_tactic_choice

Select tactics by the current obstruction. Intros handles quantifiers and assumptions, simpl exposes computation, reflexivity checks equality after reduction, rewrite uses an available equality, and destruct reveals an unknown constructor. The reversed equality-test exercise invites a natural-number split. The optional conjunction-versus-disjunction exercise benefits from simplifying a hypothesis after a carefully chosen boolean split. Destruct does not provide an induction hypothesis; properties that depend recursively on an arbitrary smaller value will require stronger methods later.

---

# 44_grading_model

The grading example builds a model from letters and modifiers. Grade wraps the two fields into one value, so A minus and plain C are represented by specific constructor applications. The comparison type reports less than, equal, or greater than, rather than only a boolean answer. The resulting model supports both computation and theorems about policy behavior. Treat this as the textbook's example policy; the slide does not assert that it is the instructor's actual grading rule.

---

# 45_grade_comparators

Letter comparison orders A above B, B above C, C above D, and D above F. The cases are tried in order, so a wildcard branch covers only the remaining possibilities. Alternative patterns abbreviate multiple cases, such as C compared with either A or B. The concrete evaluations give less than for B against A, equal for D against D, and greater than for B against F. Modifier comparison uses the same technique with Plus above Natural above Minus. A useful helper theorem states that any letter compared with itself produces Eq; its proof is a case split.

---

# 46_lexicographic

Unpack both grades, then inspect the result of comparing their letters. A less-than or greater-than letter result already decides the grade comparison. Only Eq requires looking at the modifiers. Consequently A minus exceeds B plus, whereas A minus is below A plus. Identical F plus grades compare equal, and B minus exceeds C plus. This lexicographic organization avoids enumerating every pair of grades and also gives later proofs a manageable case structure.

---

# 47_grade_counterexample

The lowering function moves each letter down one level but leaves F fixed because the type contains no lower letter. The unqualified assertion that lowering always produces a strictly smaller letter therefore fails. At input F, both arguments of letter comparison are F, so the result is Eq rather than Lt. The problem is the statement's missing precondition, not an unusually difficult F branch. A failed proof attempt is useful evidence when it exposes a concrete counterexample.

---

# 48_repair_theorem

The corrected claim assumes that F is strictly below the input letter. The A, B, C, and D cases then compute directly. In the F case, the hypothesis simplifies to Eq equals Lt, which is incompatible with the comparison results. The displayed rewrite-based proof can use that equation to finish the impossible branch with the tactics already available. This illustrates a general specification lesson: state a strict decrease only above the saturation boundary.

---

# 49_lower_grade

Lowering a grade changes the modifier before changing the letter. Plus becomes Natural, Natural becomes Minus, and Minus rolls over to Plus on the next lower letter. The special F-minus case remains F-minus instead of wrapping upward to F-plus. The visible chain illustrates the ordinary steps, while the bottom chain shows saturation explicitly. Handling the modifier first produces a short nested match and avoids enumerating all fifteen possible grade values. This is a worked solution to the source exercise.

---

# 50_lower_grade_properties

The examples check the main transitions, including letter rollover and the fixed bottom value. Two applications to B minus produce C Natural, while three produce C Minus. The general theorem requires the initial grade to be strictly above F minus. For its proof, unpack the grade and split the modifier; Plus and Natural use the helper that a letter compared with itself is Eq. Only Minus requires letter cases, and the bottom case uses lower_grade_F_Minus together with the precondition. The complete checked proof is retained in the accompanying verification file.

---

# 51_policy_ranges

The example policy has four exact intervals: zero through eight days, nine through sixteen, seventeen through twenty, and twenty-one or more. They apply zero, one, two, and three lowering steps respectively. Starting from A plus, the resulting grades are A plus, A Natural, A Minus, and B plus. A step is a modifier step, not necessarily a whole letter. Saturation at F minus remains in effect. Test both sides of each threshold to catch off-by-one errors.

---

# 52_apply_policy

The nested conditionals translate the interval table into executable code. If the first guard is true, no lowering occurs. Otherwise the later guards choose one, two, or three applications of lower_grade. Starting from A plus, days eight and nine distinguish no penalty from one step; sixteen and seventeen distinguish one step from two; twenty and twenty-one distinguish two steps from three. These checked computations validate the boundary examples. They will also help us interpret the hypotheses of the policy theorems.

---

# 53_no_penalty_proof

The unfold lemma states that apply_late_policy equals its defining conditional expression and can be proved by reflexivity. Rewriting with that equality exposes the guard while staying within the chapter's elementary tactic toolkit. In the no-penalty theorem, H says that the first guard evaluates to true. Rewriting H therefore selects the unchanged-grade branch. The remaining goal is g equals g and closes by reflexivity. The proof covers every grade and every late-day count satisfying that boolean hypothesis.

---

# 54_one_step_proof

The one-step theorem has two guard hypotheses. H9 says that the first threshold test is false, which moves evaluation into the outer else branch. H17 says the next threshold test is true, selecting exactly one call to lower_grade. After exposing the definition and rewriting those two hypotheses, the goal is reflexive. The original exercise heading uses a slightly different spelling, but the theorem's declared name is grade_lowered_once. Ask students to formulate the guard assumptions needed for the two-step and three-step intervals.

---

# 55_binary_type

Binary numerals reuse the idea of an inductive representation but have three constructors. Z denotes zero. B0 wraps an inner numeral with a low zero bit, doubling its value, while B1 doubles the inner value and adds one. Unlike the earlier tuple bit constructors, these constructors each carry a recursive argument. The representation is more compact than unary numerals for larger values. Its orientation is chosen to make operations such as increment easy to express through pattern matching.

---

# 56_binary_values

Read the outermost, leftmost constructor as the least-significant bit, which is opposite to the usual written order of binary digits. For example, B0 of B1 of Z denotes two, whose usual binary spelling is one-zero. Another outer B0 doubles the value to four, and another doubles it to eight. B1 of B1 of Z denotes three. B0 Z denotes zero, so the representation permits distinct constructor expressions for the same natural-number value. Keep represented numerical equality separate from literal constructor equality.

---

# 57_binary_increment

Increment handles the low-order bit first. Z becomes one, a B0 becomes B1 without changing the remaining numeral, and a B1 becomes B0 while carrying into a recursive increment of the inner numeral. The trace from three to four carries through two B1 constructors before reaching Z. The final B0 of B0 of B1 of Z has usual binary spelling one-zero-zero. The smaller example from one to two uses the same carry rule once. Each recursive call uses a constructor field, so it is structurally decreasing.

---

# 58_binary_conversion

Conversion gives the representation an explicit natural-number interpretation. Z maps to zero, B0 doubles the recursively converted inner value, and B1 adds one to that doubled value. The displayed calculation for B0 of B1 of Z gives two times one, hence two. The larger example with three outer zero bits gives eight. This is a worked exercise completion, and its definition follows directly from the intended meanings of the three constructors. Compare it with the unary representation rather than treating the notation as ordinary left-to-right binary digits.

---

# 59_tests_and_proofs

The concrete increment and conversion examples can be proved by reflexivity because all their inputs are fully known constructor expressions. They check both the resulting representation and its interpreted natural-number value. The general property below instead quantifies over every binary numeral: interpreting increment should add one to the interpreted value. The passing examples do not establish that universal claim. The chapter deliberately leaves general reasoning about such recursively defined behavior for the next stage of the course.

---

# 60_exercise_map

Use this page to locate practice by the skill it develops. The definition exercises test whether students can turn a specification into boolean or recursive code. The equality and boolean exercises practice selecting a small sequence of rewrites and case splits, including reasoning about function values. The grading exercises connect data modeling, comparison, a saturating transformation, and policy theorems. Decreasing and andb_eq_orb are optional challenges. For every task, state the intended behavior, inspect boundary examples, and then identify the remaining general proof obligation.

---

# 61_compile_checks

Save the source file before compiling. Run the Basics compilation first and then the test-file compilation, using the LF logical-library mapping shown here. With the supplied build setup and the matching _CoqProject entry, make BasicsTest.vo is an alternative. The String export in Basics supports the course tooling. The test output reports missing exercises, statement types, and assumptions. Running this script is an optional convenience, but it can reveal submission problems before the instructor's grading process does.

---

# 62_assumptions_submission

A type check and an assumption audit answer separate questions. The first checks that the theorem still states the required claim; the second exposes unproved dependencies. Closed under the global context means there are no such unproved assumptions in that check. Compare any listed axioms with the course's allowed list and inspect type results even if the final exercise summary looks successful. Keep names and statements intact, retain unfinished tasks with Admitted, and also admit a main proof that relies on an admitted helper as the source instructions require. Submit the assignment files rather than the supplied test and preface files; manually graded exercises still need human assessment.

---

# 63_connected_model

The lesson can now be read as one connected chain. Inductive declarations determine how values are built, and pattern matching exposes those shapes. Structural recursion turns the exposed structure into terminating computations. Propositions describe the desired properties, while tactics organize checked evidence through computation, rewriting, and cases. The grading policy and binary numerals use these same ingredients with different representations. This mental model is more useful than memorizing isolated command names.

---

# 64_self_check

Primary expects an rgb, so primary red is valid but nesting primary supplies a color where rgb is required. Zero plus n reduces because addition matches its first argument; n plus zero can be blocked by that unknown constructor. Rewriting needs a useful equality, while destruct exposes constructor cases. Strict lowering must account for F and F minus, and passing binary tests still leave universal correctness to prove. The final computations give four as the interpreted value after incrementing three, and rgb to color as the type of primary. The next step is to develop proof methods that follow recursive structure more deeply.
