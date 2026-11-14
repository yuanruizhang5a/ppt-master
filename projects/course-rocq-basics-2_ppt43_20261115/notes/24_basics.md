NatPlayground.nat, O and S; precise closure and exclusion rules, finite constructor expressions.

Source: Basics.v, lines 603–640; corresponding section in Basics.html.

    definition: *)

Inductive nat : Type :=
  | O
  | S (n : nat).

(** With this definition, 0 is represented by [O], 1 by [S O],
    2 by [S (S O)], and so on. *)

(** Informally, the clauses of the definition can be read:
      - [O] is a natural number (remember this is the letter "[O],"
        not the numeral "[0]").
      - [S] can be put in front of a natural number to yield another
        one -- i.e., if [n] is a natural number, then [S n] is too. *)

(** Again, let's look at this a bit more closely.  The definition
    of [nat] says how expressions in the set [nat] can be built:

    - the constructor expression [O] belongs to the set [nat];
    - if [n] is a constructor expression belonging to the set [nat],
      then [S n] is also a constructor expression belonging to the set
      [nat]; and
    - constructor expressions formed in these two ways are the only
      ones belonging to the set [nat]. *)

(** These conditions are the precise force of the [Inductive]
    declaration that we gave to Rocq.  They imply that the constructor
    expression [O], the constructor expression [S O], the constructor
    expression [S (S O)], the constructor expression [S (S (S O))],
    and so on all belong to the set [nat], while other constructor
    expressions like [true], [andb true false], [S (S false)], and
    [O (O (O S))] do not.

    A critical point here is that what we've done so far is just to
    define a _representation_ of numbers: a way of writing them down.
    The names [O] and [S] are arbitrary, and at this point they have
    no special meaning -- they are just two different marks that we
    can use to write down numbers, together with a rule that says any