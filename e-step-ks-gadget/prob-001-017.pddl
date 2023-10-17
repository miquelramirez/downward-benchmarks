
(define (problem prob-001-017)
    (:domain e-step-gadget)
    (:objects
        r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 - rank
        w1 - widget
    )
    (:init

        ;; (before r0 r1) (before r1 r2) (before r2 r3) 
        (before r0 r1) (before r1 r2) (before r2 r3) (before r3 r4) (before r4 r5) (before r5 r6) (before r6 r7) (before r7 r8) (before r8 r9) (before r9 r10) (before r10 r11) (before r11 r12) (before r12 r13) (before r13 r14) (before r14 r15) (before r15 r16) (before r16 r17)

        ;; rank0
        (foo4 r0 w1)
        (foo5 r0 w1)
        (foo6 r0 w1)
            
        ;; (foo1 r1 w1) (foo2 r1 w1) ... (foo2 r2 w1) (foo3 r2 w1) ...
        (foo1 r1 w1) (foo2 r1 w1) (foo3 r1 w1) (foo1 r2 w1) (foo2 r2 w1) (foo3 r2 w1) (foo1 r3 w1) (foo2 r3 w1) (foo3 r3 w1) (foo1 r4 w1) (foo2 r4 w1) (foo3 r4 w1) (foo1 r5 w1) (foo2 r5 w1) (foo3 r5 w1) (foo1 r6 w1) (foo2 r6 w1) (foo3 r6 w1) (foo1 r7 w1) (foo2 r7 w1) (foo3 r7 w1) (foo1 r8 w1) (foo2 r8 w1) (foo3 r8 w1) (foo1 r9 w1) (foo2 r9 w1) (foo3 r9 w1) (foo1 r10 w1) (foo2 r10 w1) (foo3 r10 w1) (foo1 r11 w1) (foo2 r11 w1) (foo3 r11 w1) (foo1 r12 w1) (foo2 r12 w1) (foo3 r12 w1) (foo1 r13 w1) (foo2 r13 w1) (foo3 r13 w1) (foo1 r14 w1) (foo2 r14 w1) (foo3 r14 w1) (foo1 r15 w1) (foo2 r15 w1) (foo3 r15 w1) (foo1 r16 w1) (foo2 r16 w1) (foo3 r16 w1) (foo1 r17 w1) (foo2 r17 w1) (foo3 r17 w1)
    )
    (:goal
        (and
            ;; (foo4 r3 w1) (foo5 r3 w1) (foo6 r3 w1)
            (foo4 r17 w1) (foo5 r17 w1) (foo6 r17 w1)
        )
    )
)
