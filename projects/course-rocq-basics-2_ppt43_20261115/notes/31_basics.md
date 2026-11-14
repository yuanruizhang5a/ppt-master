1 star; mathematical recurrence, unfinished function, both named tests, := hint.

Source: Basics.v, lines 805–828; corresponding section in Basics.html.

(** **** Exercise: 1 star, standard (factorial)

    Recall the standard mathematical factorial function:

       factorial(0)  =  1
       factorial(n)  =  n * factorial(n-1)     (if n>0)

    Translate this into Rocq.

    Hint: Make sure you put a [:=] between the header we've provided
    and your definition.  If you see an error like "The reference
    factorial was not found in the current environment," it means
    you've forgotten the [:=]. *)

Fixpoint factorial (n:nat) : nat
  (* REPLACE THIS LINE WITH ":= _your_definition_ ." *). Admitted.

Example test_factorial1:          (factorial 3) = 6.
(* FILL IN HERE *) Admitted.
Example test_factorial2:          (factorial 5) = (mult 10 12).
(* FILL IN HERE *) Admitted.
(** [] *)

(** Again, we can make numerical expressions easier to read and write