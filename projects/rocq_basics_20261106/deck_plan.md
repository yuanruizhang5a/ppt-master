# Rocq Basics — Presentation Plan for Confirmation

## Confirmed Brief

Audience: students beginning Rocq with basic programming experience. Language: English. Format: editable 4:3 PowerPoint, authored on a 1024 × 768 canvas. Primary use: instructor-led teaching; secondary use: student revision.

Use the visual identity of `projects/course-rocq/output_R1.pdf`, with the user's changes: **no academic footer and no recurring footer band, author name, course label, or slide number; use title bars only on slides that need a main title**. Code walkthroughs and continuation slides may omit the main title bar and use concise local panel labels. Do not leave an empty title strip or footer reservation.

Content may be summarized and reorganized to help students, while preserving the chapter's important concepts and technical details. The supplied chapter is the factual corpus. The reference PDF supplies visual style only. No reusable template workspace is selected.

## Recommended Complete Solution

**Concept → code → result → proof.** Introduce each abstraction through a small example; show executable Gallina in a dedicated code area; pair it with an evaluation result, type, proof state, or counterexample. Build from constructors and pattern matching to recursion, then from computation to rewriting and case analysis. Finish with the grading-policy and binary-number applications. Use short practice prompts throughout and distinguish exercises from worked solutions.

The recommended narrative is a custom application of the `instructional` mode. Concept pages establish one learning step; code-led pages expose operational detail without extra page furniture. The two extended applications combine the skills already taught. Speaker notes carry teaching prompts and supporting explanations, while the slides retain the essential technical content.

### Two Considered Alternatives

1. **Predict → execute → explain.** A laboratory-oriented custom `instructional` direction: start each cluster with a prediction or debugging question, show code, then reveal the computed/proved answer on a following page. It preserves the reference identity but uses more question/answer page pairs, approximately 68–72 slides, with result areas visually emphasized. Appropriate for a mostly hands-on class; the recommended solution is more convenient for both lecture and revision.
2. **Chapter companion notebook.** A custom application of `briefing`: organize approximately 50–54 denser slides by source section, with parallel definition/example summaries and larger comparison grids. It preserves the reference identity and uses fewer full-page walkthroughs. Appropriate for independent lookup; the recommended solution provides more gradual support for beginners.

All three directions keep the user's requested reference style, omit footers, and use main title bars selectively. Their substantive differences are teaching sequence, page rhythm, information density, and emphasis between code and result—not decorative variety.

## Visual and Production Proposal

| Item | Proposed value |
| --- | --- |
| Reading mode | Balanced: complete teaching points on the page, with additional guidance in notes |
| Slide budget | Approximately 60–64; the provisional recommended outline below has 64 slides |
| Background | White, `#FFFFFF` |
| Code surface | Very pale neutral, `#F5F5F8` |
| Primary identity | Reference indigo, `#3333B2`, measured from the PDF |
| Accent | Dark reference indigo, `#262686` |
| Secondary accent | Green, `#006B2D`, for successful evaluation/proof results |
| Body text | Near black, `#171717` |
| Error/failed-attempt role | Dark red, `#B42318`, paired with explanatory words rather than color alone |
| Code treatment | A dedicated, lightly framed code panel with preserved indentation, monospaced native text, and restrained syntax emphasis |
| Result treatment | A distinct labeled region for `Compute` output, `Check` output, a goal/context, completed proof, or failed obligation |
| Heading/body type | Arial, with a local sans-serif preview counterpart where needed |
| Code/proof-state type | Consolas, with a local monospaced preview counterpart where needed |
| Initial role sizes | Main title 36 px; body 24 px; code 22 px; panel label 20 px; annotation 20 px |
| Overflow handling | Shorten prose or redistribute explanation within the approved page plan; do not shrink important code until unreadable |
| Icons | None; exact code, text, and explanatory geometry carry the content |
| External/AI imagery | None recommended; the lesson benefits from editable code, diagrams, and tables |
| Speaker notes | Enabled: explanatory teaching notes and exercise prompts |
| Custom object animations | Disabled |
| Narration audio | Disabled |
| Page transitions | Exporter-default fade; no additional motion choreography |
| Execution | Continuous after final design confirmation; no separate design-spec refinement stop |
| Deliverable | Native editable PPTX, with the project source and validation records retained |

For completeness, each alternative has the same six recurring palette anchors and heading/body typography. The laboratory direction uses code as its largest recurring type role and dedicates more space to prediction/result contrasts; the notebook direction uses compact parallel reference groupings at the same readable body anchor, trimming repeated walkthroughs instead of shrinking text.

### Optional Rendering Candidates

These are recommendation-only candidates if image permission is later changed; no images are currently planned. Each is a novel custom treatment with no catalog basis and inherits the deck palette.

- **Concept/code direction:** crisp, uniform vector lines; smooth, untextured flat fills; shallow depth and no simulated material. Mood: precise and patient, like a carefully prepared classroom handout.
- **Laboratory direction:** crisp outlined components, minimal texture, and flat diagram planes with small emphasis offsets rather than realistic lighting. Mood: active and exploratory, like an annotated lab worksheet.
- **Notebook direction:** fine ruled edges, no grain, flat schematic marks, and restrained paper-like surfaces without decorative shadows. Mood: calm and searchable, like a technical reference manual.

## Provisional Slide Outline

“No bar” means a code-led or continuation slide with local panel labels. “Title” means a main indigo title bar adds orientation. Cover and recap treatments remain simple and consistent with the reference.

| Slide | Teaching focus | Code, result, or student activity | Header |
| --- | --- | --- | --- |
| 01 | Functional Programming in Rocq | Opening distinction: define programs, compute results, prove properties | Cover, no bar |
| 02 | Learning map | Data → functions → recursive computation → proofs → applications; learning outcomes | Title |
| 03 | Why functional programming helps reasoning | Pure input/output behavior, first-class functions, algebraic data, and Gallina versus tactics | Title |
| 04 | Build an enumerated type | Full `Inductive day` declaration; constructors and `Type` | Title |
| 05 | Consume values with pattern matching | Full `next_working_day`; Friday → Monday; Saturday → Monday → Tuesday | No bar |
| 06 | Three commands, three purposes | `Compute`, `Check`, and `Example`; value, type, and proposition distinguished | Title |
| 07 | From a test assertion to checked evidence | `test_next_working_day`; `Proof. simpl. reflexivity. Qed.`; extraction and its trust boundary | No bar |
| 08 | Booleans are another inductive type | `bool`, `negb`, and true/false results | Title |
| 09 | Conjunction and disjunction | `andb`, `orb`, their truth table, application syntax, `&&` and `||` | Title |
| 10 | Conditionals and constructor order | `negb'` and the two-constructor `bw`/`invert` example; both outputs | No bar |
| 11 | Read function types | `Check true`, `Check negb`, `Check andb`; arrows, input/result types, type inference, functions as values | Title |
| 12 | Practice: compose boolean functions | `nandb` and `andb3` specifications, representative expected results, short implementation prompts | Title |
| 13 | Constructors can carry data | `rgb`, `color`, `primary`; constructor signatures and well-typed/ill-typed values | Title |
| 14 | Patterns reveal data structure | `monochrome` and `isred`; ordered cases, bound variables, wildcard `_`; sample outputs | No bar |
| 15 | Modules keep names separate | `Module Playground`, `End`, qualified `Playground.foo`, and two different `foo` types | Title |
| 16 | Tuples from one constructor | `bit`, `nybble`, `bits`, `all_zero`; wrapper/unwrapper relationship and outputs | Title |
| 17 | Natural numbers from zero and successor | `nat`, `O`, `S`; unary/decimal examples; infinite set of finite constructor expressions | Title |
| 18 | Constructing data versus computing | `S`, `pred`, `minustwo`; signatures and reductions; zero boundary | No bar |
| 19 | Recursive functions: even and odd | Full `even`, defined `odd`; a reduction trace and tested outputs | Title |
| 20 | Addition follows its first argument | Full `plus`; trace `plus 3 2` to 5 | No bar |
| 21 | Multiplication reuses addition | Full `mult`; grouped binders; `mult 3 3 = 9` | Title |
| 22 | Subtraction stops at zero | Full `minus`; simultaneous patterns; `minus 2 5 = 0`, `minus 5 2 = 3` | No bar |
| 23 | Recursion practice: powers and factorial | `exp` over its exponent; factorial base/step equations; outputs 6 and 120 | Title |
| 24 | Equality as a recursive computation | Full `eqb`; nested/simultaneous matching relationship; equal and unequal examples | Title |
| 25 | Less-than comparisons | `leb`, derived `ltb`, `<=?` and `<?`; outputs for 2/2, 2/4, and 4/2 | No bar |
| 26 | Boolean equality versus a proposition | `n =? m : bool` versus `n = m : Prop`; computing an answer versus proving a claim | Title |
| 27 | Notation changes syntax, not definitions | Addition/multiplication levels and associativity; parenthesized parse; scopes and `%nat`/`%Z` | Title |
| 28 | Why structural recursion matters | A decreasing `plus'`; smaller constructor subterms; termination and conservative rejection | Title |
| 29 | From examples to general theorems | Concrete equality versus `forall n`; `Example`, `Theorem`, `Lemma`; proof vocabulary | Title |
| 30 | Read the goal and context | `plus_O_n`; proof states before/after `intros`, `simpl`, and `reflexivity` | No bar |
| 31 | What simplification can establish | Why `0 + n` reduces; why unknown matched arguments block progress; `reflexivity` also unfolds/computes | Title |
| 32 | Rewrite using an equality hypothesis | `plus_id_example`; `intros n m H`; goal before/after `rewrite -> H`; reverse direction | No bar |
| 33 | Rewrite using a quantified theorem | `mult_n_O`, `mult_n_Sm`, and `mult_n_0_m_0`; orientation and inferred instantiation | Title |
| 34 | Practice: chained rewrites | `plus_id_exercise` and `mult_n_1`; intermediate goals and a short worked sequence | No bar |
| 35 | Qed, Admitted, and Abort | Checked proof, assumed statement, and abandoned declaration; dependency consequences | Title |
| 36 | Diagnose a stuck proof | The failed `simpl` attempt for `(n + 1) =? 0 = false`; identify the unknown match argument | No bar |
| 37 | Destruct exposes the constructors | Full `plus_1_neq_0` proof; `as [| n']`, two goals, and `eqn:E` | Title |
| 38 | Case analysis over booleans | Full `negb_involutive`; true/false goal reductions | No bar |
| 39 | Nested cases prove commutativity | `andb_commutative`; four branches linked to the truth table | No bar |
| 40 | Keep subgoals readable | Nested bullets, braces, `intros [|n]`, and `intros [] []`; equation-recording tradeoff | Title |
| 41 | Simplify a hypothesis and use it | `andb_true_elim2`; `simpl in H`; useful cases and contradictory hypotheses | No bar |
| 42 | Functions are values in theorem statements | Identity/negation applied twice; quantified `f : bool -> bool`; rewriting function behavior | Title |
| 43 | Choose a proof tactic deliberately | Tactic decision guide; `zero_nbeq_plus_1` and optional `andb_eq_orb` practice; no induction hypothesis from `destruct` | Title |
| 44 | Model a course grading policy | `letter`, `modifier`, `grade`, and `comparison`; the policy is the chapter's example | Title |
| 45 | Compare letters and modifiers | Full comparison strategy; simultaneous/alternative patterns; `Lt`, `Eq`, `Gt` outputs | No bar |
| 46 | Compare grades lexicographically | `grade_comparison`; compare letters first, modifiers on a tie; A− versus B+ and A+ | Title |
| 47 | A failed theorem discovers an edge case | `lower_letter`; why F → F defeats unconditional strict lowering | No bar |
| 48 | Repair the statement with a precondition | Correct `lower_letter_lowers` hypothesis and proof strategy; exclude the bottom grade | Title |
| 49 | Lower a grade one step | `lower_grade`; modifier transitions, letter rollover, and F− saturation | No bar |
| 50 | Test and reason about lowering | Source tests including two/three applications; `lower_grade_F_Minus`; strict decrease only above F− | No bar |
| 51 | Express the late-day policy exactly | 0–8 / 9–16 / 17–20 / ≥21 day bands; zero/one/two/three lowering steps | Title |
| 52 | Implement and test the boundaries | Full `apply_late_policy`; examples at days 8, 9, 16, 17, 20, and 21 | No bar |
| 53 | Prove the no-penalty branch | `apply_late_policy_unfold`, hypothesis rewrite, and the remaining reflexive goal | No bar |
| 54 | Prove the one-step branch | `grade_lowered_once`; two boolean hypotheses; expose and rewrite conditional guards | No bar |
| 55 | Binary numbers use a recursive datatype | `bin`, `Z`, `B0`, `B1`; recursive representation versus unary naturals | Title |
| 56 | Read the least-significant bit first | Decimal/constructor examples; `B0 Z` denotes zero; interpretation of B0/B1 | No bar |
| 57 | Increment by propagating carry | Full `incr`; 1 → 2 and 3 → 4 traces; recursive carry through B1 | No bar |
| 58 | Convert binary numbers to naturals | Full `bin_to_nat`; value equations; 2 and 8 evaluations | No bar |
| 59 | Tests check instances, proofs generalize | Binary increment tests; desired general correctness property identified as later work, not claimed proved here | Title |
| 60 | Integrated practice and exercise map | Boolean definitions, arithmetic, rewriting, cases, grading, binary; standard/optional exercises identified | Title |
| 61 | Compile and run chapter checks | `rocq compile -Q . LF Basics.v`, then `BasicsTest.v`; `_CoqProject`, make alternative, String export | Title |
| 62 | Read assumptions and submit safely | Type-ok versus assumptions; “Closed under the global context”; allowed axioms; exercise names, admitted dependencies, manual grading | Title |
| 63 | One connected mental model | Constructors → values → matching/recursion → computation → propositions → checked proofs | Recap, no bar |
| 64 | Check your understanding | Predict an evaluation, explain a type, select a tactic, identify a boundary case, and distinguish a test from a proof | Title |

## Accuracy and Coverage Checks for Production

- Preserve source definitions and theorem meanings. Label any completed exercise implementation as a worked solution; do not imply the source already supplied it.
- Compile the deck's executable examples and completed proofs with the available Rocq installation; retain output used on slides. An intentionally failed attempt must be labeled as failed and handled without breaking the verification file.
- Keep `O` distinct from decimal `0`, constructor names distinct from computed functions, and boolean tests distinct from propositions.
- Show exact late-policy boundaries and the F/F− saturation cases. Do not describe the example policy as the instructor's actual policy.
- Keep binary constructor orientation explicit. Do not claim a universal correctness theorem from the example tests or introduce induction as though this chapter had already taught it.
- Make all code and results native editable text. Use editable geometry for explanatory diagrams and native tables where appropriate.
- Pass the required first-page and final SVG quality gates, then export through the repository's native PPTX converter and inspect its package-validation receipt.

## Confirmation State

Stage 1 was confirmed in chat with the user's footer and selective-title-bar changes. Stage 2 was confirmed with “confirm and go”. The recommended 64-slide solution was completed and exported; its source, notes, and validation records are retained in this project.
