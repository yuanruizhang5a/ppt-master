Keep exercise names and exercises; use Admitted for unfinished work; helper definitions and admitted dependencies.

Source: Basics.v, lines 44–69; corresponding section in Basics.html.

(** * Homework Submission Guidelines *)

(** If you are using _Software Foundations_ in a course, your
    instructor may use automatic scripts to help grade your homework
    assignments.  In order for these scripts to work correctly (and
    ensure that you get full credit for your work!), please be
    careful to follow these rules:

      - Do not change the names of exercises. Otherwise the grading
        scripts will be unable to find your solution.
      - Do not delete exercises.  If you skip an exercise (e.g.,
        because it is marked "optional," or because you can't solve it),
        it is OK to leave a partial proof in your [.v] file; in
        this case, please make sure it ends with the keyword [Admitted]
        (not, for example, [Abort]).
      - It is fine to use additional definitions (of helper functions,
        useful lemmas, etc.) in your solutions.  You can put these
        before the theorem you are asked to prove.
      - If you introduce a helper lemma that you end up being unable
        to prove, hence end it with [Admitted], then make sure to also
        end the main theorem in which you use it with [Admitted], not
        [Qed].  This will make sure you get partial credit if you
        use that main theorem to solve a later exercise.

    You will also notice that each chapter (e.g., [Basics.v]) is
    accompanied by a _test script_ (e.g., [BasicsTest.v]) that