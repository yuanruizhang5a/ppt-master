# output_R1

|About this course|||
|---|---|---|
|• Title: Foundations of Theorem Proving and Program Verification<br>• Topics: Theorem proving techniques based on Rocq, and its applications on<br>program verification.<br>• Teacher: Yuanrui Zhang Email: yuanruizhang@nuaa.edu.cn<br>• Textbook: Software Foundations (Volume 1). University of Pennsylvania.<br>Online-free Textbook. Last update: 2026-01-09. By Benjamin C. Pierce, et<br>al.<br>• Textbook link: https://softwarefoundations.cis.upenn.edu/<br>• References:<br>1 Carlo Angiuli, Daniel Gratzer. Principles of Dependent Type Theory. To<br>appear, Cambridge University Press. Last update: 2026.<br>2 Yves Bertot, Pierre Casteran, et al. Coq’s Art: The Calculus of Inductive<br>Constructions. 2004.|||
|Yuanrui Zhang|Theorem Proving|1 / 54|
|Basis for Grading|||
|---|---|---|
|• Class Performance: 50%<br>• Attendance is very important!<br>• About asking for a leave<br>• Homework quality<br>• Oral speech<br>• In-class Exercises: 20%<br>• Final Project: 30%|||
|Yuanrui Zhang|Theorem Proving|2 / 54|
|Rough Syllabus|||
|---|---|---|
|!++@inst[make it a two-column layout]<br>1 Introduction<br>2 Basic Introduction to Rocq<br>3 Recursion I: Proof Methods<br>4 Data Structures: Lists and Maps<br>5 Polymorphism and Higher-Order Functions<br>6 Proof Strategies<br>7 Logical Theories in Rocq<br>8 Inductive Propositions<br>9 Curry-Howard Correspondence<br>10 Recursion II: Principles<br>11 Rocq Implementation: An Imperative Program<br>++! We will introduce the theories, but spend more time on practicing:<br>How to do theorem proving in Rcoq.|||
|Yuanrui Zhang|Theorem Proving|3 / 54|
# A Brief Introduction to Theorem Proving

Yuanrui Zhang

<!-- Page 5 -->

|Outline|||
|---|---|---|
|1 What Is Theorem Proving?<br>2 Where Theorem Proving Helps<br>3 Comparing Verification Techniques<br>4 Theorem Provers<br>Foundations Applications Evidence Provers|||
|Yuanrui Zhang|Theorem Proving|5 / 54|
|Why Trust a Proof?|||
|---|---|---|
|MATH PROGRAMS<br>Can a Can software<br>computer check guarantees survive<br>every step of compilation and<br>an argument? deployment?<br>TRUST<br>Which evidence<br>fits testing,<br>model checking,<br>or proof?<br>TOOLS|||
|Yuanrui Zhang|Theorem Proving|6 / 54|
|Lecture Roadmap|||
|---|---|---|
|Evidence<br>Logical inference testing,<br>to theorem proving checking, proving<br>1 2 3 4<br>Applications Systems<br>mathematics Isabelle, Rocq, Lean<br>and software|||
|Yuanrui Zhang|Theorem Proving|7 / 54|
|Learning Objectives|||
|---|---|---|
|Defni e Compare<br>logical inference, proof search, and testing, model checking, and<br>theorem proving theorem proving<br>Explain Relate<br>how a kernel checks proof evidence Isabelle/HOL, Rocq, and Lean<br>Recognize<br>Conceptual orientation today;<br>mathematical and software proof engineering follows.<br>verifciation applications|||
|Yuanrui Zhang|Theorem Proving|8 / 54|
|What Is Theorem Proving?|||
|---|---|---|
|Theorem proving is a subfield of automated reasoning and mathematical logic<br>dealing with proving mathematical theorems by computer programs.<br>— Wikipedia<br>Questions:<br>• What is reasoning?<br>• What is automatic reasoning?<br>Concepts:<br>• Logical Inference<br>• Proof<br>• Proof Search|||
|Yuanrui Zhang|Theorem Proving|9 / 54|
|Logical Inference|||
|---|---|---|
|An inference is a step in logical reasoning.<br>• Two types of arguments: premise & conclusion<br>• Reason from several premises to a conclusion<br>• Often expressed in a form:<br>P ... P<br>1 n<br>C<br>• Meaning: If the premises P 1, ..., P hold, then the conclusion C holds.<br>n<br>• Or in a form:<br>C ,<br>when there are no premises.|||
|Yuanrui Zhang|Theorem Proving|10 / 54|
|For example:<br>• Premises: P and P →Q<br>• Conclusion: Q<br>• Meaning: If P and P →Q holds,<br>P P →Q then Q holds.<br>Example<br>Q P: It is sunny.<br>Q: I do a running outside.<br>modus ponens Sentence: If it is sunny, and if that it is<br>sunny implies that I do a running<br>outside, then we know that I do a<br>running outside.<br>Sources: ADDED_CONTENT_SOURCES.md § 1|||
|Yuanrui Zhang|Theorem Proving|11 / 54|
|Proof|||
|---|---|---|
|A (mathematical) proof is a sequence of logical arguments: I , ..., I , where<br>1 n<br>• I is the result of the proof, called the “goal”<br>n<br>• Each I is the conclusion of a logical inference:<br>i<br>• I is the conclusion of an axiom:<br>i<br>I ,<br>i<br>• I is the conclusion of some premises I k1, ..., I (k < ..., < k < i)<br>i kn 1 n<br>I ... I<br>k1 kn<br>I .<br>i<br>!++@inst[move this part into a new frame. Give the sequence of arguments for<br>the proof before introducing I 1, ..., I respectively. ] Example: Let P: it is sunny; Q:<br>5<br>I go outside; R: I wear shoes.<br>I = P I = P →Q I = Q →R (given premises)<br>1 2 3<br>I = Q (I 1, I : modus ponens) I = R (I 4, I : modus ponens).<br>4 2 5 3<br>The goal is I = R: I wear shoes. ++!<br>5|||
|Yuanrui Zhang|Theorem Proving|12 / 54|
|A proof is often expressed as a tree structure:<br>• The root of the tree is the goal I<br>n<br>• Each node (argument) is either<br>• a leaf (an axiom or a stated premise)<br>• an intermediate node<br>Example:<br>I : P I : P →Q<br>1 2<br>I : Q I : Q →R<br>4 3<br>I : R<br>5 !++@inst List beside the graph the same<br>inference made by “begin infer” and “end infer” in latex. ++!<br>Leaves are the given premises. Each internal node uses modus ponens.|||
|Yuanrui Zhang|Theorem Proving|13 / 54|
|Proof Search|||
|---|---|---|
|How to conduct automatic reasoning?<br>• What does this mean?<br>• Given a goal G we want to prove, how to automatically construct a proof?<br>• This process is called “proof searching”|||
|Yuanrui Zhang|Theorem Proving|14 / 54|
|A proof search is the process of constructing a proof tree of a goal<br>• It is an algorithm, can be implemented as a computer program<br>• Starting from the goal (i.e. the root of the proof tree)<br>• at each step, find a suitable inference that matches the current node<br>• ends until we can construct a valid proof tree<br>Example:<br>A tiny backward-search algorithm (facts and rules A → B)<br>1 To prove G, succeed immediately if G is a given fact.<br>2 Otherwise try each rule A →G; recursively try to prove A.<br>3 Skip goals already on this branch; if a choice fails, try another rule.<br>4 Return a proof when a choice succeeds; fail if all choices fail.|||
|Yuanrui Zhang|Theorem Proving|15 / 54|
|Proof Search: Work Backward, Build Forward|||
|---|---|---|
|Given facts and rules<br>P, P →Q, Q →R. Goal: R.<br>1 Need R: choose Q →R; the remaining goal is Q.<br>2 Need Q: choose P →Q; the remaining goal is P.<br>3 P is given: close this branch.<br>4 Build the proof forward: infer Q from P, then R from Q.<br>Q →R P →Q<br>Goal R Need Q Fact P|||
|Yuanrui Zhang|Theorem Proving|16 / 54|
|What is Theorem Proving|||
|---|---|---|
|Let us understand this concept again, we can say:<br>Theorem proving is about proof-searching techniques for constructing<br>mathematical proofs.|||
|Yuanrui Zhang|Theorem Proving|17 / 54|
What Is Theorem Proving?

PART I

# What Is Theorem Proving?

a complete proof one valid step Begin with one valid step; then ask how steps become a proof.

<!-- Page 19 -->

|Where Theorem Proving Helps|||
|---|---|---|
|Why theorem proving is useful?<br>• In mathematics<br>• In computer science|||
|Yuanrui Zhang|Theorem Proving|19 / 54|
|Where Theorem Proving Helps: In Mathematics|||
|---|---|---|
|Four Color Theorem<br>• proposed in 1852 by Francis Guthrie<br>• proved assisted by computer in 1976<br>• formally stated & proved in Rocq in 2005<br>• 633 cases; 60,000 lines of Rocq code; 1000 definitions; 2500 lemmas<br>Other Theorems<br>• Robbins conjecture: every Robbins algebra is Boolean — 1996, by EQP<br>• A quasigroup satisfying a Moufang identity is a loop — 1996, by Otter<br>• Structure of F-quasigroups / solution of Belousov’s problem — 2005, by<br>Otter<br>• First inner five-segment theorem in Tarski geometry — 2019, by E<br>• ......<br>Check: https://1000-plus.github.io/?utm source=chatgpt.com<br>_|||
|Yuanrui Zhang|Theorem Proving|20 / 54|
|Powered by LLM, theorem proving becomes more powerful!<br>• Chatgpt Pro, Opus, etc.<br>• OpenGauss — Claude/Codex-like coding agent + Lean + multi-agent<br>orchestration<br>• MerLean Prover — Claude Code skills/subagents + Lean 4/Mathlib +<br>recursive proof-plan graph + Planning Agents<br>• Aristotle — Specialized Lean proof-search system + informal LLM reasoning<br>+ dedicated geometry solver + formal verification<br>• OpenAI (26 Oct 2026) reports proofs of local smoothing in all dimensions<br>and a refutation of ETH, with Lean artifacts; details follow.|||
|Yuanrui Zhang|Theorem Proving|21 / 54|
|OpenAI: New AI-Generated Mathematics (26 Oct 2026)|||
|---|---|---|
|• Harmonic analysis: OpenAI reports local smoothing in every dimension,<br>implying Kakeya and restriction results.<br>• Complexity theory: it reports a refutation of the Exponential Time<br>Hypothesis (ETH).<br>• Natural-language writeups and Lean proofs are publicly linked; external<br>researchers are examining the results.<br>How to read the news<br>These are reported research results. Checking a formal statement and<br>understanding its mathematical significance are separate tasks.<br>Source: OpenAI announcement, 26 October 2026|||
|Yuanrui Zhang|Theorem Proving|22 / 54|
|Where Theorem Proving Helps: In Computer Science|||
|---|---|---|
|Software verification is always a big issue!<br>• Ariane 5 Flight 501 — Rocket destroyed 37 seconds after launch (1996)<br>• What went wrong: Guidance software converted a 64-bit floating-point value<br>into a 16-bit signed integer.<br>• Mars Climate Orbiter — Spacecraft lost because of unit mismatch (1999)<br>• What went wrong: Two parts of the software system used different units.|||
|Yuanrui Zhang|Theorem Proving|23 / 54|
|• Boeing 737 MAX — MCAS contributed to two fatal crashes (2018–2019)<br>• What went wrong: MCAS could rely on erroneous input from a single<br>angle-of-attack sensor and repeatedly command the aircraft’s nose downward.<br>• Toyota Unintended Acceleration — Fatal crash linked to electronic<br>throttle-control software in litigation (2007/2013)<br>• What went wrong: Software defects could cause critical throttle-control tasks<br>to fail without being reliably detected by the system’s fail-safes, potentially<br>resulting in unintended acceleration.|||
|Yuanrui Zhang|Theorem Proving|24 / 54|
|LLMs and Software Verification: Recent Results|||
|---|---|---|
|Anthropic + Theorem, 22 October 2026 (source checked 4 November).<br>• RISC-V binaries: Claude produced Rocq-checked proofs for 239 entry points<br>across 123 open-source libraries.<br>• Scope: no-crash properties for bounded inputs (under 64 MB),<br>single-threaded static binaries, and modeled Linux behavior.<br>• Other case studies: zlib binary correctness against a format specification; a<br>Rust Python interpreter verified with Verus against formal semantics.<br>Assumptions remain part of the guarantee<br>This verifies selected properties of library binaries, rather than every behavior of an<br>entire RISC-V system.<br>Source: Anthropic, “LLMs are making formal software verification feasible at a much larger scale”|||
|Yuanrui Zhang|Theorem Proving|25 / 54|
|Program A: A Saturating Increment|||
|---|---|---|
|Contract to assure<br>A(x): For every integer input,<br>if x < 3 then<br>0 ≤x ≤3 =⇒ 1 ≤A(x) ≤3.<br>r := x + 1<br>else<br>• The result always stays inside the safe<br>r := 3<br>range<br>return r<br>• Repeated calls move toward 3, then<br>remain there|||
|Yuanrui Zhang|Theorem Proving|26 / 54|
|Theorem Proving Program A: Deduction Covers All Inputs|||
|---|---|---|
|Two branch deductions<br>x ∈Z 0 ≤x x < 3 x ≥3 x ≤3<br>then else<br>1 ≤x + 1 ≤3 1 ≤3 ≤3<br>Case rule establishes the contract<br>x < 3 : 1 ≤x + 1 ≤3 x ≥3 : 1 ≤3 ≤3<br>if<br>0 ≤x ≤3 =⇒ 1 ≤A(x) ≤3<br>• Advantage: one symbolic argument covers every allowed x.<br>• Cost: the semantics, contract, and deductions must be formalized.|||
|Yuanrui Zhang|Theorem Proving|27 / 54|
|One Program, Three Assurance Questions|||
|---|---|---|
|Technique Question for Program A Evidence Main boundary<br>Testing Did selected inputs return Concrete executions of the Untested inputs remain<br>safe results? implementation<br>Model checking Are all states in the finite Exhaustive state exploration; State explosion and model<br>model safe? counterexample on failure fidelity<br>Theorem proving Is the contract true for Symbolic deduction checked Formalization and proof<br>every permitted x? from rules effort<br>Same target, different coverage<br>Sample executions, exhaust a finite model, or prove a quantifeid claim.|||
|Yuanrui Zhang|Theorem Proving|28 / 54|
|Testing: Execute Selected Behaviors|||
|---|---|---|
|Test cases Run A Observe Test oracle<br>x = 0, 1, 3 real code r = 1, 2, 3 check 1 ≤r ≤3<br>• A failing run is a concrete counterexample to the expected behavior<br>• Passing runs establish only the cases that were actually executed<br>• Coverage criteria guide sampling; they do not turn samples into a proof|||
|Yuanrui Zhang|Theorem Proving|29 / 54|
|Testing Program A: Useful Evidence, Incomplete Coverage|||
|---|---|---|
|Why testing helps<br>It runs the real implementation and is<br>x observed A(x) safe?<br>inexpensive to automate.<br>0 1 yes<br>1 2 yes Compared with theorem proving<br>2 – untested<br>Three passing cases do not justify “for every<br>3 3 yes x.” The proof covers the missing case<br>symbolically, but requires a formal model<br>and contract.|||
|Yuanrui Zhang|Theorem Proving|30 / 54|
|Model Checking: Explore a Finite State Graph|||
|---|---|---|
|• States represent possible<br>values of x<br>• Edges represent one<br>execution of A<br>0 A 1 A 2 A 3 A • A search visits every<br>reachable state and transition<br>safe states 0 . . . 3<br>• Reaching an unsafe state<br>would produce a<br>counterexample path|||
|Yuanrui Zhang|Theorem Proving|31 / 54|
|Model Checking Program A: Exhaustive Within the Model|||
|---|---|---|
|Advantage over testing<br>Every state and transition in this finite model<br>is checked automatically.<br>state x next A(x) 1 ≤A(x) ≤3<br>0 1 yes<br>Compared with theorem proving<br>1 2 yes<br>2 3 yes Larger programs suffer state explosion, and<br>3 3 yes<br>the result covers the model. A symbolic<br>proof can quantify beyond four states, but<br>usually needs more specification and proof<br>guidance.|||
|Yuanrui Zhang|Theorem Proving|32 / 54|
|Logical Inference: One Valid Step|||
|---|---|---|
|• Premises: P and P →Q<br>P P →Q<br>• Modus ponens infers Q<br>Validity<br>Q<br>True premises cannot lead to a false<br>modus ponens conclusion.<br>Sources: ADDED_CONTENT_SOURCES.md § 1|||
|Yuanrui Zhang|Theorem Proving|33 / 54|
|Inference Is a Step; Proof Search Chooses Steps|||
|---|---|---|
|• Inference applies one sound rule<br>to available facts<br>Goal G<br>• Proof search sequences rules<br>toward a goal<br>Rule A Rule B<br>• Backward search replaces a goal<br>with sufficient subgoals G1 ✓ G2 ✓ loop ?<br>• Automation controls branching,<br>looping, and redundant<br>Search problem<br>alternatives<br>Legal moves are not yet a strategy.<br>Sources: ADDED_CONTENT_SOURCES.md § 2|||
|Yuanrui Zhang|Theorem Proving|34 / 54|
|What Theorem Proving Does|||
|---|---|---|
|Development<br>Statement Kernel<br>manual, Proof term<br>defniitions, independent Accepted<br>interactive, evidence<br>assumptions, claims check<br>automatic<br>Assurance contract<br>A small kernel rejects invalid proof terms; accepted claims are relative to the<br>chosen logic, definitions, axioms, and assumptions.<br>Sources: ADDED_CONTENT_SOURCES.md § 3|||
|Yuanrui Zhang|Theorem Proving|35 / 54|
# Where Theorem Proving Helps

PART II

# Where Theorem Proving Helps + ∀n P(n)

*{**P**}* *C* *{**Q**}* software contracts formal mathematics One pattern: define, state, construct evidence, check.

<!-- Page 37 -->

|Formal Mathematics: The Four-Color Theorem|||
|---|---|---|
|• Every planar map needs at most four<br>colors<br>• Adjacent regions must receive<br>different colors<br>• Gonthier reconstructed the argument<br>as a Rocq-checked formal proof<br>• Verified computation handled Self-authored planar-map sketch<br>hundreds of reducible configurations (not geographic data)<br>Sources: ADDED_CONTENT_SOURCES.md § 4|||
|Yuanrui Zhang|Theorem Proving|37 / 54|
|Recent Formal Mathematics: Liquid Tensor Experiment|||
|---|---|---|
|• Lean completed the Liquid Tensor<br>Experiment in July 2022 mathematical exposition<br>• It formalized a theorem about Blueprint 1 Blueprint 2 Blueprint 3<br>liquid vector spaces<br>• The effort finished eighteen months<br>Lean decl. A Lean decl. B Lean decl. C<br>after Scholze’s challenge<br>formal declarations<br>• A blueprint linked exposition to<br>machine-checked declarations<br>Sources: ADDED_CONTENT_SOURCES.md § 5|||
|Yuanrui Zhang|Theorem Proving|38 / 54|
|CompCert: A Verified Optimizing Compiler|||
|---|---|---|
|• CompCert targets almost all ISO C and several architectures<br>• Rocq proves semantic preservation from source C to assembly<br>• Verified source properties carry to generated executable code<br>C source Verified passes Assembly<br>semantic-preservation theorem<br>Assurance boundary<br>The guarantee addresses compiler-introduced miscompilation; it does not prove<br>arbitrary source programs correct.<br>Sources: ADDED_CONTENT_SOURCES.md § 6|||
|Yuanrui Zhang|Theorem Proving|39 / 54|
|seL4: A Verified Operating-System Kernel|||
|---|---|---|
|Abstract specification<br>• Verified C implementations refine an<br>abstract kernel specification<br>Executable specification<br>• Selected configurations extend<br>correctness to binary code<br>C implementation<br>• Security proofs cover integrity,<br>confidentiality, and availability<br>Binary code<br>• Hardware and low-level components<br>remain explicit assumptions<br>Hardware, setup, and<br>low-level assumptions<br>Sources: ADDED_CONTENT_SOURCES.md § 7|||
|Yuanrui Zhang|Theorem Proving|40 / 54|
|Program Verification: Code Against a Contract|||
|---|---|---|
|• Specify behavior with preconditions,<br>{x = n} postconditions, and invariants<br>x := x + 1; • Translate annotated code into logical<br>proof obligations<br>{x = n + 1}<br>• Discharge obligations using provers or<br>automated solvers<br>• Conclude correctness relative to the<br>contract →code →obligation<br>specification and semantics<br>Sources: ADDED_CONTENT_SOURCES.md § 8|||
|Yuanrui Zhang|Theorem Proving|41 / 54|
# Comparing Verification Techniques

PART III

# Comparing Verification Techniques

**SAMPLE** **EXPLORE** **PROVE** testing model checking theorem proving Sources: ADDED_CONTENT_SOURCES.md §§ 9–11

<!-- Page 43 -->

|Testing: Concrete Executions|||
|---|---|---|
|• Tests execute selected inputs and<br>compare observed outcomes tested points<br>• A failing test demonstrates a defect<br>• Passing tests sample only a tiny<br>behavior space<br>• Testing remains essential, but rarely<br>possible input space<br>proves universal correctness<br>Sources: ADDED_CONTENT_SOURCES.md § 9|||
|Yuanrui Zhang|Theorem Proving|43 / 54|
|Model Checking: Exhaust a Finite Model|||
|---|---|---|
|request<br>• Represent behavior as a finite-state<br>idle Safe Waiting<br>transition graph<br>grant<br>• Express desired behavior using<br>bad transition temporal logic<br>• Algorithms check every modeled state<br>Error<br>• Failures yield diagnostic<br>counterexample executions<br>counterexample path<br>Sources: ADDED_CONTENT_SOURCES.md § 10|||
|Yuanrui Zhang|Theorem Proving|44 / 54|
|Three Complementary Kinds of Evidence|||
|---|---|---|
|Technique Evidence scope Typical strength Main boundary<br>Testing Selected executions Real implementation behavior Incomplete input coverage<br>Model checking Finite-state model Exhaustive automated State explosion and<br>exploration abstraction<br>Theorem proving Symbolic formal model Quantified, parameterized Specification and proof effort<br>claims<br>Teaching synthesis<br>These techniques answer different questions; strong assurance often combines evidence.<br>Sources: ADDED_CONTENT_SOURCES.md § 11|||
|Yuanrui Zhang|Theorem Proving|45 / 54|
# Theorem Provers

PART IV

# Theorem Provers

**Isabelle/HOL** **Rocq** **Lean** Foundations, interaction, automation, trusted checking.

<!-- Page 47 -->

|Isabelle/HOL in One Slide|||
|---|---|---|
|• Isabelle is a generic interactive<br>theorem-proving framework<br>Isabelle framework • Isabelle/HOL specializes it to<br>classical higher-order logic<br>HOL object logic<br>• Isar supports readable, structured<br>Isar Sledgehammer proof documents<br>structured proofs ATP connection<br>• Sledgehammer connects goals with<br>powerful automatic provers<br>Sources: ADDED_CONTENT_SOURCES.md § 12|||
|Yuanrui Zhang|Theorem Proving|47 / 54|
|Rocq in One Slide|||
|---|---|---|
|• Rocq was formerly called the Coq<br>Proof Assistant OCaml<br>extract<br>Gallina definitions Haskell<br>• Gallina rests on polymorphic, Scheme<br>cumulative inductive<br>Tactics<br>constructions<br>• Tactics build proof terms checked<br>Proof term<br>by a small kernel<br>• Extraction targets OCaml, Kernel check<br>Haskell, and Scheme<br>Sources: ADDED_CONTENT_SOURCES.md § 13|||
|Yuanrui Zhang|Theorem Proving|48 / 54|
|Why Rocq and Lean Feel Similar|||
|---|---|---|
|• Both are interactive provers based<br>on dependent type theory<br>Rocq Lean<br>• Both embed propositions and<br>proofs in expressive typed<br>dependent types<br>tactics languages<br>proof terms<br>inductive data • Both use tactics to construct<br>kernel-checked proof terms<br>• Both combine inductive data,<br>programs, proofs, and automation<br>Sources: ADDED_CONTENT_SOURCES.md § 14|||
|Yuanrui Zhang|Theorem Proving|49 / 54|
|Important Rocq–Lean Differences|||
|---|---|---|
|Dimension Rocq Lean<br>Core emphasis PCUIC Dependent type theory with primitive<br>quotients<br>Tactics Ltac and Ltac2 Programs written in Lean<br>Executable path Extraction to OCaml, Haskell, Scheme Module compilation through C<br>Practical consequence<br>Shared ideas do not make proof scripts portable line by line.<br>Sources: ADDED_CONTENT_SOURCES.md § 15|||
|Yuanrui Zhang|Theorem Proving|50 / 54|
|Synthesis: One Assurance Story|||
|---|---|---|
|Proof search<br>Inference organized<br>local valid steps derivations<br>Systems<br>CHECKABLE<br>Isabelle,<br>EVIDENCE<br>Rocq, Lean<br>Applications Evidence<br>math and software test, explore,<br>prove<br>Unifying principle<br>Every assurance claim depends on what was modeled, assumed, checked, or<br>executed.<br>Sources: ADDED_CONTENT_SOURCES.md §§ 1–15|||
|Yuanrui Zhang|Theorem Proving|51 / 54|
|Review Questions|||
|---|---|---|
|1 Why is an inference rule 2 What exactly does<br>different from proof search? CompCert guarantee—<br>and not guarantee?<br>3 When would model<br>checking outperform 4 Why can Rocq and<br>theorem proving? Lean feel similar yet<br>remain incompatible?<br>For each answer, name both a strength and a boundary.|||
|Yuanrui Zhang|Theorem Proving|52 / 54|
|Next Lecture: First Proofs in Rocq|||
|---|---|---|
|Proof state<br>Proposition Tactics Proof term<br>goals +<br>Gallina statement construct a proof kernel checked<br>hypotheses<br>• Express simple propositions in Gallina<br>• Inspect goals and hypotheses interactively<br>• Use tactics to construct a direct proof<br>• Connect the script to its kernel-checked proof term<br>Sources: ADDED_CONTENT_SOURCES.md § 13|||
|Yuanrui Zhang|Theorem Proving|53 / 54|
Questions?

Thank you! Questions welcome.

DISCUSSION What evidence would convince you to trust a critical program?
