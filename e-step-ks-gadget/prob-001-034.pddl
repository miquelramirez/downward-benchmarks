
(define (problem prob-001-034)
    (:domain e-step-gadget)
    (:objects
        r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 - rank
        w1 - widget
    )
    (:init

        ;; (before r0 r1) (before r1 r2) (before r2 r3) 
        (before r0 r1) (before r1 r2) (before r2 r3) (before r3 r4) (before r4 r5) (before r5 r6) (before r6 r7) (before r7 r8) (before r8 r9) (before r9 r10) (before r10 r11) (before r11 r12) (before r12 r13) (before r13 r14) (before r14 r15) (before r15 r16) (before r16 r17) (before r17 r18) (before r18 r19) (before r19 r20) (before r20 r21) (before r21 r22) (before r22 r23) (before r23 r24) (before r24 r25) (before r25 r26) (before r26 r27) (before r27 r28) (before r28 r29) (before r29 r30) (before r30 r31) (before r31 r32) (before r32 r33) (before r33 r34)

        ;; rank0
        (foo4 r0 w1)
        (foo5 r0 w1)
        (foo6 r0 w1)
            
        ;; (foo1 r1 w1) (foo2 r1 w1) ... (foo2 r2 w1) (foo3 r2 w1) ...
        (foo1 r1 w1) (foo2 r1 w1) (foo3 r1 w1) (foo1 r2 w1) (foo2 r2 w1) (foo3 r2 w1) (foo1 r3 w1) (foo2 r3 w1) (foo3 r3 w1) (foo1 r4 w1) (foo2 r4 w1) (foo3 r4 w1) (foo1 r5 w1) (foo2 r5 w1) (foo3 r5 w1) (foo1 r6 w1) (foo2 r6 w1) (foo3 r6 w1) (foo1 r7 w1) (foo2 r7 w1) (foo3 r7 w1) (foo1 r8 w1) (foo2 r8 w1) (foo3 r8 w1) (foo1 r9 w1) (foo2 r9 w1) (foo3 r9 w1) (foo1 r10 w1) (foo2 r10 w1) (foo3 r10 w1) (foo1 r11 w1) (foo2 r11 w1) (foo3 r11 w1) (foo1 r12 w1) (foo2 r12 w1) (foo3 r12 w1) (foo1 r13 w1) (foo2 r13 w1) (foo3 r13 w1) (foo1 r14 w1) (foo2 r14 w1) (foo3 r14 w1) (foo1 r15 w1) (foo2 r15 w1) (foo3 r15 w1) (foo1 r16 w1) (foo2 r16 w1) (foo3 r16 w1) (foo1 r17 w1) (foo2 r17 w1) (foo3 r17 w1) (foo1 r18 w1) (foo2 r18 w1) (foo3 r18 w1) (foo1 r19 w1) (foo2 r19 w1) (foo3 r19 w1) (foo1 r20 w1) (foo2 r20 w1) (foo3 r20 w1) (foo1 r21 w1) (foo2 r21 w1) (foo3 r21 w1) (foo1 r22 w1) (foo2 r22 w1) (foo3 r22 w1) (foo1 r23 w1) (foo2 r23 w1) (foo3 r23 w1) (foo1 r24 w1) (foo2 r24 w1) (foo3 r24 w1) (foo1 r25 w1) (foo2 r25 w1) (foo3 r25 w1) (foo1 r26 w1) (foo2 r26 w1) (foo3 r26 w1) (foo1 r27 w1) (foo2 r27 w1) (foo3 r27 w1) (foo1 r28 w1) (foo2 r28 w1) (foo3 r28 w1) (foo1 r29 w1) (foo2 r29 w1) (foo3 r29 w1) (foo1 r30 w1) (foo2 r30 w1) (foo3 r30 w1) (foo1 r31 w1) (foo2 r31 w1) (foo3 r31 w1) (foo1 r32 w1) (foo2 r32 w1) (foo3 r32 w1) (foo1 r33 w1) (foo2 r33 w1) (foo3 r33 w1) (foo1 r34 w1) (foo2 r34 w1) (foo3 r34 w1)
    )
    (:goal
        (and
            ;; (foo4 r3 w1) (foo5 r3 w1) (foo6 r3 w1)
            (foo4 r34 w1) (foo5 r34 w1) (foo6 r34 w1)
        )
    )
)
