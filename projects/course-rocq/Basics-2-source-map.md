# Basics-2 source coverage

The 81-slide deck follows the supplied `lf/Basics.html` and `lf/Basics.v` in chapter order. All 20 exercise labels occur in the same order in both sources. Visible code preserves all 171 source declarations and commands after comments and whitespace are ignored. Unfinished exercises retain their admitted status; no exercise solutions were added.

The corresponding full source passages appear in slide notes, covering all 2,052 source lines without gaps or duplication. Prose is condensed for teaching; code is reflowed for legibility.

## Slide-to-source map

| Slide | Title | Basics.v lines |
| --- | --- | --- |
| 01 | Basics: Functional Programming in Rocq | 1–12 |
| 02 | Outline — HTML sections and subsections | Not applicable |
| 03 | Introduction | 13–43 |
| 04 | Homework Submission Guidelines | 44–69 |
| 05 | Submitting and checking homework | 70–94 |
| 06 | Data and Functions: Enumerated Types | 95–114 |
| 07 | Days of the Week | 115–135 |
| 08 | The next working day | 136–154 |
| 09 | Computing with days | 155–170 |
| 10 | Examples, proofs, and extraction | 171–212 |
| 11 | Booleans | 213–250 |
| 12 | Boolean tests and notation | 251–281 |
| 13 | Conditional expressions | 282–308 |
| 14 | Conditionals on another type | 309–327 |
| 15 | Exercise: nandb | 328–360 |
| 16 | Exercise: andb3 | 361–380 |
| 17 | Types | 381–413 |
| 18 | New Types from Old | 414–449 |
| 19 | What the constructors generate | 450–480 |
| 20 | Matching constructor arguments | 481–499 |
| 21 | Modules | 500–519 |
| 22 | Tuples | 520–541 |
| 23 | Unwrapping a tuple | 542–563 |
| 24 | Numbers: choosing a representation | 564–602 |
| 25 | Unary natural numbers | 603–640 |
| 26 | Representations and predecessor | 641–670 |
| 27 | Numerals, minustwo, and constructors | 671–711 |
| 28 | Recursion: even and odd | 712–739 |
| 29 | Recursive addition | 740–771 |
| 30 | Recursive multiplication | 772–786 |
| 31 | Subtraction and exponentiation | 787–804 |
| 32 | Exercise: factorial | 805–828 |
| 33 | Arithmetic notation | 829–851 |
| 34 | Testing equality: eqb | 852–875 |
| 35 | Ordering: leb and boolean comparison | 876–909 |
| 36 | Exercise: ltb | 910–933 |
| 37 | Proof by Simplification | 934–964 |
| 38 | What reflexivity can do | 965–1006 |
| 39 | More simplification proofs | 1007–1038 |
| 40 | Proof by Rewriting | 1039–1084 |
| 41 | Exercise: plus_id_exercise | 1085–1112 |
| 42 | Rewriting with existing theorems | 1113–1136 |
| 43 | Exercise: mult_n_1 | 1137–1149 |
| 44 | When simplification gets stuck | 1150–1182 |
| 45 | Case analysis with destruct | 1183–1220 |
| 46 | Bullets and proof structure | 1221–1249 |
| 47 | Negation is involutive | 1250–1272 |
| 48 | Nested case analysis | 1273–1291 |
| 49 | Braces instead of bullets | 1292–1310 |
| 50 | Combining braces and bullets | 1311–1330 |
| 51 | Exercise: andb_true_elim2 | 1331–1353 |
| 52 | Case analysis while introducing | 1354–1387 |
| 53 | Exercise: zero_nbeq_plus_1 | 1388–1395 |
| 54 | More on Notation (Optional) | 1396–1441 |
| 55 | Structural Recursion (Optional) | 1442–1465 |
| 56 | Exercise: decreasing (Optional) | 1466–1481 |
| 57 | More Exercises: identity_fn_applied_twice | 1482–1500 |
| 58 | Exercise: negation_fn_applied_twice | 1501–1514 |
| 59 | Exercise: andb_eq_orb (Optional) | 1515–1531 |
| 60 | Course Late Policies, Formalized | 1532–1560 |
| 61 | Comparison and pattern abbreviations | 1561–1596 |
| 62 | Comparing letters | 1597–1625 |
| 63 | Exercise: letter_comparison | 1626–1632 |
| 64 | Comparing modifiers | 1633–1646 |
| 65 | Exercise: grade_comparison | 1647–1684 |
| 66 | Lowering a letter | 1685–1704 |
| 67 | An edge case invalidates a theorem | 1705–1729 |
| 68 | Exercise: lower_letter_lowers | 1730–1742 |
| 69 | Exercise: lower_grade | 1743–1772 |
| 70 | Testing lower_grade | 1773–1815 |
| 71 | Exercise: lower_grade_lowers | 1816–1837 |
| 72 | A concrete late-days policy | 1838–1855 |
| 73 | Exposing a definition for rewriting | 1856–1882 |
| 74 | Exercise: no_penalty_for_mostly_on_time | 1883–1895 |
| 75 | Exercise: grade_lowered_once | 1896–1908 |
| 76 | Binary Numerals | 1909–1938 |
| 77 | Exercise: binary functions | 1939–1953 |
| 78 | Binary unit tests | 1954–1985 |
| 79 | Optional: Testing Your Solutions | 1986–2009 |
| 80 | Interpreting types and assumptions | 2010–2030 |
| 81 | Scores, allowed axioms, and summary | 2031–2052 |

## Exercises

| Source exercise label | Slide | Basics.v line |
| --- | --- | --- |
| `nandb` | 15 | 328 |
| `andb3` | 16 | 361 |
| `factorial` | 32 | 805 |
| `ltb` | 36 | 910 |
| `plus_id_exercise` | 41 | 1085 |
| `mult_n_1` | 43 | 1137 |
| `andb_true_elim2` | 51 | 1331 |
| `zero_nbeq_plus_1` | 53 | 1388 |
| `decreasing` | 56 | 1466 |
| `identity_fn_applied_twice` | 57 | 1487 |
| `negation_fn_applied_twice` | 58 | 1501 |
| `andb_eq_orb` | 59 | 1515 |
| `letter_comparison` | 63 | 1626 |
| `grade_comparison` | 65 | 1647 |
| `lower_letter_lowers` | 68 | 1730 |
| `lower_grade` | 69 | 1743 |
| `lower_grade_lowers` | 71 | 1816 |
| `no_penalty_for_mostly_on_time` | 74 | 1883 |
| `graded_lowered_once` | 75 | 1896 |
| `binary` | 76 | 1911 |

## Verification limits

The native PPTX package is checked during export. PowerPoint itself is unavailable in this environment. The built-in SVG checker does not measure this compatible multiline text form; a separate check measures all 1,124 explicit visual lines with the exporter estimator.
