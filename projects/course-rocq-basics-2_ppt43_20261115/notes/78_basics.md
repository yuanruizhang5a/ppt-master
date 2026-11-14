Optional status; save and compile source, then test script, or make; _CoqProject requirement and missing-name errors.

Source: Basics.v, lines 1986–2009; corresponding section in Basics.html.

(** * Optional: Testing Your Solutions *)

(** Each SF chapter comes with a test file containing scripts that
    check whether you have solved the required exercises. If you're
    using SF as part of a course, your instructor will likely be
    running these test files to autograde your solutions. You can also
    use these test files, if you like, to make sure you haven't missed
    anything.

    Important: This step is _optional_: if you've completed all the
    non-optional exercises and Rocq accepts your answers, this already
    shows that you are in good shape.

    The test file for this chapter is [BasicsTest.v]. To run it, make
    sure you have saved [Basics.v] to disk.  Then first run
    [rocq compile -Q . LF Basics.v] and then run [rocq compile -Q . LF BasicsTest.v];
    or, if you have make installed, you can run [make BasicsTest.vo].
    (Make sure you do this in a directory that also contains a file
    named [_CoqProject] containing the single line [-Q . LF].)

    If you accidentally deleted an exercise or changed its name, then
    [make BasicsTest.vo] will fail with an error that tells you the
    name of the missing exercise.  Otherwise, you will get a lot of
    useful output: