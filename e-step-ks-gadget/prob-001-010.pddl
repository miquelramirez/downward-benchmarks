
(define (problem prob-001-010)
    (:domain e-step-gadget)
    (:objects
        r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 - rank
        w1 - widget
    )
    (:init

        ;; (before r0 r1) (before r1 r2) (before r2 r3) 
        (before r0 r1) (before r1 r2) (before r2 r3) (before r3 r4) (before r4 r5) (before r5 r6) (before r6 r7) (before r7 r8) (before r8 r9) (before r9 r10)

        ;; rank0
        (foo4 r0 w1)
        (foo5 r0 w1)
        (foo6 r0 w1)
            
        ;; (foo1 r1 w1) (foo2 r1 w1) ... (foo2 r2 w1) (foo3 r2 w1) ...
        (foo1 r1 w1) (foo2 r1 w1) (foo3 r1 w1) (foo1 r2 w1) (foo2 r2 w1) (foo3 r2 w1) (foo1 r3 w1) (foo2 r3 w1) (foo3 r3 w1) (foo1 r4 w1) (foo2 r4 w1) (foo3 r4 w1) (foo1 r5 w1) (foo2 r5 w1) (foo3 r5 w1) (foo1 r6 w1) (foo2 r6 w1) (foo3 r6 w1) (foo1 r7 w1) (foo2 r7 w1) (foo3 r7 w1) (foo1 r8 w1) (foo2 r8 w1) (foo3 r8 w1) (foo1 r9 w1) (foo2 r9 w1) (foo3 r9 w1) (foo1 r10 w1) (foo2 r10 w1) (foo3 r10 w1)
    )
    (:goal
        (and
            ;; (foo4 r3 w1) (foo5 r3 w1) (foo6 r3 w1)
            (foo4 r10 w1) (foo5 r10 w1) (foo6 r10 w1)
        )
    )
)