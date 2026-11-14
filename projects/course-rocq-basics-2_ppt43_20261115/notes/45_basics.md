Whole subgoal proofs, completion checks, readable nesting, line-length advice and simplification of S case.

Source: Basics.v, lines 1221–1249; corresponding section in Basics.html.

    Marking cases with bullets is optional: if bullets are not
    present, Rocq simply expects you to prove each subgoal in
    sequence, one at a time. But it is a good idea to use bullets, and
    you should make a habit of doing it! For one thing, bullets make
    the structure of a proof apparent, improving readability.
    Moreover, bullets instruct Rocq to ensure that a subgoal is
    complete before trying to verify the next one, preventing proofs
    for different subgoals from getting mixed up. These issues become
    especially important in larger developments, where fragile proofs
    can lead to long debugging sessions!

    There are no hard and fast rules for how proofs should be
    formatted in Rocq -- e.g., where lines should be broken and how
    sections of the proof should be indented to indicate their nested
    structure.  However, if the places where multiple subgoals are
    generated are marked with explicit bullets at the beginning of
    lines, then the proof will be readable almost no matter what
    choices are made about other aspects of layout.

    This is also a good place to mention one other piece of somewhat
    obvious advice about line lengths. Beginning Rocq users sometimes
    tend to the extremes, either writing each tactic on its own line
    or writing entire proofs on a single line. Good style lies
    somewhere in the middle. One reasonable guideline is to limit
    yourself to 80 (or, if you have a wide screen or good eyes,
    120) character lines.

    The [destruct] tactic can be used with any inductively defined
    datatype.  For example, we use it next to prove that boolean