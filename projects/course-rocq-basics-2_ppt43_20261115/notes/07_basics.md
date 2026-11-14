Exact next_working_day definition; explicit argument and return types and type inference.

Source: Basics.v, lines 136–154; corresponding section in Basics.html.

Definition next_working_day (d:day) : day :=
  match d with
  | monday    => tuesday
  | tuesday   => wednesday
  | wednesday => thursday
  | thursday  => friday
  | friday    => monday
  | saturday  => monday
  | sunday    => monday
  end.

(** Note that the argument and return types of this function are
    explicitly declared on the first line.  Like most functional
    programming languages, Rocq can often figure out these types for
    itself when they are not given explicitly -- i.e., it can do _type
    inference_ -- but we'll generally include them to make reading
    easier. *)

(** Having defined a function, we can check that it works on