[![Software Foundations Logo](Basics_files/image_001.png)](https://softwarefoundations.cis.upenn.edu)

[Volume 1: Logical Foundations](index.html)

- [Table of Contents](toc.html)
- [Index](coqindex.html)
- [Roadmap](deps.html)

# BasicsFunctional Programming in Rocq

# Introduction

The *functional style* of programming is founded on simple,
everyday mathematical intuitions: If a procedure or method has no
side effects, then (ignoring efficiency) all we need to understand
about it is how it maps inputs to outputs -- that is, we can think
of it as just a concrete method for computing a mathematical
function. This is one sense of the word "functional" in
"functional programming." The direct connection between programs
and simple mathematical objects supports both formal correctness
proofs and sound informal reasoning about program behavior.The other sense in which functional programming is "functional" is
that it emphasizes the use of functions as *first-class* values --
i.e., values that can be passed as arguments to other functions,
returned as results, included in data structures, etc. The
recognition that functions can be treated as data gives rise to a
host of useful and powerful programming idioms.Other common features of functional languages include *algebraic
data types* and *pattern matching*, which make it easy to
construct and manipulate rich data structures, and *polymorphic
type systems* supporting abstraction and code reuse. Rocq offers
all of these features.The first half of this chapter introduces some key elements of
Rocq's native functional programming language, *Gallina*. The
second half introduces some basic *tactics* that can be used to
prove properties of Gallina programs.

# Homework Submission Guidelines

If you are using *Software Foundations* in a course, your
instructor may use automatic scripts to help grade your homework
assignments. In order for these scripts to work correctly (and
ensure that you get full credit for your work!), please be
careful to follow these rules:

- Do not change the names of exercises. Otherwise the grading
  scripts will be unable to find your solution.
- Do not delete exercises. If you skip an exercise (e.g.,
  because it is marked "optional," or because you can't solve it),
  it is OK to leave a partial proof in your .v file; in
  this case, please make sure it ends with the keyword Admitted
  (not, for example, Abort).
- It is fine to use additional definitions (of helper functions,
  useful lemmas, etc.) in your solutions. You can put these
  before the theorem you are asked to prove.
- If you introduce a helper lemma that you end up being unable
  to prove, hence end it with Admitted, then make sure to also
  end the main theorem in which you use it with Admitted, not
  Qed. This will make sure you get partial credit if you
  use that main theorem to solve a later exercise.

You will also notice that each chapter (e.g., Basics.v) is
accompanied by a *test script* (e.g., BasicsTest.v) that
automatically calculates points for the finished homework problems
in the chapter. These scripts are mostly for the auto-grading
tools, but you may also want to use them to double-check that your
file is well formatted before handing it in. In a terminal
window, either type "make BasicsTest.vo" or do the following:
  
       rocq compile -Q . LF Basics.v  
       rocq compile -Q . LF BasicsTest.v
 See the end of this chapter for more information about how to interpret
the output of test scripts.There is no need to hand in BasicsTest.v itself (or Preface.v).If your class is using the Canvas system to hand in assignments...

- If you submit multiple versions of the assignment, you may
  notice that they are given different names. This is fine: The
  most recent submission is the one that will be graded.
- If you are handing in multiple files at the same time (i.e.,
  if more than one chapter is assigned in the same week), you
  should make a *single* submission with all the files at once
  by using the "Add another file" button just above the comment
  box.

# Data and Functions

## Enumerated Types

One notable thing about Rocq is that its set of built-in
features is *extremely* small. For example, instead of the usual
palette of atomic data types (booleans, integers, strings, etc.),
Rocq offers a powerful mechanism for defining new data types from
scratch, with all these familiar types as instances.Naturally, the Rocq distribution also comes with an extensive
standard library providing definitions of booleans, numbers, and
many common data structures like lists and hash tables. But there
is nothing magic or primitive about these library definitions. To
illustrate this, in this course we will explicitly recapitulate
almost all the definitions we need, rather than getting them
from the standard library.

## Days of the Week

To see how the datatype definition mechanism works, let's
start with a very simple example. The following declaration tells
Rocq that we are defining a set of data values -- a *type*.

Inductive [day](#day) : Type :=  
  | [monday](#monday)  
  | [tuesday](#tuesday)  
  | [wednesday](#wednesday)  
  | [thursday](#thursday)  
  | [friday](#friday)  
  | [saturday](#saturday)  
  | [sunday](#sunday).

The new type is called day, and its members are monday,
tuesday, etc.Having defined day, we can write functions that operate on
days.

Definition [next\_working\_day](#next_working_day) ([d](#d:3):[day](Basics.html#day)) : [day](Basics.html#day) :=  
  match [d](Basics.html#d:3) with  
  | [monday](Basics.html#monday) ⇒ [tuesday](Basics.html#tuesday)  
  | [tuesday](Basics.html#tuesday) ⇒ [wednesday](Basics.html#wednesday)  
  | [wednesday](Basics.html#wednesday) ⇒ [thursday](Basics.html#thursday)  
  | [thursday](Basics.html#thursday) ⇒ [friday](Basics.html#friday)  
  | [friday](Basics.html#friday) ⇒ [monday](Basics.html#monday)  
  | [saturday](Basics.html#saturday) ⇒ [monday](Basics.html#monday)  
  | [sunday](Basics.html#sunday) ⇒ [monday](Basics.html#monday)  
  end.

Note that the argument and return types of this function are
explicitly declared on the first line. Like most functional
programming languages, Rocq can often figure out these types for
itself when they are not given explicitly -- i.e., it can do *type
inference* -- but we'll generally include them to make reading
easier.Having defined a function, we can check that it works on
some examples. There are actually three different ways to do
examples in Rocq. First, we can use the command Compute to
evaluate a compound expression involving next\_working\_day.

Compute ([next\_working\_day](Basics.html#next_working_day) [friday](Basics.html#friday)).  
(\* ==> monday : day \*)  

---

Compute ([next\_working\_day](Basics.html#next_working_day) ([next\_working\_day](Basics.html#next_working_day) [saturday](Basics.html#saturday))).  
(\* ==> tuesday : day \*)

(We show Rocq's responses in comments; if you have a computer
handy, this would be an excellent moment to fire up the Rocq
interpreter under your favorite IDE (see the [Preface](Preface.html) for
installation instructions) and try it for yourself. Load this
file, Basics.v, from the book's Rocq sources, find the above
example, submit it to Rocq, and observe the result.)Second, we can record what we *expect* the result to be in the
form of a Rocq "example":

Example [test\_next\_working\_day](#test_next_working_day):  
  [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[next\_working\_day](Basics.html#next_working_day) ([next\_working\_day](Basics.html#next_working_day) [saturday](Basics.html#saturday))[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [tuesday](Basics.html#tuesday).

This declaration does two things: it makes an assertion
(that the second working day after saturday is tuesday), and it
gives the assertion a name that can be used to refer to it later.
Having made the assertion, we can also ask Rocq to *verify* it, like
this:

Proof. simpl. reflexivity. Qed.

The details are not important just now, but essentially this
little script can be read as "The assertion we've just made can be
proved by observing that both sides of the equality evaluate to
the same thing."Third, we can ask Rocq to *extract*, from our Definition, a
program in a more conventional programming language (OCaml,
Scheme, or Haskell) with a high-performance compiler. This
facility is very useful, since it gives us a path from
proved-correct algorithms written in Gallina to efficient machine
code.(Of course, we are trusting the correctness of the
OCaml/Haskell/Scheme compiler, and of Rocq's extraction facility
itself, but this is still a big step forward from the way most
software is developed today!)Indeed, this is one of the main uses for which Rocq was developed.
We'll come back to this topic in later chapters.The Require Export statement on the next line tells Rocq to use
the String module from the standard library. We'll use strings
for various things in later chapters, but we need to Require it here so
that the grading scripts can use it for internal purposes.

From Stdlib Require Export [String](https://rocq-prover.org/doc/V9.0.0/stdlib//Stdlib.Strings.String.html#).

## Booleans

Following the pattern of the days of the week above, we can
define the standard type bool of booleans, with members true
and false.

Inductive [bool](#bool) : Type :=  
  | [true](#true)  
  | [false](#false).

Functions over booleans can be defined in the same way as
above:

Definition [negb](#negb) ([b](#b:7):[bool](Basics.html#bool)) : [bool](Basics.html#bool) :=  
  match [b](Basics.html#b:7) with  
  | [true](Basics.html#true) ⇒ [false](Basics.html#false)  
  | [false](Basics.html#false) ⇒ [true](Basics.html#true)  
  end.  

---

Definition [andb](#andb) ([b1](#b<sub>1</sub>:9):[bool](Basics.html#bool)) ([b2](#b<sub>2</sub>:10):[bool](Basics.html#bool)) : [bool](Basics.html#bool) :=  
  match [b1](Basics.html#b<sub>1</sub>:9) with  
  | [true](Basics.html#true) ⇒ [b2](Basics.html#b<sub>2</sub>:10)  
  | [false](Basics.html#false) ⇒ [false](Basics.html#false)  
  end.  

---

Definition [orb](#orb) ([b1](#b<sub>1</sub>:12):[bool](Basics.html#bool)) ([b2](#b<sub>2</sub>:13):[bool](Basics.html#bool)) : [bool](Basics.html#bool) :=  
  match [b1](Basics.html#b<sub>1</sub>:12) with  
  | [true](Basics.html#true) ⇒ [true](Basics.html#true)  
  | [false](Basics.html#false) ⇒ [b2](Basics.html#b<sub>2</sub>:13)  
  end.

(Although we are rolling our own booleans here for the sake
of building up everything from scratch, Rocq does, of course,
provide a default implementation of the booleans, together with a
multitude of useful functions and lemmas. Wherever possible,
we've named our own definitions and theorems to match the ones in
the standard library.)The last two of these illustrate Rocq's syntax for
multi-argument function definitions. The corresponding
multi-argument *application* syntax is illustrated by the
following "unit tests," which constitute a complete specification
a truth table -- for the orb function:

Example [test\_orb1](#test_orb1): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[orb](Basics.html#orb) [true](Basics.html#true) [false](Basics.html#false)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
Proof. simpl. reflexivity. Qed.  
Example [test\_orb2](#test_orb2): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[orb](Basics.html#orb) [false](Basics.html#false) [false](Basics.html#false)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
Proof. simpl. reflexivity. Qed.  
Example [test\_orb3](#test_orb3): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[orb](Basics.html#orb) [false](Basics.html#false) [true](Basics.html#true)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
Proof. simpl. reflexivity. Qed.  
Example [test\_orb4](#test_orb4): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[orb](Basics.html#orb) [true](Basics.html#true) [true](Basics.html#true)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
Proof. simpl. reflexivity. Qed.

We can also introduce more familiar and readable infix
syntax for the boolean operations we have just defined. The
Notation command defines a new symbolic notation for an existing
definition.

Notation ["](#:::x_'&&'_x)x && y" := ([andb](Basics.html#andb) x y).  
Notation ["](#34428c8531fd724748c0ebf19a35c764)x || y" := ([orb](Basics.html#orb) x y).  

---

Example [test\_orb5](#test_orb5): [false](Basics.html#false) [||](Basics.html#34428c8531fd724748c0ebf19a35c764) [false](Basics.html#false) [||](Basics.html#34428c8531fd724748c0ebf19a35c764) [true](Basics.html#true) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
Proof. simpl. reflexivity. Qed.

*A note on notation*: In .v files, we use square brackets
to delimit fragments of Rocq code within comments; this
convention, also used by the rocq doc documentation tool, keeps
them visually separate from the surrounding text. In the HTML
version of the files, these pieces of text appear in a different
font (and without the brackets).These examples are also an opportunity to introduce one more
feature of Rocq's programming language: conditional expressions...

Definition [negb'](#negb') ([b](#b:15):[bool](Basics.html#bool)) : [bool](Basics.html#bool) :=  
  if [b](Basics.html#b:15) then [false](Basics.html#false)  
  else [true](Basics.html#true).  

---

Definition [andb'](#andb') ([b1](#b<sub>1</sub>:16):[bool](Basics.html#bool)) ([b2](#b<sub>2</sub>:17):[bool](Basics.html#bool)) : [bool](Basics.html#bool) :=  
  if [b1](Basics.html#b<sub>1</sub>:16) then [b2](Basics.html#b<sub>2</sub>:17)  
  else [false](Basics.html#false).  

---

Definition [orb'](#orb') ([b1](#b<sub>1</sub>:18):[bool](Basics.html#bool)) ([b2](#b<sub>2</sub>:19):[bool](Basics.html#bool)) : [bool](Basics.html#bool) :=  
  if [b1](Basics.html#b<sub>1</sub>:18) then [true](Basics.html#true)  
  else [b2](Basics.html#b<sub>2</sub>:19).

Rocq's conditionals are exactly like those found in any other
language, with one small generalization:Since the bool type is not built in, Rocq actually supports
conditional expressions over *any* inductively defined type with
exactly two clauses in its definition. The guard is considered
true if it evaluates to the "constructor" of the first clause of
the Inductive definition (which happens to be called true in
this case) and false if it evaluates to the second.For example we can define the following datatype bw, with
two constructors representing black (b) and white (w) and
define a function invert that inverts values of this type using
a conditional.

Inductive [bw](#bw) : Type :=  
  | [bw\_black](#bw_black)  
  | [bw\_white](#bw_white).  

---

Definition [invert](#invert) ([x](#x:22): [bw](Basics.html#bw)) : [bw](Basics.html#bw) :=  
  if [x](Basics.html#x:22) then [bw\_white](Basics.html#bw_white)  
  else [bw\_black](Basics.html#bw_black).  

---

Compute ([invert](Basics.html#invert) [bw\_black](Basics.html#bw_black)).  
(\* ==> bw\_white : bw \*)  

---

Compute ([invert](Basics.html#invert) [bw\_white](Basics.html#bw_white)).  
(\* ==> bw\_black : bw \*)

#### Exercise: 1 star, standard (nandb)

The Admitted command can be used as a placeholder for an
incomplete proof. We use it in exercises to indicate the parts
that we're leaving for you -- i.e., your job is to replace
Admitteds with real proofs.Remove "Admitted." below and complete the definition of the
following function; then make sure that the Example assertions
below can each be verified by Rocq. (I.e., fill in each proof,
following the model of the orb tests above, and make sure Rocq
accepts it.) The function should return true if either or both
of its inputs are false.Hint: if simpl will not simplify the goal in your proof, it's
probably because you defined nandb without using a match
expression. Try a different definition of nandb, or just skip
over simpl and go directly to reflexivity. We'll explain
what's happening later in the chapter.

Definition [nandb](#nandb) ([b1](#b<sub>1</sub>:23):[bool](Basics.html#bool)) ([b2](#b<sub>2</sub>:24):[bool](Basics.html#bool)) : [bool](Basics.html#bool)  
  (\* REPLACE THIS LINE WITH ":= \_your\_definition\_ ." \*). Admitted.  

---

Example [test\_nandb1](#test_nandb1): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[nandb](Basics.html#nandb) [true](Basics.html#true) [false](Basics.html#false)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
(\* FILL IN HERE \*) Admitted.  
Example [test\_nandb2](#test_nandb2): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[nandb](Basics.html#nandb) [false](Basics.html#false) [false](Basics.html#false)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
(\* FILL IN HERE \*) Admitted.  
Example [test\_nandb3](#test_nandb3): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[nandb](Basics.html#nandb) [false](Basics.html#false) [true](Basics.html#true)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
(\* FILL IN HERE \*) Admitted.  
Example [test\_nandb4](#test_nandb4): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[nandb](Basics.html#nandb) [true](Basics.html#true) [true](Basics.html#true)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
(\* FILL IN HERE \*) Admitted.  
☐

#### Exercise: 1 star, standard (andb3)

Do the same for the andb3 function below. This function should
return true when all of its inputs are true, and false
otherwise.

Definition [andb3](#andb3) ([b1](#b<sub>1</sub>:25):[bool](Basics.html#bool)) ([b2](#b<sub>2</sub>:26):[bool](Basics.html#bool)) ([b3](#b<sub>3</sub>:27):[bool](Basics.html#bool)) : [bool](Basics.html#bool)  
  (\* REPLACE THIS LINE WITH ":= \_your\_definition\_ ." \*). Admitted.  

---

Example [test\_andb31](#test_andb31): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[andb3](Basics.html#andb3) [true](Basics.html#true) [true](Basics.html#true) [true](Basics.html#true)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
(\* FILL IN HERE \*) Admitted.  
Example [test\_andb32](#test_andb32): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[andb3](Basics.html#andb3) [false](Basics.html#false) [true](Basics.html#true) [true](Basics.html#true)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
(\* FILL IN HERE \*) Admitted.  
Example [test\_andb33](#test_andb33): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[andb3](Basics.html#andb3) [true](Basics.html#true) [false](Basics.html#false) [true](Basics.html#true)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
(\* FILL IN HERE \*) Admitted.  
Example [test\_andb34](#test_andb34): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[andb3](Basics.html#andb3) [true](Basics.html#true) [true](Basics.html#true) [false](Basics.html#false)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
(\* FILL IN HERE \*) Admitted.  
☐

## Types

Every expression in Rocq has a type describing what sort of
thing it computes. The Check command asks Rocq to print the type
of an expression.

Check [true](Basics.html#true).  
(\* ===> true : bool \*)

If the thing after Check is followed by a colon and a type
declaration, Rocq will verify that the type of the expression
matches the given type and signal an error if not.

Check [true](Basics.html#true)  
  : [bool](Basics.html#bool).  
Check ([negb](Basics.html#negb) [true](Basics.html#true))  
  : [bool](Basics.html#bool).

Functions like negb itself are also data values, just like
true and false. Their types are called *function types*, and
they are written with arrows.

Check [negb](Basics.html#negb)  
  : [bool](Basics.html#bool) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [bool](Basics.html#bool).

The type of negb, written bool → bool and pronounced
"bool arrow bool," can be read, "Given an input of type
bool, this function produces an output of type bool."
Similarly, the type of andb, written bool → bool → bool, can
be read, "Given two inputs, each of type bool, this function
produces an output of type bool."

## New Types from Old

The types we have defined so far are examples of simple
"enumerated types": their definitions explicitly enumerate a
finite set of elements, called *constructors*. Here is a more
interesting type definition, color, where one of the
constructors takes an argument:

Inductive [rgb](#rgb) : Type :=  
  | [red](#red)  
  | [green](#green)  
  | [blue](#blue).  

---

Inductive [color](#color) : Type :=  
  | [black](#black)  
  | [white](#white)  
  | [primary](#primary) ([p](#p:32) : [rgb](Basics.html#rgb)).

Let's look at this in a little more detail.An Inductive definition does two things:

- It introduces a set of new *constructors*. E.g., red,
  primary, true, false, monday, etc. are constructors.
- It groups them into a new named type, like bool, rgb, or
  color.

*Constructor expressions* are formed by applying a constructor
to zero or more other constructors or constructor expressions,
obeying the declared number and types of the constructor arguments.
E.g., these are valid constructor expressions...

- red
- true
- primary red
- etc.

...but these are not:

- red primary
- true red
- primary (primary red)
- etc.

In particular, the definitions of rgb and color say
which constructor expressions belong to the sets rgb and
color:

- red, green, and blue belong to the set rgb;
- black and white belong to the set color;
- if p is a constructor expression belonging to the set rgb,
  then primary p ("the constructor primary applied to the
  argument p") is a constructor expression belonging to the set
  color; and
- constructor expressions formed in these ways are the *only* ones
  belonging to the sets rgb and color.

We can define functions on colors using pattern matching just as
we did for day and bool.

Definition [monochrome](#monochrome) ([c](#c:33) : [color](Basics.html#color)) : [bool](Basics.html#bool) :=  
  match [c](Basics.html#c:33) with  
  | [black](Basics.html#black) ⇒ [true](Basics.html#true)  
  | [white](Basics.html#white) ⇒ [true](Basics.html#true)  
  | [primary](Basics.html#primary) p ⇒ [false](Basics.html#false)  
  end.

Since the primary constructor takes an argument, a pattern
matching primary should include either a variable, as we just
did (note that we can choose its name freely), or a constant of
appropriate type (as below).

Definition [isred](#isred) ([c](#c:35) : [color](Basics.html#color)) : [bool](Basics.html#bool) :=  
  match [c](Basics.html#c:35) with  
  | [black](Basics.html#black) ⇒ [false](Basics.html#false)  
  | [white](Basics.html#white) ⇒ [false](Basics.html#false)  
  | [primary](Basics.html#primary) [red](Basics.html#red) ⇒ [true](Basics.html#true)  
  | [primary](Basics.html#primary) \_ ⇒ [false](Basics.html#false)  
  end.

The pattern "primary \_" here is shorthand for "the constructor
primary applied to any rgb constructor except red."(The wildcard pattern \_ has the same effect as the dummy
pattern variable p in the definition of monochrome.)

## Modules

Rocq provides a *module system* to aid in organizing large
developments. We won't need most of its features, but one is
useful here: If we enclose a collection of declarations between
Module X and End X markers, then, in the remainder of the file
after the End, these definitions are referred to by names like
X.foo instead of just foo. We will use this feature to limit
the scope of definitions, so that we are free to reuse names.

Module [Playground](#Playground).  
  Definition [foo](#Playground.foo) : [rgb](Basics.html#rgb) := [blue](Basics.html#blue).  
End [Playground](Basics.html#Playground).  

---

Definition [foo](#foo) : [bool](Basics.html#bool) := [true](Basics.html#true).  

---

Check [Playground.foo](Basics.html#foo) : [rgb](Basics.html#rgb).  
Check [foo](Basics.html#foo) : [bool](Basics.html#bool).

## Tuples

Module [TuplePlayground](#TuplePlayground).

A single constructor with multiple parameters can be used
to create a tuple type. As an example, consider representing
the four bits in a nybble (half a byte). We first define
a datatype bit that resembles bool (using the
constructors B0 and B1 for the two possible bit values)
and then define the datatype nybble, which is essentially
a tuple of four bits.

Inductive [bit](#TuplePlayground.bit) : Type :=  
  | [B1](#TuplePlayground.B1)  
  | [B0](#TuplePlayground.B0).  

---

Inductive [nybble](#TuplePlayground.nybble) : Type :=  
  | [bits](#TuplePlayground.bits) ([b0](#b<sub>0</sub>:41) [b1](#b<sub>1</sub>:42) [b2](#b<sub>2</sub>:43) [b3](#b<sub>3</sub>:44) : [bit](Basics.html#TuplePlayground.bit)).  

---

Check ([bits](Basics.html#TuplePlayground.bits) [B1](Basics.html#TuplePlayground.B1) [B0](Basics.html#TuplePlayground.B0) [B1](Basics.html#TuplePlayground.B1) [B0](Basics.html#TuplePlayground.B0))  
  : [nybble](Basics.html#TuplePlayground.nybble).

The bits constructor acts as a wrapper for its contents.
Unwrapping can be done by pattern-matching, as in the all\_zero
function below, which tests a nybble to see if all its bits are
B0.

Definition [all\_zero](#TuplePlayground.all_zero) ([nb](#nb:45) : [nybble](Basics.html#TuplePlayground.nybble)) : [bool](Basics.html#bool) :=  
  match [nb](Basics.html#nb:45) with  
  | ([bits](Basics.html#TuplePlayground.bits) [B0](Basics.html#TuplePlayground.B0) [B0](Basics.html#TuplePlayground.B0) [B0](Basics.html#TuplePlayground.B0) [B0](Basics.html#TuplePlayground.B0)) ⇒ [true](Basics.html#true)  
  | ([bits](Basics.html#TuplePlayground.bits) \_ \_ \_ \_) ⇒ [false](Basics.html#false)  
  end.

(The underscore (\_) here is a *wildcard pattern*, which avoids
inventing variable names that will not be used.)

Compute ([all\_zero](Basics.html#TuplePlayground.all_zero) ([bits](Basics.html#TuplePlayground.bits) [B1](Basics.html#TuplePlayground.B1) [B0](Basics.html#TuplePlayground.B0) [B1](Basics.html#TuplePlayground.B1) [B0](Basics.html#TuplePlayground.B0))).  
(\* ===> false : bool \*)  
Compute ([all\_zero](Basics.html#TuplePlayground.all_zero) ([bits](Basics.html#TuplePlayground.bits) [B0](Basics.html#TuplePlayground.B0) [B0](Basics.html#TuplePlayground.B0) [B0](Basics.html#TuplePlayground.B0) [B0](Basics.html#TuplePlayground.B0))).  
(\* ===> true : bool \*)  

---

End [TuplePlayground](Basics.html#TuplePlayground).

## Numbers

We put this section in a module so that our own definition of
natural numbers does not interfere with the one from the
standard library. In the rest of the book, we'll want to use
the standard library's.

Module [NatPlayground](#NatPlayground).

All the types we have defined so far -- both "enumerated
types" such as day, bool, and bit and tuple types such as
nybble built from them -- are finite. The natural numbers, on
the other hand, are an infinite set, so we'll need to use a
slightly richer form of type declaration to represent them.There are many representations of numbers to choose from. You are
certainly familiar with decimal notation (base 10), using the
digits 0 through 9, for example, to form the number 123. You may
very likely also have encountered hexadecimal notation (base 16),
in which the same number is represented as 7B, or octal (base 8),
where it is 173, or binary (base 2), where it is 1111011. Using an
enumerated type to represent digits, we could use any of these as
our representation natural numbers. Indeed, there are
circumstances where each of these choices would be useful.The binary representation is valuable in computer hardware because
the digits can be represented with just two distinct voltage
levels, resulting in simple circuitry. Analogously, we wish here
to choose a representation that makes *proofs* simpler.In fact, there is a representation of numbers that is even simpler
than binary, namely unary (base 1), in which only a single digit
is used -- as our forebears might have done to count days by
making scratches on the walls of their caves. To represent unary
numbers with a Rocq datatype, we use two constructors. The
capital-letter O constructor represents zero. The S
constructor can be applied to the representation of the natural
number n, yielding the representation of n+1, where S stands for
"successor" (or "scratch"). Here is the complete datatype
definition:

Inductive [nat](#NatPlayground.nat) : Type :=  
  | [O](#NatPlayground.O)  
  | [S](#NatPlayground.S) ([n](#n:49) : [nat](Basics.html#nat:47)).

With this definition, 0 is represented by O, 1 by S O,
2 by S (S O), and so on.Informally, the clauses of the definition can be read:

- O is a natural number (remember this is the letter "O,"
  not the numeral "0").
- S can be put in front of a natural number to yield another
  one -- i.e., if n is a natural number, then S n is too.

Again, let's look at this a bit more closely. The definition
of nat says how expressions in the set nat can be built:

- the constructor expression O belongs to the set nat;
- if n is a constructor expression belonging to the set nat,
  then S n is also a constructor expression belonging to the set
  nat; and
- constructor expressions formed in these two ways are the only
  ones belonging to the set nat.

These conditions are the precise force of the Inductive
declaration that we gave to Rocq. They imply that the constructor
expression O, the constructor expression S O, the constructor
expression S (S O), the constructor expression S (S (S O)),
and so on all belong to the set nat, while other constructor
expressions like true, andb true false, S (S false), and
O (O (O S)) do not.A critical point here is that what we've done so far is just to
define a *representation* of numbers: a way of writing them down.
The names O and S are arbitrary, and at this point they have
no special meaning -- they are just two different marks that we
can use to write down numbers, together with a rule that says any
nat will be written as some string of S marks followed by an
O. If we like, we can write essentially the same definition
this way:

Inductive [otherNat](#NatPlayground.otherNat) : Type :=  
  | [stop](#NatPlayground.stop)  
  | [tick](#NatPlayground.tick) ([foo](#foo:52) : [otherNat](Basics.html#otherNat:50)).

The *interpretation* of these marks arises from how we use them to
compute.We can do this by writing functions that pattern match on
representations of natural numbers just as we did above with
booleans and days -- for example, here is the predecessor
function:

Definition [pred](#NatPlayground.pred) ([n](#n:53) : [nat](Basics.html#NatPlayground.nat)) : [nat](Basics.html#NatPlayground.nat) :=  
  match [n](Basics.html#n:53) with  
  | [O](Basics.html#NatPlayground.O) ⇒ [O](Basics.html#NatPlayground.O)  
  | [S](Basics.html#NatPlayground.S) n' ⇒ n'  
  end.

The second branch can be read: "if n has the form S n'
for some n', then return n'."The following End command closes the current module, so
nat will refer back to the type from the standard library.

End [NatPlayground](Basics.html#NatPlayground).

Because natural numbers are such a pervasive kind of data,
Rocq does provide a tiny bit of built-in magic for parsing and
printing them: ordinary decimal numerals can be used as an
alternative to the "unary" notation defined by the constructors
S and O. Rocq prints numbers in decimal form by default:

Check ([S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) ([S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) ([S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) ([S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O))))).  
(\* ===> 4 : nat \*)  

---

Definition [minustwo](#minustwo) ([n](#n:55) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat) :=  
  match [n](Basics.html#n:55) with  
  | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) ([S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) n') ⇒ n'  
  end.  

---

Compute ([minustwo](Basics.html#minustwo) 4).  
(\* ===> 2 : nat \*)

The constructor S has the type nat → nat, just like functions
such as pred and minustwo:

Check [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat).  
Check [pred](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#pred) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat).  
Check [minustwo](Basics.html#minustwo) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat).

These are all things that can be applied to a number to yield a
number. However, there is a fundamental difference between S
and the other two: functions like pred and minustwo are
defined by giving *computation rules* -- e.g., the definition of
pred says that pred 2 can be simplified to 1 -- while the
definition of S has no such behavior attached. Although it is
*like* a function in the sense that it can be applied to an
argument, it does not *do* anything at all! It is just a way of
writing down numbers.Think about standard decimal numerals: the numeral 1 is not a
computation; it's a piece of data. When we write 111 to mean
the number one hundred and eleven, we are using 1, three times,
to write down a concrete representation of a number.Let's go on and define some more functions over numbers.For most interesting computations involving numbers, simple
pattern matching is not enough: we also need recursion. For
example, to check that a number n is even, we may need to
recursively check whether n-2 is even. Such functions are
introduced with the keyword Fixpoint instead of Definition.

Fixpoint [even](#even) ([n](#n:57):[nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [bool](Basics.html#bool) :=  
  match [n](Basics.html#n:57) with  
  | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [true](Basics.html#true)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [false](Basics.html#false)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) ([S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) n') ⇒ [even](Basics.html#even:58) n'  
  end.

We could define odd by a similar Fixpoint declaration, but
here is a simpler way:

Definition [odd](#odd) ([n](#n:60):[nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [bool](Basics.html#bool) :=  
  [negb](Basics.html#negb) ([even](Basics.html#even) [n](Basics.html#n:60)).  

---

Example [test\_odd1](#test_odd1): [odd](Basics.html#odd) 1 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
Proof. simpl. reflexivity. Qed.  
Example [test\_odd2](#test_odd2): [odd](Basics.html#odd) 4 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
Proof. simpl. reflexivity. Qed.

(You may notice if you step through these proofs that
simpl actually has no effect on the goal -- all of the work is
done by reflexivity. We'll discuss why shortly.)Naturally, we can also define multi-argument functions by
recursion.

Module [NatPlayground2](#NatPlayground2).  

---

Fixpoint [plus](#NatPlayground2.plus) ([n](#n:61) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) ([m](#m:62) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat) :=  
  match [n](Basics.html#n:61) with  
  | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [m](Basics.html#m:62)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) n' ⇒ [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) ([plus](Basics.html#plus:63) n' [m](Basics.html#m:62))  
  end.

Adding three to two gives us five (whew!):

Compute ([plus](Basics.html#NatPlayground2.plus) 3 2).  
(\* ===> 5 : nat \*)

The steps of simplification that Rocq performs here can be
visualized as follows:

(\*      plus 3 2  
   i.e. plus (S (S (S O))) (S (S O))  
    ==> S (plus (S (S O)) (S (S O)))  
          by the second clause of the match  
    ==> S (S (plus (S O) (S (S O))))  
          by the second clause of the match  
    ==> S (S (S (plus O (S (S O)))))  
          by the second clause of the match  
    ==> S (S (S (S (S O))))  
          by the first clause of the match  
   i.e. 5  \*)

As a notational convenience, if two or more arguments have
the same type, they can be grouped together. In the following
definition, (n m : nat) means just the same as if we had written
(n : nat) (m : nat).

Fixpoint [mult](#NatPlayground2.mult) ([n](#n:65) [m](#m:66) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat) :=  
  match [n](Basics.html#n:65) with  
  | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) n' ⇒ [plus](Basics.html#NatPlayground2.plus) [m](Basics.html#m:66) ([mult](Basics.html#mult:67) n' [m](Basics.html#m:66))  
  end.  

---

Example [test\_mult1](#NatPlayground2.test_mult1): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[mult](Basics.html#NatPlayground2.mult) 3 3[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) 9.  
Proof. simpl. reflexivity. Qed.

We can match two expressions at once by putting a comma
between them:

Fixpoint [minus](#NatPlayground2.minus) ([n](#n:69) [m](#m:70):[nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat) :=  
  match [n](Basics.html#n:69), [m](Basics.html#m:70) with  
  | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) , \_ ⇒ [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) \_ , [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [n](Basics.html#n:69)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) n', [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) m' ⇒ [minus](Basics.html#minus:71) n' m'  
  end.  

---

End [NatPlayground2](Basics.html#NatPlayground2).  

---

Fixpoint [exp](#exp) ([base](#base:74) [power](#power:75) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat) :=  
  match [power](Basics.html#power:75) with  
  | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) p ⇒ [mult](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#mult) [base](Basics.html#base:74) ([exp](Basics.html#exp:76) [base](Basics.html#base:74) p)  
  end.

#### Exercise: 1 star, standard (factorial)

Recall the standard mathematical factorial function:

```
       factorial(0)  =  1
       factorial(n)  =  n * factorial(n-1)     (if n>0)
```

Translate this into Rocq.Hint: Make sure you put a := between the header we've provided
and your definition. If you see an error like "The reference
factorial was not found in the current environment," it means
you've forgotten the :=.

Fixpoint [factorial](#factorial) ([n](#n:78):[nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)  
  (\* REPLACE THIS LINE WITH ":= \_your\_definition\_ ." \*). Admitted.  

---

Example [test\_factorial1](#test_factorial1): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[factorial](Basics.html#factorial) 3[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) 6.  
(\* FILL IN HERE \*) Admitted.  
Example [test\_factorial2](#test_factorial2): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[factorial](Basics.html#factorial) 5[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[mult](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#mult) 10 12[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
(\* FILL IN HERE \*) Admitted.  
☐

Again, we can make numerical expressions easier to read and write
by introducing notations for addition, subtraction, and
multiplication.

Notation ["](#0dacc1786c5ba797d47dd85006231633)x + y" := ([plus](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#plus) x y)  
                       (at level 50, left associativity)  
                       : nat\_scope.  
Notation ["](#::nat_scope:x_'-'_x)x - y" := ([minus](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#minus) x y)  
                       (at level 50, left associativity)  
                       : nat\_scope.  
Notation ["](#ea2ff3d561159081cea6fb2e8113cc<sub>54</sub>)x \* y" := ([mult](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#mult) x y)  
                       (at level 40, left associativity)  
                       : nat\_scope.  

---

Check ([(](Basics.html#0dacc1786c5ba797d47dd85006231633)0 [+](Basics.html#0dacc1786c5ba797d47dd85006231633) 1[)](Basics.html#0dacc1786c5ba797d47dd85006231633) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) 1) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat).

(The level, associativity, and nat\_scope annotations
control how these notations are treated by Rocq's parser. The
details are not important for present purposes, but interested
readers can check out the "More on Notation" section at the end of
this chapter.)Note that these declarations do not change the definitions we've
already made: they are simply instructions to Rocq's parser to
accept x + y in place of plus x y and, conversely, to its
pretty-printer to display plus x y as x + y.When we say that Rocq comes with almost nothing built-in, we really
mean it: even testing equality is a user-defined operation!
Here is a function eqb that tests natural numbers for
equality, yielding a boolean. Note the use of nested
matches -- we could also have used a simultaneous match, as
in minus.

Fixpoint [eqb](#eqb) ([n](#n:80) [m](#m:81) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [bool](Basics.html#bool) :=  
  match [n](Basics.html#n:80) with  
  | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ match [m](Basics.html#m:81) with  
         | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [true](Basics.html#true)  
         | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) m' ⇒ [false](Basics.html#false)  
         end  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) n' ⇒ match [m](Basics.html#m:81) with  
            | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [false](Basics.html#false)  
            | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) m' ⇒ [eqb](Basics.html#eqb:82) n' m'  
            end  
  end.

Similarly, the leb function tests whether its first argument is
less than or equal to its second argument, yielding a boolean.

Fixpoint [leb](#leb) ([n](#n:86) [m](#m:87) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [bool](Basics.html#bool) :=  
  match [n](Basics.html#n:86) with  
  | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [true](Basics.html#true)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) n' ⇒  
      match [m](Basics.html#m:87) with  
      | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [false](Basics.html#false)  
      | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) m' ⇒ [leb](Basics.html#leb:88) n' m'  
      end  
  end.  

---

Example [test\_leb1](#test_leb1): [leb](Basics.html#leb) 2 2 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
Proof. simpl. reflexivity. Qed.  
Example [test\_leb2](#test_leb2): [leb](Basics.html#leb) 2 4 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
Proof. simpl. reflexivity. Qed.  
Example [test\_leb3](#test_leb3): [leb](Basics.html#leb) 4 2 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
Proof. simpl. reflexivity. Qed.

We'll be using these (especially eqb) a lot, so let's give
them infix notations.

Notation ["](#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>)x =? y" := ([eqb](Basics.html#eqb) x y) (at level 70) : nat\_scope.  
Notation ["](#0f31f5c1c6b6a21a3a187247222bc9e<sub>4</sub>)x <=? y" := ([leb](Basics.html#leb) x y) (at level 70) : nat\_scope.  

---

Example [test\_leb3'](#test_leb3'): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)4 [<=?](Basics.html#0f31f5c1c6b6a21a3a187247222bc9e<sub>4</sub>) 2[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
Proof. simpl. reflexivity. Qed.

We now have two symbols that both look like equality: =
and =?. We'll have much more to say about their differences and
similarities later. For now, the main thing to notice is that
x = y is a logical *claim* -- a "proposition" -- that we can try to
prove, while x =? y is a boolean *expression* whose value (either
true or false) we can compute.

#### Exercise: 1 star, standard (ltb)

Fill in the definition of an ltb function that tests natural
numbers for less-than, yielding a boolean.Hint: Instead of making up a new Fixpoint for
this one, define it in terms of a previously defined
function. It can be done with just one previously defined
function, but you can use two if you want.

Definition [ltb](#ltb) ([n](#n:91) [m](#m:92) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [bool](Basics.html#bool)  
  (\* REPLACE THIS LINE WITH ":= \_your\_definition\_ ." \*). Admitted.  

---

Notation ["](#6b7621b45fff0af5e2b2cbb2bc2d4e1d)x <? y" := ([ltb](Basics.html#ltb) x y) (at level 70) : nat\_scope.  

---

Example [test\_ltb1](#test_ltb1): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[ltb](Basics.html#ltb) 2 2[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
(\* FILL IN HERE \*) Admitted.  
Example [test\_ltb2](#test_ltb2): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[ltb](Basics.html#ltb) 2 4[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
(\* FILL IN HERE \*) Admitted.  
Example [test\_ltb3](#test_ltb3): [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[ltb](Basics.html#ltb) 4 2[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
(\* FILL IN HERE \*) Admitted.  
☐

# Proof by Simplification

Now that we've looked at a few datatypes and functions,
let's turn to stating and proving properties of their behavior.Actually, we've already started doing this: each Example in the
previous sections made a precise claim about the behavior of some
function on some particular inputs. The proofs of these claims
were always the same: use simpl to simplify both sides of the
equation, then use reflexivity to check that both sides contain
identical values.

Example [plus\_1\_1](#plus_1_1) : 1 [+](Basics.html#0dacc1786c5ba797d47dd85006231633) 1 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) 2.  
Proof. simpl. reflexivity. Qed.

The same sort of "proof by simplification" can also be used to
establish more interesting properties. For example, the
fact that 0 is a "neutral element" for + on the left can be
proved just by observing that 0 + n reduces to n no matter
what n is -- a fact that can be read off directly from the
definition of plus.

Theorem [plus\_O\_n](#plus_O_n) : ∀ [n](#n:93) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat), 0 [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [n](Basics.html#n:93) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [n](Basics.html#n:93).  
Proof.  
  intros n. simpl. reflexivity. Qed.

(You may notice that the above statement looks different if
you look at the .v file in your IDE than it does if you view the
HTML rendition in your browser. In .v files, we write the
universal quantifier ∀ using the reserved identifier
"forall." When the .v files are converted to HTML, this gets
transformed into the standard upside-down-A symbol.)This is a good place to mention that reflexivity is a bit more
powerful than we have suggested. In the examples we have seen,
the calls to simpl were actually not required because
reflexivity will do some simplification automatically when
checking that two sides are equal; simpl was just added so that
we could see the intermediate state, after simplification but
before finishing the proof. Here is a shorter proof:

Theorem [plus\_O\_n'](#plus_O_n') : ∀ [n](#n:94) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat), 0 [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [n](Basics.html#n:94) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [n](Basics.html#n:94).  
Proof.  
  intros n. reflexivity. Qed.

Moreover, it is useful to know that reflexivity does
somewhat *more* simplification than simpl does -- for example,
it tries "unfolding" defined terms, replacing them with their
right-hand sides. The reason for this difference is that, if
reflexivity succeeds, the whole goal is finished and we don't need
to look at whatever expanded expressions reflexivity has created
by all this simplification and unfolding; by contrast, simpl is
used in situations where we may have to read and understand the
new goal that it creates, so we would not want it blindly
expanding definitions and leaving the goal in a messy state.The form of the theorem we just stated and its proof are almost
exactly the same as the simpler examples we saw earlier; there are
just a few differences.First, we've used the keyword Theorem instead of Example.
This difference is just a matter of style; the keywords
Example and Theorem (and a few others, including Lemma,
Fact, and Remark) mean pretty much the same thing to Rocq.Second, we've added the quantifier ∀ n:nat, so that our
theorem talks about *all* natural numbers n. Informally, to
prove theorems of this form, we generally start by saying "Suppose
n is some number..." Formally, this is achieved in the proof by
intros n, which moves n from the quantifier in the goal to a
*context* of current assumptions.Incidentally, we could have used another identifier instead of n
in the intros clause, (though of course this might be confusing
to human readers of the proof):

Theorem [plus\_O\_n''](#plus_O_n'') : ∀ [n](#n:95) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat), 0 [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [n](Basics.html#n:95) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [n](Basics.html#n:95).  
Proof.  
  intros m. reflexivity. Qed.

The keywords intros, simpl, and reflexivity are
examples of *tactics*. A tactic is a command that is used between
Proof and Qed to guide the process of checking some claim we
are making. We will see several more tactics in the rest of this
chapter and many more in future chapters.Other similar theorems can be proved with the same pattern.

Theorem [plus\_1\_l](#plus_1_l) : ∀ [n](#n:96):[nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat), 1 [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [n](Basics.html#n:96) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) [n](Basics.html#n:96).  
Proof.  
  intros n. reflexivity. Qed.  

---

Theorem [mult\_0\_l](#mult_0_l) : ∀ [n](#n:97):[nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat), 0 [×](Basics.html#ea2ff3d561159081cea6fb2e8113cc<sub>54</sub>) [n](Basics.html#n:97) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) 0.  
Proof.  
  intros n. reflexivity. Qed.

The \_l suffix in the names of these theorems is
pronounced "on the left."It is worth stepping through these proofs to observe how the
context and the goal change. You may want to add calls to simpl
before reflexivity to see the simplifications that Rocq performs
on the terms before checking that they are equal.

# Proof by Rewriting

The following theorem is a bit more interesting than the
ones we've seen:

Theorem [plus\_id\_example](#plus_id_example) : ∀ [n](#n:98) [m](#m:99):[nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat),  
  [n](Basics.html#n:98) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [m](Basics.html#m:99) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)  
  [n](Basics.html#n:98) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [n](Basics.html#n:98) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [m](Basics.html#m:99) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [m](Basics.html#m:99).

Instead of making a universal claim about all numbers n and m,
it talks about a more specialized property that only holds when
n = m. The arrow symbol is pronounced "implies."As before, we need to be able to reason by assuming we are given such
numbers n and m. We also need to assume the hypothesis
n = m. The intros tactic will serve to move all three of these
from the goal into assumptions in the current context.Since n and m are arbitrary numbers, we can't just use
simplification to prove this theorem. Instead, we prove it by
observing that, if we are assuming n = m, then we can replace
n with m in the goal statement and obtain an equality with the
same expression on both sides. The tactic that tells Rocq to
perform this replacement is called rewrite.

Proof.  
  (\* move both quantifiers into the context: \*)  
  intros n m.  
  (\* move the hypothesis into the context: \*)  
  intros H.  
  (\* rewrite the goal using the hypothesis: \*)  
  rewrite → H.  
  reflexivity. Qed.

The first line of the proof moves the universally quantified
variables n and m into the context. The second moves the
hypothesis n = m into the context and gives it the name H.
The third tells Rocq to rewrite the current goal (n + n = m + m)
by replacing the left side of the equality hypothesis H with the
right side.(The arrow symbol in the rewrite has nothing to do with
implication: it tells Rocq to apply the rewrite from left to right.
Indeed, we can omit the arrow, and Rocq will default to rewriting
left to right. To rewrite from right to left, use rewrite <-.
Try making this change in the above proof and see what changes.) 

#### Exercise: 1 star, standard (plus\_id\_exercise)

Remove "Admitted." and fill in the proof. (Note that the
theorem has *two* hypotheses -- n = m and m = o -- each to the
left of an implication arrow.)

Theorem [plus\_id\_exercise](#plus_id_exercise) : ∀ [n](#n:100) [m](#m:101) [o](#o:102) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat),  
  [n](Basics.html#n:100) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [m](Basics.html#m:101) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [m](Basics.html#m:101) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [o](Basics.html#o:102) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [n](Basics.html#n:100) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [m](Basics.html#m:101) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [m](Basics.html#m:101) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [o](Basics.html#o:102).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

The Admitted command tells Rocq that we want to skip trying
to prove this theorem and just accept it as a given. This is
often useful for developing longer proofs: we can state subsidiary
lemmas that we believe will be useful for making some larger
argument, use Admitted to accept them on faith for the moment,
and continue working on the main argument until we are sure it
makes sense; then we can go back and fill in the proofs we
skipped.Be careful, though: every time you say Admitted you are leaving
a door open for total nonsense to enter Rocq's safe, formally
checked world!The Check command can also be used to examine the statements of
previously declared lemmas and theorems. The two examples below
are lemmas about multiplication that are proved in the standard
library. (We will see how to prove them ourselves in the next
chapter.)

Check [mult\_n\_O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#mult_n_O).  
(\* ===> forall n : nat, 0 = n \* 0 \*)  

---

Check [mult\_n\_Sm](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#mult_n_Sm).  
(\* ===> forall n m : nat, n \* m + n = n \* S m \*)

We can use the rewrite tactic with a previously proved theorem
instead of a hypothesis from the context. If the statement of the
previously proved theorem involves quantified variables, as in the
example below, Rocq will try to fill in appropriate values for them
by matching the body of the previous theorem statement against the
current goal.

Theorem [mult\_n\_0\_m\_0](#mult_n_0_m_0) : ∀ [p](#p:103) [q](#q:104) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat),  
  [(](Basics.html#0dacc1786c5ba797d47dd85006231633)[p](Basics.html#p:103) [×](Basics.html#ea2ff3d561159081cea6fb2e8113cc<sub>54</sub>) 0[)](Basics.html#0dacc1786c5ba797d47dd85006231633) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [(](Basics.html#0dacc1786c5ba797d47dd85006231633)[q](Basics.html#q:104) [×](Basics.html#ea2ff3d561159081cea6fb2e8113cc<sub>54</sub>) 0[)](Basics.html#0dacc1786c5ba797d47dd85006231633) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) 0.  
Proof.  
  intros p q.  
  rewrite <- [mult\_n\_O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#mult_n_O).  
  rewrite <- [mult\_n\_O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#mult_n_O).  
  reflexivity. Qed.

#### Exercise: 1 star, standard (mult\_n\_1)

Use mult\_n\_Sm and mult\_n\_O to prove the following
theorem. (Recall that 1 is S O.)

Theorem [mult\_n\_1](#mult_n_1) : ∀ [p](#p:105) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat),  
  [p](Basics.html#p:105) [×](Basics.html#ea2ff3d561159081cea6fb2e8113cc<sub>54</sub>) 1 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [p](Basics.html#p:105).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

# Proof by Case Analysis

Of course, not everything can be proved by simple
calculation and rewriting: In general, unknown, hypothetical
values (arbitrary numbers, booleans, lists, etc.) can block
simplification. For example, if we try to prove the following
fact using the simpl tactic as above, we get stuck. (We then
use the Abort command to give up on it for the moment.)

Theorem [plus\_1\_neq\_0\_firsttry](#plus_1_neq_0_firsttry) : ∀ [n](#n:106) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat),  
  [(](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>)[n](Basics.html#n:106) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) 1[)](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>) [=?](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>) 0 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
Proof.  
  intros n.  
  simpl. (\* does nothing! \*)  
Abort.

The reason for getting stuck is that the definitions of both
eqb and + begin by performing a match on their first argument.
Here, the first argument to + is the unknown number n and the
argument to eqb is the compound expression n + 1; neither can
be simplified.To make progress, we need to consider the possible forms of n,
separately. If n is O, then we can calculate the final result
of (n + 1) =? 0 and check that it is, indeed, false. And if
n = S n' for some n', then -- although we don't know exactly
what number n + 1 represents -- we can calculate that at least
it will begin with one S; and this is enough to calculate that,
again, (n + 1) =? 0 will yield false.The tactic that tells Rocq to consider separate cases where
n = O and n = S n' is called destruct.

Theorem [plus\_1\_neq\_0](#plus_1_neq_0) : ∀ [n](#n:107) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat),  
  [(](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>)[n](Basics.html#n:107) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) 1[)](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>) [=?](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>) 0 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
Proof.  
  intros n. destruct n as [| n'] eqn:E.  
  - reflexivity.  
  - reflexivity. Qed.

The destruct generates *two* subgoals, which we must then
prove, separately, in order to get Rocq to accept the theorem.The annotation "as [| n']" is called an *intro pattern*. It
tells Rocq what variable names to introduce in each subgoal. In
general, what goes between the square brackets is a *list of
lists* of names, separated by |. In this case, the first
component is empty, since the O constructor doesn't take any
arguments. The second component gives a single name, n', since
S is a unary constructor.In each subgoal, Rocq remembers the assumption about n that is
relevant for this subgoal -- either n = 0 or n = S n' for some
n'. The eqn:E annotation tells destruct to give the name E
to this equation. (Leaving off the eqn:E annotation causes Rocq
to elide these assumptions in the subgoals. This slightly
streamlines proofs where the assumptions are not explicitly used,
but it is better practice to keep them for the sake of
documentation, as they can help keep you oriented when working
with the subgoals.)The - signs on the second and third lines are called *bullets*,
and they mark the parts of the proof that correspond to the two
generated subgoals. The part of the proof script that comes after
a bullet is the entire proof for the corresponding subgoal. In
this example, each of the subgoals is easily proved by a single
use of reflexivity, which itself performs some simplification --
e.g., the second one simplifies (S n' + 1) =? 0 to false by
first rewriting (S n' + 1) to S (n' + 1), then unfolding
eqb, and then simplifying the match.Marking cases with bullets is optional: if bullets are not
present, Rocq simply expects you to prove each subgoal in
sequence, one at a time. But it is a good idea to use bullets, and
you should make a habit of doing it! For one thing, bullets make
the structure of a proof apparent, improving readability.
Moreover, bullets instruct Rocq to ensure that a subgoal is
complete before trying to verify the next one, preventing proofs
for different subgoals from getting mixed up. These issues become
especially important in larger developments, where fragile proofs
can lead to long debugging sessions!There are no hard and fast rules for how proofs should be
formatted in Rocq -- e.g., where lines should be broken and how
sections of the proof should be indented to indicate their nested
structure. However, if the places where multiple subgoals are
generated are marked with explicit bullets at the beginning of
lines, then the proof will be readable almost no matter what
choices are made about other aspects of layout.This is also a good place to mention one other piece of somewhat
obvious advice about line lengths. Beginning Rocq users sometimes
tend to the extremes, either writing each tactic on its own line
or writing entire proofs on a single line. Good style lies
somewhere in the middle. One reasonable guideline is to limit
yourself to 80 (or, if you have a wide screen or good eyes,
120) character lines.The destruct tactic can be used with any inductively defined
datatype. For example, we use it next to prove that boolean
negation is involutive -- i.e., that negation is its own
inverse.

Theorem [negb\_involutive](#negb_involutive) : ∀ [b](#b:108) : [bool](Basics.html#bool),  
  [negb](Basics.html#negb) ([negb](Basics.html#negb) [b](Basics.html#b:108)) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [b](Basics.html#b:108).  
Proof.  
  intros b. destruct b eqn:E.  
  - reflexivity.  
  - reflexivity. Qed.

Note that the destruct here has no as clause because
none of the subcases of the destruct need to bind any variables,
so there is no need to specify any names. In fact, we can omit
the as clause from *any* destruct and Rocq will fill in
variable names automatically. This is generally considered bad
style, since Rocq often makes confusing choices of names when left
to its own devices.It is sometimes useful to invoke destruct inside a subgoal,
generating yet more proof obligations. In this case, we use
different kinds of bullets to mark goals on different "levels."
For example:

Theorem [andb\_commutative](#andb_commutative) : ∀ [b](#b:109) [c](#c:110), [andb](Basics.html#andb) [b](Basics.html#b:109) [c](Basics.html#c:110) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [andb](Basics.html#andb) [c](Basics.html#c:110) [b](Basics.html#b:109).  
Proof.  
  intros b c. destruct b eqn:Eb.  
  - destruct c eqn:Ec.  
    + reflexivity.  
    + reflexivity.  
  - destruct c eqn:Ec.  
    + reflexivity.  
    + reflexivity.  
Qed.

Each pair of calls to reflexivity corresponds to the
subgoals that were generated after the execution of the destruct c
line right above it.Besides - and +, we can use × (asterisk) or any repetition
of a bullet symbol (e.g. -- or \*\*\*) as a bullet. We can also
enclose sub-proofs in curly braces instead of using bullets:

Theorem [andb\_commutative'](#andb_commutative') : ∀ [b](#b:111) [c](#c:112), [andb](Basics.html#andb) [b](Basics.html#b:111) [c](Basics.html#c:112) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [andb](Basics.html#andb) [c](Basics.html#c:112) [b](Basics.html#b:111).  
Proof.  
  intros b c. destruct b eqn:Eb.  
  { destruct c eqn:Ec.  
    { reflexivity. }  
    { reflexivity. } }  
  { destruct c eqn:Ec.  
    { reflexivity. }  
    { reflexivity. } }  
Qed.

Since curly braces mark both the beginning and the end of a proof,
they can be used for multiple subgoal levels, as this example
shows. Furthermore, curly braces allow us to reuse the same bullet
shapes at multiple levels in a proof.The choice of braces, bullets, or a combination of the two is purely
a matter of taste.

Theorem [andb3\_exchange](#andb3_exchange) :  
  ∀ [b](#b:113) [c](#c:114) [d](#d:115), [andb](Basics.html#andb) ([andb](Basics.html#andb) [b](Basics.html#b:113) [c](Basics.html#c:114)) [d](Basics.html#d:115) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [andb](Basics.html#andb) ([andb](Basics.html#andb) [b](Basics.html#b:113) [d](Basics.html#d:115)) [c](Basics.html#c:114).  
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

#### Exercise: 2 stars, standard (andb\_true\_elim2)

Prove the following claim, marking cases (and subcases) with
bullets when you use destruct.Hint 1: Thus far, we've only ever used simpl to simplify the goal.
It is also possible to use it to simplify hypotheses:
use simpl in H, where H is a hypothesis, to simplify it.
You may find this useful in this exercise.Hint 2: You will eventually need to destruct both booleans, as in
the theorems above. It is better to simplify the hypothesis
before attempting to destruct the second boolean.Hint 3: If you reach a contradiction in the hypotheses, focus on
how to rewrite using that contradiction.

Theorem [andb\_true\_elim2](#andb_true_elim2) : ∀ [b](#b:116) [c](#c:117) : [bool](Basics.html#bool),  
  [andb](Basics.html#andb) [b](Basics.html#b:116) [c](Basics.html#c:117) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [c](Basics.html#c:117) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

Before closing the chapter, we should mention one final
convenience. As you may have noticed, many proofs perform case
analysis on a variable right after introducing it:
  
       intros x y. destruct y as [|y] eqn:E.
 This pattern is so common that Rocq provides a shorthand for it: we
can perform case analysis on a variable when introducing it by
using an intro pattern instead of a variable name. For instance,
here is a shorter proof of the plus\_1\_neq\_0 theorem
above. (You'll also note one downside of this shorthand: we lose
the equation recording the assumption we are making in each
subgoal, which we previously got from the eqn:E annotation.)

Theorem [plus\_1\_neq\_0'](#plus_1_neq_0') : ∀ [n](#n:118) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat),  
  [(](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>)[n](Basics.html#n:118) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) 1[)](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>) [=?](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>) 0 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
Proof.  
  intros [|n].  
  - reflexivity.  
  - reflexivity. Qed.

If there are no constructor arguments that need names, we can just
write [] to get the case analysis.

Theorem [andb\_commutative''](#andb_commutative'') :  
  ∀ [b](#b:119) [c](#c:120), [andb](Basics.html#andb) [b](Basics.html#b:119) [c](Basics.html#c:120) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [andb](Basics.html#andb) [c](Basics.html#c:120) [b](Basics.html#b:119).  
Proof.  
  intros [] [].  
  - reflexivity.  
  - reflexivity.  
  - reflexivity.  
  - reflexivity.  
Qed.

#### Exercise: 1 star, standard (zero\_nbeq\_plus\_1)

Theorem [zero\_nbeq\_plus\_1](#zero_nbeq_plus_1) : ∀ [n](#n:121) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat),  
  0 [=?](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>) [(](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>)[n](Basics.html#n:121) [+](Basics.html#0dacc1786c5ba797d47dd85006231633) 1[)](Basics.html#ad2ec4e405f68c46c0a176e3e94ae2e<sub>3</sub>) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

## More on Notation (Optional)

(In general, sections marked Optional are not needed to follow the
rest of the book, except possibly other Optional sections. On a
first reading, you might want to just skim these sections so that
you know what's there for future reference.)Recall the notation definitions for infix plus and times:

Notation ["](#0dacc1786c5ba797d47dd85006231633)x + y" := ([plus](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#plus) x y)  
                       (at level 50, left associativity)  
                       : nat\_scope.  
Notation ["](#ea2ff3d561159081cea6fb2e8113cc<sub>54</sub>)x \* y" := ([mult](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Peano.html#mult) x y)  
                       (at level 40, left associativity)  
                       : nat\_scope.

For each notation symbol in Rocq, we can specify its *precedence
level* and its *associativity*. The precedence level n is
specified by writing at level n; this helps Rocq parse compound
expressions. The associativity setting helps to disambiguate
expressions containing multiple occurrences of the same
symbol. For example, the parameters specified above for + and
× say that the expression 1+2\*3\*4 is shorthand for
(1+((2\*3)\*4)). Rocq uses precedence levels from 0 to 100, and
*left*, *right*, or *no* associativity. We will see more examples
of this later, e.g., in the [Lists](Lists.html) chapter.Each notation symbol is also associated with a *notation scope*.
Rocq tries to guess what scope is meant from context, so when it
sees S (O×O) it guesses nat\_scope, but when it sees the pair
type type bool×bool (which we'll see in a later chapter) it
guesses type\_scope. Occasionally, it is necessary to help it
out by writing, for example, (x×y)%nat, and sometimes in what
Rocq prints it will use %nat to indicate what scope a notation is
in.Notation scopes also apply to numeral notations (3, 4, 5,
42, etc.), so you may sometimes see 0%nat, which means
O (the natural number 0 that we're using in this chapter), or
0%Z, which means the integer zero (which comes from a different
part of the standard library).Pro tip: Rocq's notation mechanism is not especially powerful.
Don't expect too much from it.

## Fixpoints and Structural Recursion (Optional)

Here is a copy of the definition of addition:

Fixpoint [plus'](#plus') ([n](#n:122) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) ([m](#m:123) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat) :=  
  match [n](Basics.html#n:122) with  
  | [O](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#O) ⇒ [m](Basics.html#m:123)  
  | [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) n' ⇒ [S](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#S) ([plus'](Basics.html#plus':124) n' [m](Basics.html#m:123))  
  end.

When Rocq checks this definition, it notes that plus' is
"decreasing on 1st argument." What this means is that we are
performing a *structural recursion* over the argument n -- i.e.,
that we make recursive calls only on strictly smaller values of
n. This implies that all calls to plus' will eventually
terminate. Rocq demands that some argument of *every* Fixpoint
definition be "decreasing."This requirement is a fundamental feature of Rocq's design: In
particular, it guarantees that every function that can be defined
in Rocq will terminate on all inputs. However, because Rocq's
"decreasing analysis" is not very sophisticated, it is sometimes
necessary to write functions in slightly unnatural ways.

#### Exercise: 2 stars, standard, optional (decreasing)

To get a concrete sense of this, find a way to write a sensible
Fixpoint definition (of a simple function on numbers, say) that
*does* terminate on all inputs, but that Rocq will reject because
of this restriction.(If you choose to turn in this optional exercise as part of a
homework assignment, make sure you comment out your solution so
that it doesn't cause Rocq to reject the whole file!)

(\* FILL IN HERE \*)  
☐

# More Exercises

## Warmups

#### Exercise: 1 star, standard (identity\_fn\_applied\_twice)

Use the tactics you have learned so far to prove the following
theorem about boolean functions.

Theorem [identity\_fn\_applied\_twice](#identity_fn_applied_twice) :  
  ∀ ([f](#f:126) : [bool](Basics.html#bool) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [bool](Basics.html#bool)),  
  [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)∀ ([x](#x:127) : [bool](Basics.html#bool)), [f](Basics.html#f:126) [x](Basics.html#x:127) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [x](Basics.html#x:127)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)  
  ∀ ([b](#b:128) : [bool](Basics.html#bool)), [f](Basics.html#f:126) ([f](Basics.html#f:126) [b](Basics.html#b:128)) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [b](Basics.html#b:128).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

#### Exercise: 1 star, standard (negation\_fn\_applied\_twice)

Now state and prove a theorem negation\_fn\_applied\_twice similar
to the previous one but where the hypothesis says that the
function f has the property that f x = negb x.

(\* FILL IN HERE \*)  

---

(\* Do not modify the following line: \*)  
Definition [manual\_grade\_for\_negation\_fn\_applied\_twice](#manual_grade_for_negation_fn_applied_twice) : [option](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#option) ([nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)[×](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#11c698c8685bb8ab1cf725545c085ac<sub>4</sub>)[string](https://rocq-prover.org/doc/V9.0.0/stdlib//Stdlib.Strings.String.html#string)) := [None](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#None).

(The last definition is used by the autograder.) ☐

#### Exercise: 3 stars, standard, optional (andb\_eq\_orb)

Prove the following theorem. (Hint: This can be a bit tricky,
depending on how you approach it. You will probably need both
destruct and rewrite, but destructing everything in sight is
not the best way.)

Theorem [andb\_eq\_orb](#andb_eq_orb) :  
  ∀ ([b](#b:129) [c](#c:130) : [bool](Basics.html#bool)),  
  [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)[andb](Basics.html#andb) [b](Basics.html#b:129) [c](Basics.html#c:130) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [orb](Basics.html#orb) [b](Basics.html#b:129) [c](Basics.html#c:130)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)  
  [b](Basics.html#b:129) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [c](Basics.html#c:130).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

## Course Late Policies, Formalized

Suppose that a course has a grading policy based on late days,
where a student's final letter grade is lowered if they submit too
many homework assignments late.In the next series of problems, we model this situation using the
features of Rocq that we have seen so far and prove some simple
facts about this grading policy.

Module [LateDays](#LateDays).

First, we inroduce a datatype for modeling the "letter" component
of a grade.

Inductive [letter](#LateDays.letter) : Type :=  
  | [A](#LateDays.A) | [B](#LateDays.B) | [C](#LateDays.C) | [D](#LateDays.D) | [F](#LateDays.F).

Then we define the modifiers -- a Natural A is just a "plain"
grade of A.

Inductive [modifier](#LateDays.modifier) : Type :=  
  | [Plus](#LateDays.Plus) | [Natural](#LateDays.Natural) | [Minus](#LateDays.Minus).

A full grade, then, is just a letter and a modifier.We might write, informally, "A-" for the Rocq value Grade A Minus,
and similarly "C" for the Rocq value Grade C Natural.

Inductive [grade](#LateDays.grade) : Type :=  
  [Grade](#LateDays.Grade) ([l](#l:137):[letter](Basics.html#LateDays.letter)) ([m](#m:138):[modifier](Basics.html#LateDays.modifier)).

We will want to be able to say when one grade is "better" than
another. In other words, we need a way to compare two grades. As
with natural numbers, we could define bool-valued functions
grade\_eqb, grade\_ltb, etc., and that would work fine.
However, we can also define a slightly more informative type for
comparing two values, as shown below. This datatype has three
constructors that can be used to indicate whether two values are
"equal", "less than", or "greater than" one another. (This
definition also appears in the Rocq standard libary.)

Inductive [comparison](#LateDays.comparison) : Type :=  
  | [Eq](#LateDays.Eq) (\* "equal" \*)  
  | [Lt](#LateDays.Lt) (\* "less than" \*)  
  | [Gt](#LateDays.Gt). (\* "greater than" \*)

Using pattern matching, it is not difficult to define the
comparison operation for two letters l1 and l2 (see below).
This definition uses two features of match patterns: First,
recall that we can match against *two* values simultaneously by
separating them and the corresponding patterns with comma ,.
This is simply a convenient abbreviation for nested pattern
matching. For example, the match expression on the left below is
just shorthand for the lower-level "expanded version" shown on the
right:  
  match l1, l2 with match l1 with  
  | A, A ⇒ Eq | A ⇒ match l2 with  
  | A, \_ ⇒ Gt | A ⇒ Eq  
  end | \_ ⇒ Gt  
                                    end  
                             end
 As another shorthand, we can also match one of several
possibilites by using | in the pattern. For example the pattern
C , (A | B) stands for two cases: C, A and C, B.

Definition [letter\_comparison](#LateDays.letter_comparison) ([l1](#l<sub>1</sub>:141) [l2](#l<sub>2</sub>:142) : [letter](Basics.html#LateDays.letter)) : [comparison](Basics.html#LateDays.comparison) :=  
  match [l1](Basics.html#l<sub>1</sub>:141), [l2](Basics.html#l<sub>2</sub>:142) with  
  | [A](Basics.html#LateDays.A), [A](Basics.html#LateDays.A) ⇒ [Eq](Basics.html#LateDays.Eq)  
  | [A](Basics.html#LateDays.A), \_ ⇒ [Gt](Basics.html#LateDays.Gt)  
  | [B](Basics.html#LateDays.B), [A](Basics.html#LateDays.A) ⇒ [Lt](Basics.html#LateDays.Lt)  
  | [B](Basics.html#LateDays.B), [B](Basics.html#LateDays.B) ⇒ [Eq](Basics.html#LateDays.Eq)  
  | [B](Basics.html#LateDays.B), \_ ⇒ [Gt](Basics.html#LateDays.Gt)  
  | [C](Basics.html#LateDays.C), ([A](Basics.html#LateDays.A) | [B](Basics.html#LateDays.B)) ⇒ [Lt](Basics.html#LateDays.Lt)  
  | [C](Basics.html#LateDays.C), [C](Basics.html#LateDays.C) ⇒ [Eq](Basics.html#LateDays.Eq)  
  | [C](Basics.html#LateDays.C), \_ ⇒ [Gt](Basics.html#LateDays.Gt)  
  | [D](Basics.html#LateDays.D), ([A](Basics.html#LateDays.A) | [B](Basics.html#LateDays.B) | [C](Basics.html#LateDays.C)) ⇒ [Lt](Basics.html#LateDays.Lt)  
  | [D](Basics.html#LateDays.D), [D](Basics.html#LateDays.D) ⇒ [Eq](Basics.html#LateDays.Eq)  
  | [D](Basics.html#LateDays.D), \_ ⇒ [Gt](Basics.html#LateDays.Gt)  
  | [F](Basics.html#LateDays.F), ([A](Basics.html#LateDays.A) | [B](Basics.html#LateDays.B) | [C](Basics.html#LateDays.C) | [D](Basics.html#LateDays.D)) ⇒ [Lt](Basics.html#LateDays.Lt)  
  | [F](Basics.html#LateDays.F), [F](Basics.html#LateDays.F) ⇒ [Eq](Basics.html#LateDays.Eq)  
  end.

We can test the letter\_comparison operation by trying it out on a few
examples.

Compute [letter\_comparison](Basics.html#LateDays.letter_comparison) [B](Basics.html#LateDays.B) [A](Basics.html#LateDays.A).

==> Lt

Compute [letter\_comparison](Basics.html#LateDays.letter_comparison) [D](Basics.html#LateDays.D) [D](Basics.html#LateDays.D).

==> Eq

Compute [letter\_comparison](Basics.html#LateDays.letter_comparison) [B](Basics.html#LateDays.B) [F](Basics.html#LateDays.F).

==> GtAs a further sanity check, we can prove that the
letter\_comparison function does indeed give the result Eq when
comparing a letter l against itself. 

#### Exercise: 1 star, standard (letter\_comparison)

Theorem [letter\_comparison\_Eq](#LateDays.letter_comparison_Eq) :  
  ∀ [l](#l:145), [letter\_comparison](Basics.html#LateDays.letter_comparison) [l](Basics.html#l:145) [l](Basics.html#l:145) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Eq](Basics.html#LateDays.Eq).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

We can follow the same strategy to define the comparison operation
for two grade modifiers. We consider them to be ordered as
Plus > Natural > Minus.

Definition [modifier\_comparison](#LateDays.modifier_comparison) ([m1](#m<sub>1</sub>:146) [m2](#m<sub>2</sub>:147) : [modifier](Basics.html#LateDays.modifier)) : [comparison](Basics.html#LateDays.comparison) :=  
  match [m1](Basics.html#m<sub>1</sub>:146), [m2](Basics.html#m<sub>2</sub>:147) with  
  | [Plus](Basics.html#LateDays.Plus), [Plus](Basics.html#LateDays.Plus) ⇒ [Eq](Basics.html#LateDays.Eq)  
  | [Plus](Basics.html#LateDays.Plus), \_ ⇒ [Gt](Basics.html#LateDays.Gt)  
  | [Natural](Basics.html#LateDays.Natural), [Plus](Basics.html#LateDays.Plus) ⇒ [Lt](Basics.html#LateDays.Lt)  
  | [Natural](Basics.html#LateDays.Natural), [Natural](Basics.html#LateDays.Natural) ⇒ [Eq](Basics.html#LateDays.Eq)  
  | [Natural](Basics.html#LateDays.Natural), \_ ⇒ [Gt](Basics.html#LateDays.Gt)  
  | [Minus](Basics.html#LateDays.Minus), ([Plus](Basics.html#LateDays.Plus) | [Natural](Basics.html#LateDays.Natural)) ⇒ [Lt](Basics.html#LateDays.Lt)  
  | [Minus](Basics.html#LateDays.Minus), [Minus](Basics.html#LateDays.Minus) ⇒ [Eq](Basics.html#LateDays.Eq)  
  end.

#### Exercise: 2 stars, standard (grade\_comparison)

Use pattern matching to complete the following definition.(This ordering on grades is sometimes called "lexicographic"
ordering: we first compare the letters, and we only consider the
modifiers in the case that the letters are equal. I.e. all grade
variants of A are greater than all grade variants of B.)Hint: match against g1 and g2 simultaneously, but don't try to
enumerate all the cases. Instead do case analysis on the result
of a suitable call to letter\_comparison to end up with just 3
possibilities.

Definition [grade\_comparison](#LateDays.grade_comparison) ([g1](#g<sub>1</sub>:150) [g2](#g<sub>2</sub>:151) : [grade](Basics.html#LateDays.grade)) : [comparison](Basics.html#LateDays.comparison)  
  (\* REPLACE THIS LINE WITH ":= \_your\_definition\_ ." \*). Admitted.

The following "unit tests" of your grade\_comparison function
should pass once you have defined it correctly.

Example [test\_grade\_comparison1](#LateDays.test_grade_comparison1) :  
  [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[grade\_comparison](Basics.html#LateDays.grade_comparison) ([Grade](Basics.html#LateDays.Grade) [A](Basics.html#LateDays.A) [Minus](Basics.html#LateDays.Minus)) ([Grade](Basics.html#LateDays.Grade) [B](Basics.html#LateDays.B) [Plus](Basics.html#LateDays.Plus))[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Gt](Basics.html#LateDays.Gt).  
(\* FILL IN HERE \*) Admitted.  

---

Example [test\_grade\_comparison2](#LateDays.test_grade_comparison2) :  
  [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[grade\_comparison](Basics.html#LateDays.grade_comparison) ([Grade](Basics.html#LateDays.Grade) [A](Basics.html#LateDays.A) [Minus](Basics.html#LateDays.Minus)) ([Grade](Basics.html#LateDays.Grade) [A](Basics.html#LateDays.A) [Plus](Basics.html#LateDays.Plus))[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Lt](Basics.html#LateDays.Lt).  
(\* FILL IN HERE \*) Admitted.  

---

Example [test\_grade\_comparison3](#LateDays.test_grade_comparison3) :  
  [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[grade\_comparison](Basics.html#LateDays.grade_comparison) ([Grade](Basics.html#LateDays.Grade) [F](Basics.html#LateDays.F) [Plus](Basics.html#LateDays.Plus)) ([Grade](Basics.html#LateDays.Grade) [F](Basics.html#LateDays.F) [Plus](Basics.html#LateDays.Plus))[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Eq](Basics.html#LateDays.Eq).  
(\* FILL IN HERE \*) Admitted.  

---

Example [test\_grade\_comparison4](#LateDays.test_grade_comparison4) :  
  [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[grade\_comparison](Basics.html#LateDays.grade_comparison) ([Grade](Basics.html#LateDays.Grade) [B](Basics.html#LateDays.B) [Minus](Basics.html#LateDays.Minus)) ([Grade](Basics.html#LateDays.Grade) [C](Basics.html#LateDays.C) [Plus](Basics.html#LateDays.Plus))[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Gt](Basics.html#LateDays.Gt).  
(\* FILL IN HERE \*) Admitted.  
☐

Now that we have a definition of grades and how they compare to
one another, let us implement a late-penalty fuction.First, we define what it means to lower the letter component of
a grade. Since F is already the lowest grade possible, we just
leave it alone.

Definition [lower\_letter](#LateDays.lower_letter) ([l](#l:152) : [letter](Basics.html#LateDays.letter)) : [letter](Basics.html#LateDays.letter) :=  
  match [l](Basics.html#l:152) with  
  | [A](Basics.html#LateDays.A) ⇒ [B](Basics.html#LateDays.B)  
  | [B](Basics.html#LateDays.B) ⇒ [C](Basics.html#LateDays.C)  
  | [C](Basics.html#LateDays.C) ⇒ [D](Basics.html#LateDays.D)  
  | [D](Basics.html#LateDays.D) ⇒ [F](Basics.html#LateDays.F)  
  | [F](Basics.html#LateDays.F) ⇒ [F](Basics.html#LateDays.F) (\* Can't go lower than F! \*)  
  end.

Our formalization can already help us understand some corner cases
of the grading policy. For example, we might expect that if we
use the lower\_letter function its result will actually be lower,
as claimed in the following theorem. But this theorem is not
provable! (Do you see why?)

Theorem [lower\_letter\_lowers](#LateDays.lower_letter_lowers): ∀ ([l](#l:154) : [letter](Basics.html#LateDays.letter)),  
  [letter\_comparison](Basics.html#LateDays.letter_comparison) ([lower\_letter](Basics.html#LateDays.lower_letter) [l](Basics.html#l:154)) [l](Basics.html#l:154) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Lt](Basics.html#LateDays.Lt).  
Proof.  
  intros l.  
  destruct l.  
  - simpl. reflexivity.  
  - simpl. reflexivity.  
  - simpl. reflexivity.  
  - simpl. reflexivity.  
  - simpl. (\* We get stuck here. \*)  
Abort.

The problem, of course, has to do with the "edge case" of lowering
F, as we can see like this:

Theorem [lower\_letter\_F\_is\_F](#LateDays.lower_letter_F_is_F):  
  [lower\_letter](Basics.html#LateDays.lower_letter) [F](Basics.html#LateDays.F) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [F](Basics.html#LateDays.F).  
Proof.  
  simpl. reflexivity.  
Qed.

With this insight, we can state a better version of the lower
letter theorem that actually is provable. In this version, the
hypothesis about F says that F is strictly smaller than l,
which rules out the problematic case above. In other words, as
long as l is bigger than F, it will be lowered. 

#### Exercise: 2 stars, standard (lower\_letter\_lowers)

Prove the following theorem.

Theorem [lower\_letter\_lowers](#LateDays.lower_letter_lowers):  
  ∀ ([l](#l:155) : [letter](Basics.html#LateDays.letter)),  
    [letter\_comparison](Basics.html#LateDays.letter_comparison) [F](Basics.html#LateDays.F) [l](Basics.html#l:155) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Lt](Basics.html#LateDays.Lt) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)  
    [letter\_comparison](Basics.html#LateDays.letter_comparison) ([lower\_letter](Basics.html#LateDays.lower_letter) [l](Basics.html#l:155)) [l](Basics.html#l:155) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Lt](Basics.html#LateDays.Lt).  
Proof.  
(\* FILL IN HERE \*) Admitted.  
☐

#### Exercise: 2 stars, standard (lower\_grade)

We can now use the lower\_letter definition as a helper to define
what it means to lower a grade by one step. Complete the
definition below so that it sends a grade g to one step lower
(unless it is already Grade F Minus, which should remain
unchanged). Once you have implemented it correctly, the subsequent
"unit test" examples should hold trivially.Hint: To make this a succinct definition that is easy to prove
properties about, you will probably want to use nested pattern
matching. The outer match should not match on the specific letter
component of the grade -- it should consider only the modifier.
You should definitely *not* try to enumerate all of the
cases.Our solution is under 10 lines of code total.

Definition [lower\_grade](#LateDays.lower_grade) ([g](#g:156) : [grade](Basics.html#LateDays.grade)) : [grade](Basics.html#LateDays.grade)  
  (\* REPLACE THIS LINE WITH ":= \_your\_definition\_ ." \*). Admitted.  

---

Example [lower\_grade\_A\_Plus](#LateDays.lower_grade_A_Plus) :  
  [lower\_grade](Basics.html#LateDays.lower_grade) ([Grade](Basics.html#LateDays.Grade) [A](Basics.html#LateDays.A) [Plus](Basics.html#LateDays.Plus)) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[Grade](Basics.html#LateDays.Grade) [A](Basics.html#LateDays.A) [Natural](Basics.html#LateDays.Natural)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
(\* FILL IN HERE \*) Admitted.  

---

Example [lower\_grade\_A\_Natural](#LateDays.lower_grade_A_Natural) :  
  [lower\_grade](Basics.html#LateDays.lower_grade) ([Grade](Basics.html#LateDays.Grade) [A](Basics.html#LateDays.A) [Natural](Basics.html#LateDays.Natural)) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[Grade](Basics.html#LateDays.Grade) [A](Basics.html#LateDays.A) [Minus](Basics.html#LateDays.Minus)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
(\* FILL IN HERE \*) Admitted.  

---

Example [lower\_grade\_A\_Minus](#LateDays.lower_grade_A_Minus) :  
  [lower\_grade](Basics.html#LateDays.lower_grade) ([Grade](Basics.html#LateDays.Grade) [A](Basics.html#LateDays.A) [Minus](Basics.html#LateDays.Minus)) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[Grade](Basics.html#LateDays.Grade) [B](Basics.html#LateDays.B) [Plus](Basics.html#LateDays.Plus)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
(\* FILL IN HERE \*) Admitted.  

---

Example [lower\_grade\_B\_Plus](#LateDays.lower_grade_B_Plus) :  
  [lower\_grade](Basics.html#LateDays.lower_grade) ([Grade](Basics.html#LateDays.Grade) [B](Basics.html#LateDays.B) [Plus](Basics.html#LateDays.Plus)) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[Grade](Basics.html#LateDays.Grade) [B](Basics.html#LateDays.B) [Natural](Basics.html#LateDays.Natural)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
(\* FILL IN HERE \*) Admitted.  

---

Example [lower\_grade\_F\_Natural](#LateDays.lower_grade_F_Natural) :  
  [lower\_grade](Basics.html#LateDays.lower_grade) ([Grade](Basics.html#LateDays.Grade) [F](Basics.html#LateDays.F) [Natural](Basics.html#LateDays.Natural)) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[Grade](Basics.html#LateDays.Grade) [F](Basics.html#LateDays.F) [Minus](Basics.html#LateDays.Minus)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
(\* FILL IN HERE \*) Admitted.  

---

Example [lower\_grade\_twice](#LateDays.lower_grade_twice) :  
  [lower\_grade](Basics.html#LateDays.lower_grade) ([lower\_grade](Basics.html#LateDays.lower_grade) ([Grade](Basics.html#LateDays.Grade) [B](Basics.html#LateDays.B) [Minus](Basics.html#LateDays.Minus))) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[Grade](Basics.html#LateDays.Grade) [C](Basics.html#LateDays.C) [Natural](Basics.html#LateDays.Natural)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
(\* FILL IN HERE \*) Admitted.  

---

Example [lower\_grade\_thrice](#LateDays.lower_grade_thrice) :  
  [lower\_grade](Basics.html#LateDays.lower_grade) ([lower\_grade](Basics.html#LateDays.lower_grade) ([lower\_grade](Basics.html#LateDays.lower_grade) ([Grade](Basics.html#LateDays.Grade) [B](Basics.html#LateDays.B) [Minus](Basics.html#LateDays.Minus)))) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[Grade](Basics.html#LateDays.Grade) [C](Basics.html#LateDays.C) [Minus](Basics.html#LateDays.Minus)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
(\* FILL IN HERE \*) Admitted.

Rocq makes no distinction between an Example and a Theorem. We
state the following as a Theorem only as a hint that we will use
it in proofs below.

Theorem [lower\_grade\_F\_Minus](#LateDays.lower_grade_F_Minus) : [lower\_grade](Basics.html#LateDays.lower_grade) ([Grade](Basics.html#LateDays.Grade) [F](Basics.html#LateDays.F) [Minus](Basics.html#LateDays.Minus)) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[Grade](Basics.html#LateDays.Grade) [F](Basics.html#LateDays.F) [Minus](Basics.html#LateDays.Minus)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
(\* FILL IN HERE \*) Admitted.  

---

(\* GRADE\_THEOREM 0.25: lower\_grade\_A\_Plus \*)  
(\* GRADE\_THEOREM 0.25: lower\_grade\_A\_Natural \*)  
(\* GRADE\_THEOREM 0.25: lower\_grade\_A\_Minus \*)  
(\* GRADE\_THEOREM 0.25: lower\_grade\_B\_Plus \*)  
(\* GRADE\_THEOREM 0.25: lower\_grade\_F\_Natural \*)  
(\* GRADE\_THEOREM 0.25: lower\_grade\_twice \*)  
(\* GRADE\_THEOREM 0.25: lower\_grade\_thrice \*)  
(\* GRADE\_THEOREM 0.25: lower\_grade\_F\_Minus \*)  
☐

#### Exercise: 3 stars, standard (lower\_grade\_lowers)

Prove the following theorem, which says that, as long as the grade
starts out above F-, the lower\_grade option does indeed lower
the grade. As usual, destructing everything in sight is *not* a
good idea. Judicious use of destruct along with rewriting is a
better strategy.Hint: If you defined your grade\_comparison function as suggested,
you will only need to destruct a letter in one case.
The case for F will probably benefit from lower\_grade\_F\_Minus.

Theorem [lower\_grade\_lowers](#LateDays.lower_grade_lowers) :  
  ∀ ([g](#g:157) : [grade](Basics.html#LateDays.grade)),  
    [grade\_comparison](Basics.html#LateDays.grade_comparison) ([Grade](Basics.html#LateDays.Grade) [F](Basics.html#LateDays.F) [Minus](Basics.html#LateDays.Minus)) [g](Basics.html#g:157) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Lt](Basics.html#LateDays.Lt) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)  
    [grade\_comparison](Basics.html#LateDays.grade_comparison) ([lower\_grade](Basics.html#LateDays.lower_grade) [g](Basics.html#g:157)) [g](Basics.html#g:157) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [Lt](Basics.html#LateDays.Lt).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

Now that we have implemented and tested a function that lowers a
grade by one step, we can implement a specific late-days policy.
Given a number of late\_days, the apply\_late\_policy function
computes the final grade from g, the initial grade.This function encodes the following policy:

```
      # late days     penalty
         0 - 8        no penalty
         9 - 16       lower grade by one step (A+ => A, A => A-, A- => B+, etc.)
        17 - 20       lower grade by two steps
          >= 21       lower grade by three steps (a whole letter)
```

Definition [apply\_late\_policy](#LateDays.apply_late_policy) ([late\_days](#late_days:158) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) ([g](#g:159) : [grade](Basics.html#LateDays.grade)) : [grade](Basics.html#LateDays.grade) :=  
  if [late\_days](Basics.html#late_days:158) [<?](Basics.html#6b7621b45fff0af5e2b2cbb2bc2d4e1d) 9 then [g](Basics.html#g:159)  
  else if [late\_days](Basics.html#late_days:158) [<?](Basics.html#6b7621b45fff0af5e2b2cbb2bc2d4e1d) 17 then [lower\_grade](Basics.html#LateDays.lower_grade) [g](Basics.html#g:159)  
  else if [late\_days](Basics.html#late_days:158) [<?](Basics.html#6b7621b45fff0af5e2b2cbb2bc2d4e1d) 21 then [lower\_grade](Basics.html#LateDays.lower_grade) ([lower\_grade](Basics.html#LateDays.lower_grade) [g](Basics.html#g:159))  
  else [lower\_grade](Basics.html#LateDays.lower_grade) ([lower\_grade](Basics.html#LateDays.lower_grade) ([lower\_grade](Basics.html#LateDays.lower_grade) [g](Basics.html#g:159))).

Sometimes it is useful to be able to "unfold" a definition to be
able to make progress on a proof. Soon, we will see how to do this
in a much simpler way automatically, but for now, it is easy to prove
that a use of any definition like apply\_late\_policy is equal to its
right hand side just by using reflexivity.This result is useful because it allows us to use rewrite to
expose the internals of the definition.

Theorem [apply\_late\_policy\_unfold](#LateDays.apply_late_policy_unfold) :  
  ∀ ([late\_days](#late_days:160) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) ([g](#g:161) : [grade](Basics.html#LateDays.grade)),  
    [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[apply\_late\_policy](Basics.html#LateDays.apply_late_policy) [late\_days](Basics.html#late_days:160) [g](Basics.html#g:161)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)  
    [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)  
    [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)if [late\_days](Basics.html#late_days:160) [<?](Basics.html#6b7621b45fff0af5e2b2cbb2bc2d4e1d) 9 then [g](Basics.html#g:161) else  
       if [late\_days](Basics.html#late_days:160) [<?](Basics.html#6b7621b45fff0af5e2b2cbb2bc2d4e1d) 17 then [lower\_grade](Basics.html#LateDays.lower_grade) [g](Basics.html#g:161)  
       else if [late\_days](Basics.html#late_days:160) [<?](Basics.html#6b7621b45fff0af5e2b2cbb2bc2d4e1d) 21 then [lower\_grade](Basics.html#LateDays.lower_grade) ([lower\_grade](Basics.html#LateDays.lower_grade) [g](Basics.html#g:161))  
            else [lower\_grade](Basics.html#LateDays.lower_grade) ([lower\_grade](Basics.html#LateDays.lower_grade) ([lower\_grade](Basics.html#LateDays.lower_grade) [g](Basics.html#g:161)))[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
  intros. reflexivity.  
Qed.

Now let's prove some properties about this policy.The next theorem states that if a student accrues no more than eight
late days throughout the semester, their grade is unaffected. It
is easy to prove: once you use the apply\_late\_policy\_unfold you
can rewrite using the hypothesis.

#### Exercise: 2 stars, standard (no\_penalty\_for\_mostly\_on\_time)

Theorem [no\_penalty\_for\_mostly\_on\_time](#LateDays.no_penalty_for_mostly_on_time) :  
  ∀ ([late\_days](#late_days:162) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) ([g](#g:163) : [grade](Basics.html#LateDays.grade)),  
    [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)[late\_days](Basics.html#late_days:162) [<?](Basics.html#6b7621b45fff0af5e2b2cbb2bc2d4e1d) 9 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)  
    [apply\_late\_policy](Basics.html#LateDays.apply_late_policy) [late\_days](Basics.html#late_days:162) [g](Basics.html#g:163) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [g](Basics.html#g:163).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

The following theorem states that, if a student has between 9 and
16 late days, their final grade is lowered by one step.

#### Exercise: 2 stars, standard (graded\_lowered\_once)

Theorem [grade\_lowered\_once](#LateDays.grade_lowered_once) :  
  ∀ ([late\_days](#late_days:164) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)) ([g](#g:165) : [grade](Basics.html#LateDays.grade)),  
    [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)[late\_days](Basics.html#late_days:164) [<?](Basics.html#6b7621b45fff0af5e2b2cbb2bc2d4e1d) 9 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [false](Basics.html#false)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)  
    [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)[late\_days](Basics.html#late_days:164) [<?](Basics.html#6b7621b45fff0af5e2b2cbb2bc2d4e1d) 17 [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [true](Basics.html#true)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x) [→](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#::type_scope:x_'->'_x)  
    [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[apply\_late\_policy](Basics.html#LateDays.apply_late_policy) [late\_days](Basics.html#late_days:164) [g](Basics.html#g:165)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[lower\_grade](Basics.html#LateDays.lower_grade) [g](Basics.html#g:165)[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a).  
Proof.  
  (\* FILL IN HERE \*) Admitted.  
☐

End [LateDays](Basics.html#LateDays).

## Binary Numerals

#### Exercise: 3 stars, standard (binary)

We can generalize our unary representation of natural numbers to
the more efficient binary representation by treating a binary
number as a sequence of constructors B0 and B1 (representing 0s
and 1s), terminated by a Z. For comparison, in the unary
representation, a number is a sequence of S constructors terminated
by an O.For example:

```
        decimal               binary                          unary
           0                       Z                              O
           1                    B1 Z                            S O
           2                B0 (B1 Z)                        S (S O)
           3                B1 (B1 Z)                     S (S (S O))
           4            B0 (B0 (B1 Z))                 S (S (S (S O)))
           5            B1 (B0 (B1 Z))              S (S (S (S (S O))))
           6            B0 (B1 (B1 Z))           S (S (S (S (S (S O)))))
           7            B1 (B1 (B1 Z))        S (S (S (S (S (S (S O))))))
           8        B0 (B0 (B0 (B1 Z)))    S (S (S (S (S (S (S (S O)))))))
```

Note that the low-order bit is on the left and the high-order bit
is on the right -- the opposite of the way binary numbers are
usually written. This choice makes them easier to manipulate.(Comprehension check: What unary numeral does B0 Z represent?)

Inductive [bin](#bin) : Type :=  
  | [Z](#Z)  
  | [B0](#B<sub>0</sub>) ([n](#n:168) : [bin](Basics.html#bin:166))  
  | [B1](#B<sub>1</sub>) ([n](#n:169) : [bin](Basics.html#bin:166)).

Complete the definitions below of an increment function incr
for binary numbers, and a function bin\_to\_nat to convert
binary numbers to unary numbers.

Fixpoint [incr](#incr) ([m](#m:170):[bin](Basics.html#bin)) : [bin](Basics.html#bin)  
  (\* REPLACE THIS LINE WITH ":= \_your\_definition\_ ." \*). Admitted.  

---

Fixpoint [bin\_to\_nat](#bin_to_nat) ([m](#m:172):[bin](Basics.html#bin)) : [nat](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Datatypes.html#nat)  
  (\* REPLACE THIS LINE WITH ":= \_your\_definition\_ ." \*). Admitted.

The following "unit tests" of your increment and binary-to-unary
functions should pass after you have defined those functions correctly.
Of course, unit tests don't fully demonstrate the correctness of
your functions! We'll return to that thought at the end of the
next chapter.

Example [test\_bin\_incr1](#test_bin_incr1) : [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[incr](Basics.html#incr) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z))[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [B0](Basics.html#B<sub>0</sub>) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z)).  
(\* FILL IN HERE \*) Admitted.  

---

Example [test\_bin\_incr2](#test_bin_incr2) : [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[incr](Basics.html#incr) ([B0](Basics.html#B<sub>0</sub>) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z)))[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [B1](Basics.html#B<sub>1</sub>) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z)).  
(\* FILL IN HERE \*) Admitted.  

---

Example [test\_bin\_incr3](#test_bin_incr3) : [(](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a)[incr](Basics.html#incr) ([B1](Basics.html#B<sub>1</sub>) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z)))[)](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) [B0](Basics.html#B<sub>0</sub>) ([B0](Basics.html#B<sub>0</sub>) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z))).  
(\* FILL IN HERE \*) Admitted.  

---

Example [test\_bin\_incr4](#test_bin_incr4) : [bin\_to\_nat](Basics.html#bin_to_nat) ([B0](Basics.html#B<sub>0</sub>) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z))) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) 2.  
(\* FILL IN HERE \*) Admitted.  

---

Example [test\_bin\_incr5](#test_bin_incr5) :  
        [bin\_to\_nat](Basics.html#bin_to_nat) ([incr](Basics.html#incr) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z))) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) 1 [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [bin\_to\_nat](Basics.html#bin_to_nat) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z)).  
(\* FILL IN HERE \*) Admitted.  

---

Example [test\_bin\_incr6](#test_bin_incr6) :  
        [bin\_to\_nat](Basics.html#bin_to_nat) ([incr](Basics.html#incr) ([incr](Basics.html#incr) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z)))) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) 2 [+](Basics.html#0dacc1786c5ba797d47dd85006231633) [bin\_to\_nat](Basics.html#bin_to_nat) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z)).  
(\* FILL IN HERE \*) Admitted.  

---

Example [test\_bin\_incr7](#test_bin_incr7) : [bin\_to\_nat](Basics.html#bin_to_nat) ([B0](Basics.html#B<sub>0</sub>) ([B0](Basics.html#B<sub>0</sub>) ([B0](Basics.html#B<sub>0</sub>) ([B1](Basics.html#B<sub>1</sub>) [Z](Basics.html#Z))))) [=](https://rocq-prover.org/doc/V9.0.0/corelib//Corelib.Init.Logic.html#6cd0f7b28b6092304087c7049437bb1a) 8.  
(\* FILL IN HERE \*) Admitted.  
☐

# Optional: Testing Your Solutions

Each SF chapter comes with a test file containing scripts that
check whether you have solved the required exercises. If you're
using SF as part of a course, your instructor will likely be
running these test files to autograde your solutions. You can also
use these test files, if you like, to make sure you haven't missed
anything.Important: This step is *optional*: if you've completed all the
non-optional exercises and Rocq accepts your answers, this already
shows that you are in good shape.The test file for this chapter is BasicsTest.v. To run it, make
sure you have saved Basics.v to disk. Then first run
rocq compile -Q . LF Basics.v and then run rocq compile -Q . LF BasicsTest.v;
or, if you have make installed, you can run make BasicsTest.vo.
(Make sure you do this in a directory that also contains a file
named \_CoqProject containing the single line -Q . LF.)If you accidentally deleted an exercise or changed its name, then
make BasicsTest.vo will fail with an error that tells you the
name of the missing exercise. Otherwise, you will get a lot of
useful output:

- First will be all the output produced by Basics.v itself.
- Second, for each required exercise, there is a report that tells
  you its point value (the number of stars or some fraction
  thereof if there are multiple parts to the exercise), whether
  its type is ok, and what assumptions it relies upon.If the *type* is not ok, it means you proved the wrong thing:
  most likely, you accidentally modified the theorem statement
  while you were proving it. The autograder won't give you any
  points in this case, so make sure to correct the theorem.The *assumptions* are any unproved theorems which your solution
  relies upon. "Closed under the global context" is a fancy way
  of saying "none": you have solved the exercise. (Hooray!) On
  the other hand, a list of axioms means you haven't fully solved
  the exercise. (But see below regarding "Allowed Axioms.") If the
  exercise name itself is in the list, that means you haven't
  solved it; probably you have Admitted it.
- Third, you will see the maximum number of points in standard and
  advanced versions of the assignment. That number is based on
  the number of stars in the non-optional exercises. (In the
  present file, there are no advanced exercises.)
- Fourth, you will see a list of "Allowed Axioms". These are
  unproven theorems that your solution is permitted to depend
  upon, aside from the fundamental axioms of Rocq's logic. You'll
  probably see something about functional\_extensionality for
  this chapter; we'll cover what that means in a later chapter.
- Finally, you will see a summary of whether you have solved each
  exercise. Note that summary does not include the critical
  information of whether the type is ok (that is, whether you
  accidentally changed the theorem statement): you have to look
  above for that information.

Exercises that are manually graded will also show up in the
output. But since they have to be graded by a human, the test
script won't be able to tell you much about them.

(\* 2026-08-24 09:55 \*)

---

[Index](coqindex.html)

---

This page has been generated by [coqdoc](http://rocq-prover.org/)
