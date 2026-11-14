Remaining named examples, repeated lowering, F- theorem and fractional grading metadata.

Source: Basics.v, lines 1773–1815; corresponding section in Basics.html.

Example lower_grade_A_Minus :
  lower_grade (Grade A Minus) = (Grade B Plus).
Proof.
(* FILL IN HERE *) Admitted.

Example lower_grade_B_Plus :
  lower_grade (Grade B Plus) = (Grade B Natural).
Proof.
(* FILL IN HERE *) Admitted.

Example lower_grade_F_Natural :
  lower_grade (Grade F Natural) = (Grade F Minus).
Proof.
(* FILL IN HERE *) Admitted.

Example lower_grade_twice :
  lower_grade (lower_grade (Grade B Minus)) = (Grade C Natural).
Proof.
(* FILL IN HERE *) Admitted.

Example lower_grade_thrice :
  lower_grade (lower_grade (lower_grade (Grade B Minus))) = (Grade C Minus).
Proof.
(* FILL IN HERE *) Admitted.

(** Rocq makes no distinction between an [Example] and a [Theorem]. We
    state the following as a [Theorem] only as a hint that we will use
    it in proofs below. *)
Theorem lower_grade_F_Minus : lower_grade (Grade F Minus) = (Grade F Minus).
Proof.
(* FILL IN HERE *) Admitted.

(* GRADE_THEOREM 0.25: lower_grade_A_Plus *)
(* GRADE_THEOREM 0.25: lower_grade_A_Natural *)
(* GRADE_THEOREM 0.25: lower_grade_A_Minus *)
(* GRADE_THEOREM 0.25: lower_grade_B_Plus *)
(* GRADE_THEOREM 0.25: lower_grade_F_Natural *)
(* GRADE_THEOREM 0.25: lower_grade_twice *)
(* GRADE_THEOREM 0.25: lower_grade_thrice *)
(* GRADE_THEOREM 0.25: lower_grade_F_Minus

    [] *)