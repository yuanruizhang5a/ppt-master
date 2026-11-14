# Basics-2 source coverage

The 80-slide deck follows the supplied `lf/Basics.html` and `lf/Basics.v` in chapter order. All 20 exercise labels occur in the same order in both sources. Visible code preserves all 171 source declarations and commands after comments and whitespace are ignored. Unfinished exercises retain their admitted status; no exercise solutions were added.

The corresponding full source passages appear in slide notes, covering all 2,052 source lines without gaps or duplication. Prose is condensed for teaching; code is reflowed for legibility.

## Slide-to-source map

| Slide | Title | Basics.v lines |
| --- | --- | --- |
| 01 | Basics: Functional Programming in Rocq | 1–12 |
| 02 | Introduction | 13–43 |
| 03 | Homework Submission Guidelines | 44–69 |
| 04 | Submitting and checking homework | 70–94 |
| 05 | Data and Functions: Enumerated Types | 95–114 |
| 06 | Days of the Week | 115–135 |
| 07 | The next working day | 136–154 |
| 08 | Computing with days | 155–170 |
| 09 | Examples, proofs, and extraction | 171–212 |
| 10 | Booleans | 213–250 |
| 11 | Boolean tests and notation | 251–281 |
| 12 | Conditional expressions | 282–308 |
| 13 | Conditionals on another type | 309–327 |
| 14 | Exercise: nandb | 328–360 |
| 15 | Exercise: andb3 | 361–380 |
| 16 | Types | 381–413 |
| 17 | New Types from Old | 414–449 |
| 18 | What the constructors generate | 450–480 |
| 19 | Matching constructor arguments | 481–499 |
| 20 | Modules | 500–519 |
| 21 | Tuples | 520–541 |
| 22 | Unwrapping a tuple | 542–563 |
| 23 | Numbers: choosing a representation | 564–602 |
| 24 | Unary natural numbers | 603–640 |
| 25 | Representations and predecessor | 641–670 |
| 26 | Numerals, minustwo, and constructors | 671–711 |
| 27 | Recursion: even and odd | 712–739 |
| 28 | Recursive addition | 740–771 |
| 29 | Recursive multiplication | 772–786 |
| 30 | Subtraction and exponentiation | 787–804 |
| 31 | Exercise: factorial | 805–828 |
| 32 | Arithmetic notation | 829–851 |
| 33 | Testing equality: eqb | 852–875 |
| 34 | Ordering: leb and boolean comparison | 876–909 |
| 35 | Exercise: ltb | 910–933 |
| 36 | Proof by Simplification | 934–964 |
| 37 | What reflexivity can do | 965–1006 |
| 38 | More simplification proofs | 1007–1038 |
| 39 | Proof by Rewriting | 1039–1084 |
| 40 | Exercise: plus_id_exercise | 1085–1112 |
| 41 | Rewriting with existing theorems | 1113–1136 |
| 42 | Exercise: mult_n_1 | 1137–1149 |
| 43 | When simplification gets stuck | 1150–1182 |
| 44 | Case analysis with destruct | 1183–1220 |
| 45 | Bullets and proof structure | 1221–1249 |
| 46 | Negation is involutive | 1250–1272 |
| 47 | Nested case analysis | 1273–1291 |
| 48 | Braces instead of bullets | 1292–1310 |
| 49 | Combining braces and bullets | 1311–1330 |
| 50 | Exercise: andb_true_elim2 | 1331–1353 |
| 51 | Case analysis while introducing | 1354–1387 |
| 52 | Exercise: zero_nbeq_plus_1 | 1388–1395 |
| 53 | More on Notation (Optional) | 1396–1441 |
| 54 | Structural Recursion (Optional) | 1442–1465 |
| 55 | Exercise: decreasing (Optional) | 1466–1481 |
| 56 | More Exercises: identity_fn_applied_twice | 1482–1500 |
| 57 | Exercise: negation_fn_applied_twice | 1501–1514 |
| 58 | Exercise: andb_eq_orb (Optional) | 1515–1531 |
| 59 | Course Late Policies, Formalized | 1532–1560 |
| 60 | Comparison and pattern abbreviations | 1561–1596 |
| 61 | Comparing letters | 1597–1625 |
| 62 | Exercise: letter_comparison | 1626–1632 |
| 63 | Comparing modifiers | 1633–1646 |
| 64 | Exercise: grade_comparison | 1647–1684 |
| 65 | Lowering a letter | 1685–1704 |
| 66 | An edge case invalidates a theorem | 1705–1729 |
| 67 | Exercise: lower_letter_lowers | 1730–1742 |
| 68 | Exercise: lower_grade | 1743–1772 |
| 69 | Testing lower_grade | 1773–1815 |
| 70 | Exercise: lower_grade_lowers | 1816–1837 |
| 71 | A concrete late-days policy | 1838–1855 |
| 72 | Exposing a definition for rewriting | 1856–1882 |
| 73 | Exercise: no_penalty_for_mostly_on_time | 1883–1895 |
| 74 | Exercise: grade_lowered_once | 1896–1908 |
| 75 | Binary Numerals | 1909–1938 |
| 76 | Exercise: binary functions | 1939–1953 |
| 77 | Binary unit tests | 1954–1985 |
| 78 | Optional: Testing Your Solutions | 1986–2009 |
| 79 | Interpreting types and assumptions | 2010–2030 |
| 80 | Scores, allowed axioms, and summary | 2031–2052 |

## Exercises

| Source exercise label | Slide | Basics.v line |
| --- | --- | --- |
| `nandb` | 14 | 328 |
| `andb3` | 15 | 361 |
| `factorial` | 31 | 805 |
| `ltb` | 35 | 910 |
| `plus_id_exercise` | 40 | 1085 |
| `mult_n_1` | 42 | 1137 |
| `andb_true_elim2` | 50 | 1331 |
| `zero_nbeq_plus_1` | 52 | 1388 |
| `decreasing` | 55 | 1466 |
| `identity_fn_applied_twice` | 56 | 1487 |
| `negation_fn_applied_twice` | 57 | 1501 |
| `andb_eq_orb` | 58 | 1515 |
| `letter_comparison` | 62 | 1626 |
| `grade_comparison` | 64 | 1647 |
| `lower_letter_lowers` | 67 | 1730 |
| `lower_grade` | 68 | 1743 |
| `lower_grade_lowers` | 70 | 1816 |
| `no_penalty_for_mostly_on_time` | 73 | 1883 |
| `graded_lowered_once` | 74 | 1896 |
| `binary` | 75 | 1911 |

## Verification limits

The native PPTX package is checked during export. PowerPoint itself is unavailable in this environment. The built-in SVG checker does not measure this compatible multiline text form; a separate check measures all 1,124 explicit visual lines with the exporter estimator.
