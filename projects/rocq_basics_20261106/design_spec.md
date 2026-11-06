<!-- ppt-master-schema: design-spec/v1 -->
# Rocq Basics - Design Spec

## I. Project Information

| Item | Value |
| --- | --- |
| Project Name | rocq_basics_20261106 |
| Canvas Format | PPT 4:3, 1024 × 768 |
| Page Count | 64 |
| Primary Language | en |
| Target Audience | Students beginning Rocq, with basic programming experience and no assumed Gallina or tactic experience. |
| Communication Intent | Teach Gallina modeling and computation, then elementary proofs through code, results, proof states, and practice; cover key technical content of Basics.html. |
| Desired Audience Outcome | Define inductive data and structural recursion; distinguish boolean tests and propositions; use intros, simpl, reflexivity, rewrite, destruct; understand grades, binary numbers, and homework checks. |
| Core Message / Ask / Action | Programs compute over inductively defined data; proofs establish general properties by computation, rewriting, and cases. |
| Delivery Context | Instructor-led English lecture with live code walkthroughs; secondary student revision. Follow output_R1.pdf style with dedicated code/result areas, no footer and selective title bars. |
| Artifact Afterlife | Editable course PPTX for revision and instructor reuse, grounded in Basics. |
| Reading Mode | balanced |
| Content Strategy | Summarize and reorganize for understanding while retaining important concepts and technical details. |
| Design Style | Concept → code → result → proof; reference academic identity without footer. |
| AI Image Acquisition Path | not applicable |
| Generation Mode | continuous |
| Spec Refinement | disabled |
| Speaker Notes | enabled — final Stage-2 policy confirmed in chat |
| Custom Animations | disabled — final Stage-2 policy confirmed in chat |
| Narration Audio | disabled — final Stage-2 policy confirmed in chat |
| Created Date | 2026-11-06 |

## II. Canvas Specification

| Property | Value |
| --- | --- |
| Format | PPT 4:3 |
| Dimensions | 1024 × 768 |
| viewBox | `0 0 1024 768` |
| Margins | 36–48 px content edge |
| Content Area | Full page within readable margins; no footer reservation |

## III. Visual Theme

### Theme Style

- **Mode**: custom
- **Mode References**: instructional
- **Mode Behavior**: Use instructional sequencing from constructors to matching and recursion, then computation, rewriting, and case-analysis proofs. Pair examples with results or proof states. Integrate skills through grades and binary numbers; use short transfer exercises.
- **Visual style**: custom
- **Visual Style Behavior**: Preserve the reference's clear sans-serif hierarchy and selected full-width title bands on a plain body field. Omit footer furniture. Code-led continuation pages use local labels instead of main titles. Ruled code panels and distinct results support precise reading; no texture or decorative depth.
- **Theme**: Exact code leads; constructor/case relationships supply the recurring visual language.
- **Tone**: Patient, precise, student-facing.

### Color Scheme

| Role | HEX | Purpose |
| --- | --- | --- |
| Background | #FFFFFF | Main field |
| Secondary background | #F5F5F8 | Code field |
| Primary | #3333B2 | Reference title identity |
| Accent | #262686 | Labels |
| Secondary accent | #006B2D | Successful results |
| Body text | #171717 | Main text |
| Error | #B42318 | Labeled failed attempts |
| Grid | #D6D6E5 | Rules |
| Surface | #EDF5EF | Results |

## IV. Typography System

### Font Plan

| Role | Character (Reference) | Primary | English if non-English | Fallback tail |
| --- | --- | --- | --- | --- |
| Title | Academic sans | Arial | not applicable | DejaVu Sans, sans-serif |
| Body | Neutral sans | Arial | not applicable | DejaVu Sans, sans-serif |
| Code | Monospaced exact syntax | Consolas | not applicable | DejaVu Sans Mono, monospace |

- **Title stack**: Arial, DejaVu Sans, sans-serif
- **Body stack**: Arial, DejaVu Sans, sans-serif
- **Code stack**: Consolas, DejaVu Sans Mono, monospace
- **Role rationale**: Code and proof-state syntax require recurring monospaced text and indentation. Target is Windows PowerPoint; preview tails do not change exported Arial/Consolas faces.

### Font Size Hierarchy

| Purpose | Anchor Size (px) |
| --- | ---: |
| Body | 24 |
| Title | 36 |
| Subtitle | 30 |
| Lead | 28 |
| Annotation | 20 |
| Code | 22 |
| Panel label | 20 |
| Display | 56 |

## V. Layout Principles

### Deck-wide Direction

- **Hierarchy direction**: Concept → code → result or proof state → transfer prompt.
- **Composition tendency**: Wide code above results for long definitions; short definitions may sit beside explanation.
- **Cross-page continuity**: Consistent code/result language. No footer, page numbers, or empty footer strip. Title bars appear selectively per page brief.
- **Spacing posture**: Open concept pages, moderately dense definitions; preserve readable code.

## VI. Icon Usage Specification

- **Primary bundled library**: none

| Icon Path | Suitable Scenarios |
| --- | --- |

## VII. Visualization Reference List

| Page | Family | Template | Usage |
| --- | --- | --- | --- |
| P09 | table | record_table | Boolean truth table |
| P51 | table | record_table | Exact late-day policy |
| P56 | table | record_table | Binary values |

## VIII. Image Resource List

| Filename | Dimensions | Ratio | Purpose | Type | Layout pattern | Crop Policy | Acquire Via | Status | Reference | text_policy | page_role |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

## IX. Content Outline

### Part 1: Data and Functions

#### Slide 01 - Functional Programming in Rocq

- **Audience move**: Uncertain about functional programming in rocq → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Functional Programming in Rocq
- **Core message**: Opening distinction: define programs, compute results, prove properties
- **Content**: Opening distinction: define programs, compute results, prove properties. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 02 - Learning map

- **Audience move**: Uncertain about learning map → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Learning map
- **Core message**: Data → functions → recursive computation → proofs → applications; learning outcomes
- **Content**: Data → functions → recursive computation → proofs → applications; learning outcomes. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 03 - Why functional programming helps reasoning

- **Audience move**: Uncertain about why functional programming helps reasoning → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Why functional programming helps reasoning
- **Core message**: Pure input/output behavior, first-class functions, algebraic data, and Gallina versus tactics
- **Content**: Pure input/output behavior, first-class functions, algebraic data, and Gallina versus tactics. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 04 - Build an enumerated type

- **Audience move**: Uncertain about build an enumerated type → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Build an enumerated type
- **Core message**: Full `Inductive day` declaration; constructors and `Type`
- **Content**: Full `Inductive day` declaration; constructors and `Type`. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 05 - Consume values with pattern matching

- **Audience move**: Uncertain about consume values with pattern matching → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Consume values with pattern matching
- **Core message**: Full `next_working_day`; Friday → Monday; Saturday → Monday → Tuesday
- **Content**: Full `next_working_day`; Friday → Monday; Saturday → Monday → Tuesday. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 06 - Three commands, three purposes

- **Audience move**: Uncertain about three commands, three purposes → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Three commands, three purposes
- **Core message**: `Compute`, `Check`, and `Example`; value, type, and proposition distinguished
- **Content**: `Compute`, `Check`, and `Example`; value, type, and proposition distinguished. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 07 - From a test assertion to checked evidence

- **Audience move**: Uncertain about from a test assertion to checked evidence → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: From a test assertion to checked evidence
- **Core message**: `test_next_working_day`; `Proof. simpl. reflexivity. Qed.`; extraction and its trust boundary
- **Content**: `test_next_working_day`; `Proof. simpl. reflexivity. Qed.`; extraction and its trust boundary. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 08 - Booleans are another inductive type

- **Audience move**: Uncertain about booleans are another inductive type → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Booleans are another inductive type
- **Core message**: `bool`, `negb`, and true/false results
- **Content**: `bool`, `negb`, and true/false results. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 09 - Conjunction and disjunction

- **Audience move**: Uncertain about conjunction and disjunction → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Conjunction and disjunction
- **Core message**: `andb`, `orb`, their truth table, application syntax, `&&` and `||`
- **Content**: `andb`, `orb`, their truth table, application syntax, `&&` and `||`. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

- **Visualization**: `boolean-results` is a pure text-grid table with source input/value and corresponding results.
- **Native-ready**: boolean-results=yes

#### Slide 10 - Conditionals and constructor order

- **Audience move**: Uncertain about conditionals and constructor order → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Conditionals and constructor order
- **Core message**: `negb'` and the two-constructor `bw`/`invert` example; both outputs
- **Content**: `negb'` and the two-constructor `bw`/`invert` example; both outputs. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 11 - Read function types

- **Audience move**: Uncertain about read function types → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Read function types
- **Core message**: `Check true`, `Check negb`, `Check andb`; arrows, input/result types, type inference, functions as values
- **Content**: `Check true`, `Check negb`, `Check andb`; arrows, input/result types, type inference, functions as values. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 12 - Practice: compose boolean functions

- **Audience move**: Uncertain about practice: compose boolean functions → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Practice: compose boolean functions
- **Core message**: `nandb` and `andb3` specifications, representative expected results, short implementation prompts
- **Content**: `nandb` and `andb3` specifications, representative expected results, short implementation prompts. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 13 - Constructors can carry data

- **Audience move**: Uncertain about constructors can carry data → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Constructors can carry data
- **Core message**: `rgb`, `color`, `primary`; constructor signatures and well-typed/ill-typed values
- **Content**: `rgb`, `color`, `primary`; constructor signatures and well-typed/ill-typed values. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 14 - Patterns reveal data structure

- **Audience move**: Uncertain about patterns reveal data structure → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Patterns reveal data structure
- **Core message**: `monochrome` and `isred`; ordered cases, bound variables, wildcard `_`; sample outputs
- **Content**: `monochrome` and `isred`; ordered cases, bound variables, wildcard `_`; sample outputs. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 15 - Modules keep names separate

- **Audience move**: Uncertain about modules keep names separate → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Modules keep names separate
- **Core message**: `Module Playground`, `End`, qualified `Playground.foo`, and two different `foo` types
- **Content**: `Module Playground`, `End`, qualified `Playground.foo`, and two different `foo` types. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 16 - Tuples from one constructor

- **Audience move**: Uncertain about tuples from one constructor → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Tuples from one constructor
- **Core message**: `bit`, `nybble`, `bits`, `all_zero`; wrapper/unwrapper relationship and outputs
- **Content**: `bit`, `nybble`, `bits`, `all_zero`; wrapper/unwrapper relationship and outputs. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 17 - Natural numbers from zero and successor

- **Audience move**: Uncertain about natural numbers from zero and successor → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Natural numbers from zero and successor
- **Core message**: `nat`, `O`, `S`; unary/decimal examples; infinite set of finite constructor expressions
- **Content**: `nat`, `O`, `S`; unary/decimal examples; infinite set of finite constructor expressions. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 18 - Constructing data versus computing

- **Audience move**: Uncertain about constructing data versus computing → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Constructing data versus computing
- **Core message**: `S`, `pred`, `minustwo`; signatures and reductions; zero boundary
- **Content**: `S`, `pred`, `minustwo`; signatures and reductions; zero boundary. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 19 - Recursive functions: even and odd

- **Audience move**: Uncertain about recursive functions: even and odd → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Recursive functions: even and odd
- **Core message**: Full `even`, defined `odd`; a reduction trace and tested outputs
- **Content**: Full `even`, defined `odd`; a reduction trace and tested outputs. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 20 - Addition follows its first argument

- **Audience move**: Uncertain about addition follows its first argument → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Addition follows its first argument
- **Core message**: Full `plus`; trace `plus 3 2` to 5
- **Content**: Full `plus`; trace `plus 3 2` to 5. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 21 - Multiplication reuses addition

- **Audience move**: Uncertain about multiplication reuses addition → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Multiplication reuses addition
- **Core message**: Full `mult`; grouped binders; `mult 3 3 = 9`
- **Content**: Full `mult`; grouped binders; `mult 3 3 = 9`. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 22 - Subtraction stops at zero

- **Audience move**: Uncertain about subtraction stops at zero → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Subtraction stops at zero
- **Core message**: Full `minus`; simultaneous patterns; `minus 2 5 = 0`, `minus 5 2 = 3`
- **Content**: Full `minus`; simultaneous patterns; `minus 2 5 = 0`, `minus 5 2 = 3`. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 23 - Recursion practice: powers and factorial

- **Audience move**: Uncertain about recursion practice: powers and factorial → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Recursion practice: powers and factorial
- **Core message**: `exp` over its exponent; factorial base/step equations; outputs 6 and 120
- **Content**: `exp` over its exponent; factorial base/step equations; outputs 6 and 120. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 24 - Equality as a recursive computation

- **Audience move**: Uncertain about equality as a recursive computation → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Equality as a recursive computation
- **Core message**: Full `eqb`; nested/simultaneous matching relationship; equal and unequal examples
- **Content**: Full `eqb`; nested/simultaneous matching relationship; equal and unequal examples. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 25 - Less-than comparisons

- **Audience move**: Uncertain about less-than comparisons → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Less-than comparisons
- **Core message**: `leb`, derived `ltb`, `<=?` and `<?`; outputs for 2/2, 2/4, and 4/2
- **Content**: `leb`, derived `ltb`, `<=?` and `<?`; outputs for 2/2, 2/4, and 4/2. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 26 - Boolean equality versus a proposition

- **Audience move**: Uncertain about boolean equality versus a proposition → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Boolean equality versus a proposition
- **Core message**: `n =? m : bool` versus `n = m : Prop`; computing an answer versus proving a claim
- **Content**: `n =? m : bool` versus `n = m : Prop`; computing an answer versus proving a claim. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 27 - Notation changes syntax, not definitions

- **Audience move**: Uncertain about notation changes syntax, not definitions → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Notation changes syntax, not definitions
- **Core message**: Addition/multiplication levels and associativity; parenthesized parse; scopes and `%nat`/`%Z`
- **Content**: Addition/multiplication levels and associativity; parenthesized parse; scopes and `%nat`/`%Z`. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 28 - Why structural recursion matters

- **Audience move**: Uncertain about why structural recursion matters → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Why structural recursion matters
- **Core message**: A decreasing `plus'`; smaller constructor subterms; termination and conservative rejection
- **Content**: A decreasing `plus'`; smaller constructor subterms; termination and conservative rejection. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

### Part 2: Elementary Proofs

#### Slide 29 - From examples to general theorems

- **Audience move**: Uncertain about from examples to general theorems → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: From examples to general theorems
- **Core message**: Concrete equality versus `forall n`; `Example`, `Theorem`, `Lemma`; proof vocabulary
- **Content**: Concrete equality versus `forall n`; `Example`, `Theorem`, `Lemma`; proof vocabulary. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 30 - Read the goal and context

- **Audience move**: Uncertain about read the goal and context → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Read the goal and context
- **Core message**: `plus_O_n`; proof states before/after `intros`, `simpl`, and `reflexivity`
- **Content**: `plus_O_n`; proof states before/after `intros`, `simpl`, and `reflexivity`. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 31 - What simplification can establish

- **Audience move**: Uncertain about what simplification can establish → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: What simplification can establish
- **Core message**: Why `0 + n` reduces; why unknown matched arguments block progress; `reflexivity` also unfolds/computes
- **Content**: Why `0 + n` reduces; why unknown matched arguments block progress; `reflexivity` also unfolds/computes. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 32 - Rewrite using an equality hypothesis

- **Audience move**: Uncertain about rewrite using an equality hypothesis → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Rewrite using an equality hypothesis
- **Core message**: `plus_id_example`; `intros n m H`; goal before/after `rewrite -> H`; reverse direction
- **Content**: `plus_id_example`; `intros n m H`; goal before/after `rewrite -> H`; reverse direction. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 33 - Rewrite using a quantified theorem

- **Audience move**: Uncertain about rewrite using a quantified theorem → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Rewrite using a quantified theorem
- **Core message**: `mult_n_O`, `mult_n_Sm`, and `mult_n_0_m_0`; orientation and inferred instantiation
- **Content**: `mult_n_O`, `mult_n_Sm`, and `mult_n_0_m_0`; orientation and inferred instantiation. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 34 - Practice: chained rewrites

- **Audience move**: Uncertain about practice: chained rewrites → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Practice: chained rewrites
- **Core message**: `plus_id_exercise` and `mult_n_1`; intermediate goals and a short worked sequence
- **Content**: `plus_id_exercise` and `mult_n_1`; intermediate goals and a short worked sequence. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 35 - Qed, Admitted, and Abort

- **Audience move**: Uncertain about qed, admitted, and abort → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Qed, Admitted, and Abort
- **Core message**: Checked proof, assumed statement, and abandoned declaration; dependency consequences
- **Content**: Checked proof, assumed statement, and abandoned declaration; dependency consequences. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 36 - Diagnose a stuck proof

- **Audience move**: Uncertain about diagnose a stuck proof → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Diagnose a stuck proof
- **Core message**: The failed `simpl` attempt for `(n + 1) =? 0 = false`; identify the unknown match argument
- **Content**: The failed `simpl` attempt for `(n + 1) =? 0 = false`; identify the unknown match argument. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 37 - Destruct exposes the constructors

- **Audience move**: Uncertain about destruct exposes the constructors → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Destruct exposes the constructors
- **Core message**: Full `plus_1_neq_0` proof; `as [| n']`, two goals, and `eqn:E`
- **Content**: Full `plus_1_neq_0` proof; `as [| n']`, two goals, and `eqn:E`. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 38 - Case analysis over booleans

- **Audience move**: Uncertain about case analysis over booleans → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Case analysis over booleans
- **Core message**: Full `negb_involutive`; true/false goal reductions
- **Content**: Full `negb_involutive`; true/false goal reductions. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 39 - Nested cases prove commutativity

- **Audience move**: Uncertain about nested cases prove commutativity → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Nested cases prove commutativity
- **Core message**: `andb_commutative`; four branches linked to the truth table
- **Content**: `andb_commutative`; four branches linked to the truth table. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 40 - Keep subgoals readable

- **Audience move**: Uncertain about keep subgoals readable → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Keep subgoals readable
- **Core message**: Nested bullets, braces, `intros [|n]`, and `intros [] []`; equation-recording tradeoff
- **Content**: Nested bullets, braces, `intros [|n]`, and `intros [] []`; equation-recording tradeoff. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 41 - Simplify a hypothesis and use it

- **Audience move**: Uncertain about simplify a hypothesis and use it → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Simplify a hypothesis and use it
- **Core message**: `andb_true_elim2`; `simpl in H`; useful cases and contradictory hypotheses
- **Content**: `andb_true_elim2`; `simpl in H`; useful cases and contradictory hypotheses. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 42 - Functions are values in theorem statements

- **Audience move**: Uncertain about functions are values in theorem statements → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Functions are values in theorem statements
- **Core message**: Identity/negation applied twice; quantified `f : bool -> bool`; rewriting function behavior
- **Content**: Identity/negation applied twice; quantified `f : bool -> bool`; rewriting function behavior. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 43 - Choose a proof tactic deliberately

- **Audience move**: Uncertain about choose a proof tactic deliberately → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Choose a proof tactic deliberately
- **Core message**: Tactic decision guide; `zero_nbeq_plus_1` and optional `andb_eq_orb` practice; no induction hypothesis from `destruct`
- **Content**: Tactic decision guide; `zero_nbeq_plus_1` and optional `andb_eq_orb` practice; no induction hypothesis from `destruct`. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

### Part 3: Formalized Policies

#### Slide 44 - Model a course grading policy

- **Audience move**: Uncertain about model a course grading policy → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Model a course grading policy
- **Core message**: `letter`, `modifier`, `grade`, and `comparison`; the policy is the chapter's example
- **Content**: `letter`, `modifier`, `grade`, and `comparison`; the policy is the chapter's example. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 45 - Compare letters and modifiers

- **Audience move**: Uncertain about compare letters and modifiers → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Compare letters and modifiers
- **Core message**: Full comparison strategy; simultaneous/alternative patterns; `Lt`, `Eq`, `Gt` outputs
- **Content**: Full comparison strategy; simultaneous/alternative patterns; `Lt`, `Eq`, `Gt` outputs. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 46 - Compare grades lexicographically

- **Audience move**: Uncertain about compare grades lexicographically → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Compare grades lexicographically
- **Core message**: `grade_comparison`; compare letters first, modifiers on a tie; A− versus B+ and A+
- **Content**: `grade_comparison`; compare letters first, modifiers on a tie; A− versus B+ and A+. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 47 - A failed theorem discovers an edge case

- **Audience move**: Uncertain about a failed theorem discovers an edge case → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: A failed theorem discovers an edge case
- **Core message**: `lower_letter`; why F → F defeats unconditional strict lowering
- **Content**: `lower_letter`; why F → F defeats unconditional strict lowering. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 48 - Repair the statement with a precondition

- **Audience move**: Uncertain about repair the statement with a precondition → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Repair the statement with a precondition
- **Core message**: Correct `lower_letter_lowers` hypothesis and proof strategy; exclude the bottom grade
- **Content**: Correct `lower_letter_lowers` hypothesis and proof strategy; exclude the bottom grade. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 49 - Lower a grade one step

- **Audience move**: Uncertain about lower a grade one step → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Lower a grade one step
- **Core message**: `lower_grade`; modifier transitions, letter rollover, and F− saturation
- **Content**: `lower_grade`; modifier transitions, letter rollover, and F− saturation. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 50 - Test and reason about lowering

- **Audience move**: Uncertain about test and reason about lowering → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Test and reason about lowering
- **Core message**: Source tests including two/three applications; `lower_grade_F_Minus`; strict decrease only above F−
- **Content**: Source tests including two/three applications; `lower_grade_F_Minus`; strict decrease only above F−. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 51 - Express the late-day policy exactly

- **Audience move**: Uncertain about express the late-day policy exactly → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Express the late-day policy exactly
- **Core message**: 0–8 / 9–16 / 17–20 / ≥21 day bands; zero/one/two/three lowering steps
- **Content**: 0–8 / 9–16 / 17–20 / ≥21 day bands; zero/one/two/three lowering steps. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

- **Visualization**: `late-policy` is a pure text-grid table with source input/value and corresponding results.
- **Native-ready**: late-policy=yes

#### Slide 52 - Implement and test the boundaries

- **Audience move**: Uncertain about implement and test the boundaries → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Implement and test the boundaries
- **Core message**: Full `apply_late_policy`; examples at days 8, 9, 16, 17, 20, and 21
- **Content**: Full `apply_late_policy`; examples at days 8, 9, 16, 17, 20, and 21. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 53 - Prove the no-penalty branch

- **Audience move**: Uncertain about prove the no-penalty branch → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Prove the no-penalty branch
- **Core message**: `apply_late_policy_unfold`, hypothesis rewrite, and the remaining reflexive goal
- **Content**: `apply_late_policy_unfold`, hypothesis rewrite, and the remaining reflexive goal. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 54 - Prove the one-step branch

- **Audience move**: Uncertain about prove the one-step branch → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Prove the one-step branch
- **Core message**: `grade_lowered_once`; two boolean hypotheses; expose and rewrite conditional guards
- **Content**: `grade_lowered_once`; two boolean hypotheses; expose and rewrite conditional guards. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

### Part 4: Binary Numbers and Review

#### Slide 55 - Binary numbers use a recursive datatype

- **Audience move**: Uncertain about binary numbers use a recursive datatype → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Binary numbers use a recursive datatype
- **Core message**: `bin`, `Z`, `B0`, `B1`; recursive representation versus unary naturals
- **Content**: `bin`, `Z`, `B0`, `B1`; recursive representation versus unary naturals. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 56 - Read the least-significant bit first

- **Audience move**: Uncertain about read the least-significant bit first → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Read the least-significant bit first
- **Core message**: Decimal/constructor examples; `B0 Z` denotes zero; interpretation of B0/B1
- **Content**: Decimal/constructor examples; `B0 Z` denotes zero; interpretation of B0/B1. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

- **Visualization**: `binary-values` is a pure text-grid table with source input/value and corresponding results.
- **Native-ready**: binary-values=yes

#### Slide 57 - Increment by propagating carry

- **Audience move**: Uncertain about increment by propagating carry → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Increment by propagating carry
- **Core message**: Full `incr`; 1 → 2 and 3 → 4 traces; recursive carry through B1
- **Content**: Full `incr`; 1 → 2 and 3 → 4 traces; recursive carry through B1. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 58 - Convert binary numbers to naturals

- **Audience move**: Uncertain about convert binary numbers to naturals → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: Convert binary numbers to naturals
- **Core message**: Full `bin_to_nat`; value equations; 2 and 8 evaluations
- **Content**: Full `bin_to_nat`; value equations; 2 and 8 evaluations. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 59 - Tests check instances, proofs generalize

- **Audience move**: Uncertain about tests check instances, proofs generalize → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Tests check instances, proofs generalize
- **Core message**: Binary increment tests; desired general correctness property identified as later work, not claimed proved here
- **Content**: Binary increment tests; desired general correctness property identified as later work, not claimed proved here. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 60 - Integrated practice and exercise map

- **Audience move**: Uncertain about integrated practice and exercise map → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Integrated practice and exercise map
- **Core message**: Boolean definitions, arithmetic, rewriting, cases, grading, binary; standard/optional exercises identified
- **Content**: Boolean definitions, arithmetic, rewriting, cases, grading, binary; standard/optional exercises identified. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 61 - Compile and run chapter checks

- **Audience move**: Uncertain about compile and run chapter checks → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Compile and run chapter checks
- **Core message**: `rocq compile -Q . LF Basics.v`, then `BasicsTest.v`; `_CoqProject`, make alternative, String export
- **Content**: `rocq compile -Q . LF Basics.v`, then `BasicsTest.v`; `_CoqProject`, make alternative, String export. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 62 - Read assumptions and submit safely

- **Audience move**: Uncertain about read assumptions and submit safely → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Read assumptions and submit safely
- **Core message**: Type-ok versus assumptions; “Closed under the global context”; allowed axioms; exercise names, admitted dependencies, manual grading
- **Content**: Type-ok versus assumptions; “Closed under the global context”; allowed axioms; exercise names, admitted dependencies, manual grading. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 63 - One connected mental model

- **Audience move**: Uncertain about one connected mental model → able to explain and apply this step through its example.
- **Layout**: No main title bar; local labels orient code, results, or concept relationships. No footer. Preserve syntax and indentation.
- **Title**: One connected mental model
- **Core message**: Constructors → values → matching/recursion → computation → propositions → checked proofs
- **Content**: Constructors → values → matching/recursion → computation → propositions → checked proofs. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

#### Slide 64 - Check your understanding

- **Audience move**: Uncertain about check your understanding → able to explain and apply this step through its example.
- **Layout**: Main title bar for orientation, then content with corresponding code/result region. No footer. Preserve syntax and indentation.
- **Title**: Check your understanding
- **Core message**: Predict an evaluation, explain a type, select a tactic, identify a boundary case, and distinguish a test from a proof
- **Content**: Predict an evaluation, explain a type, select a tactic, identify a boundary case, and distinguish a test from a proof. Use sources/Basics.md for exact definitions and theorem meanings; show concrete results or proof-state changes. Label completed exercise code as worked examples and uncompleted tasks as practice.

## X. Speaker Notes Requirements

- **Generation**: enabled
- **Filename**: match each SVG filename under `notes/`
- **Content**: Explain the final page using the supplied Basics chapter; add teaching prompts and common mistakes. Distinguish worked solutions from source-supplied definitions. No unverified outside claims.
- **Total duration**: Approximately 100–120 minutes depending on exercise time.
- **Notes style**: Patient, conversational, interactive.
- **Presentation purpose**: Instruct and support revision.
