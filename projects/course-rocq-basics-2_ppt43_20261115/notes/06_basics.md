The seven constructors of day and their type.

Source: Basics.v, lines 115–135; corresponding section in Basics.html.

(** ** Days of the Week *)

(** To see how the datatype definition mechanism works, let's
    start with a very simple example.  The following declaration tells
    Rocq that we are defining a set of data values -- a _type_. *)

Inductive day : Type :=
  | monday
  | tuesday
  | wednesday
  | thursday
  | friday
  | saturday
  | sunday.

(** The new type is called [day], and its members are [monday],
    [tuesday], etc.

    Having defined [day], we can write functions that operate on
    days. *)