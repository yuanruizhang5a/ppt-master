BasicsTest.v commands, files to submit, Canvas submission guidance.

Source: Basics.v, lines 70–94; corresponding section in Basics.html.

    automatically calculates points for the finished homework problems
    in the chapter.  These scripts are mostly for the auto-grading
    tools, but you may also want to use them to double-check that your
    file is well formatted before handing it in.  In a terminal
    window, either type "[make BasicsTest.vo]" or do the following:

       rocq compile -Q . LF Basics.v
       rocq compile -Q . LF BasicsTest.v

    See the end of this chapter for more information about how to interpret
    the output of test scripts.

    There is no need to hand in [BasicsTest.v] itself (or [Preface.v]).

    If your class is using the Canvas system to hand in assignments...
      - If you submit multiple versions of the assignment, you may
        notice that they are given different names.  This is fine: The
        most recent submission is the one that will be graded.
      - If you are handing in multiple files at the same time (i.e.,
        if more than one chapter is assigned in the same week), you
        should make a _single_ submission with all the files at once
        by using the "Add another file" button just above the comment
        box. *)

(* ################################################################# *)