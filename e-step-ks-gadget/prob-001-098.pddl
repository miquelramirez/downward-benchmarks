
(define (problem prob-001-098)
    (:domain e-step-gadget)
    (:objects
        r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50 r51 r52 r53 r54 r55 r56 r57 r58 r59 r60 r61 r62 r63 r64 r65 r66 r67 r68 r69 r70 r71 r72 r73 r74 r75 r76 r77 r78 r79 r80 r81 r82 r83 r84 r85 r86 r87 r88 r89 r90 r91 r92 r93 r94 r95 r96 r97 r98 - rank
        w1 - widget
    )
    (:init

        ;; (before r0 r1) (before r1 r2) (before r2 r3) 
        (before r0 r1) (before r1 r2) (before r2 r3) (before r3 r4) (before r4 r5) (before r5 r6) (before r6 r7) (before r7 r8) (before r8 r9) (before r9 r10) (before r10 r11) (before r11 r12) (before r12 r13) (before r13 r14) (before r14 r15) (before r15 r16) (before r16 r17) (before r17 r18) (before r18 r19) (before r19 r20) (before r20 r21) (before r21 r22) (before r22 r23) (before r23 r24) (before r24 r25) (before r25 r26) (before r26 r27) (before r27 r28) (before r28 r29) (before r29 r30) (before r30 r31) (before r31 r32) (before r32 r33) (before r33 r34) (before r34 r35) (before r35 r36) (before r36 r37) (before r37 r38) (before r38 r39) (before r39 r40) (before r40 r41) (before r41 r42) (before r42 r43) (before r43 r44) (before r44 r45) (before r45 r46) (before r46 r47) (before r47 r48) (before r48 r49) (before r49 r50) (before r50 r51) (before r51 r52) (before r52 r53) (before r53 r54) (before r54 r55) (before r55 r56) (before r56 r57) (before r57 r58) (before r58 r59) (before r59 r60) (before r60 r61) (before r61 r62) (before r62 r63) (before r63 r64) (before r64 r65) (before r65 r66) (before r66 r67) (before r67 r68) (before r68 r69) (before r69 r70) (before r70 r71) (before r71 r72) (before r72 r73) (before r73 r74) (before r74 r75) (before r75 r76) (before r76 r77) (before r77 r78) (before r78 r79) (before r79 r80) (before r80 r81) (before r81 r82) (before r82 r83) (before r83 r84) (before r84 r85) (before r85 r86) (before r86 r87) (before r87 r88) (before r88 r89) (before r89 r90) (before r90 r91) (before r91 r92) (before r92 r93) (before r93 r94) (before r94 r95) (before r95 r96) (before r96 r97) (before r97 r98)

        ;; rank0
        (foo4 r0 w1)
        (foo5 r0 w1)
        (foo6 r0 w1)
            
        ;; (foo1 r1 w1) (foo2 r1 w1) ... (foo2 r2 w1) (foo3 r2 w1) ...
        (foo1 r1 w1) (foo2 r1 w1) (foo3 r1 w1) (foo1 r2 w1) (foo2 r2 w1) (foo3 r2 w1) (foo1 r3 w1) (foo2 r3 w1) (foo3 r3 w1) (foo1 r4 w1) (foo2 r4 w1) (foo3 r4 w1) (foo1 r5 w1) (foo2 r5 w1) (foo3 r5 w1) (foo1 r6 w1) (foo2 r6 w1) (foo3 r6 w1) (foo1 r7 w1) (foo2 r7 w1) (foo3 r7 w1) (foo1 r8 w1) (foo2 r8 w1) (foo3 r8 w1) (foo1 r9 w1) (foo2 r9 w1) (foo3 r9 w1) (foo1 r10 w1) (foo2 r10 w1) (foo3 r10 w1) (foo1 r11 w1) (foo2 r11 w1) (foo3 r11 w1) (foo1 r12 w1) (foo2 r12 w1) (foo3 r12 w1) (foo1 r13 w1) (foo2 r13 w1) (foo3 r13 w1) (foo1 r14 w1) (foo2 r14 w1) (foo3 r14 w1) (foo1 r15 w1) (foo2 r15 w1) (foo3 r15 w1) (foo1 r16 w1) (foo2 r16 w1) (foo3 r16 w1) (foo1 r17 w1) (foo2 r17 w1) (foo3 r17 w1) (foo1 r18 w1) (foo2 r18 w1) (foo3 r18 w1) (foo1 r19 w1) (foo2 r19 w1) (foo3 r19 w1) (foo1 r20 w1) (foo2 r20 w1) (foo3 r20 w1) (foo1 r21 w1) (foo2 r21 w1) (foo3 r21 w1) (foo1 r22 w1) (foo2 r22 w1) (foo3 r22 w1) (foo1 r23 w1) (foo2 r23 w1) (foo3 r23 w1) (foo1 r24 w1) (foo2 r24 w1) (foo3 r24 w1) (foo1 r25 w1) (foo2 r25 w1) (foo3 r25 w1) (foo1 r26 w1) (foo2 r26 w1) (foo3 r26 w1) (foo1 r27 w1) (foo2 r27 w1) (foo3 r27 w1) (foo1 r28 w1) (foo2 r28 w1) (foo3 r28 w1) (foo1 r29 w1) (foo2 r29 w1) (foo3 r29 w1) (foo1 r30 w1) (foo2 r30 w1) (foo3 r30 w1) (foo1 r31 w1) (foo2 r31 w1) (foo3 r31 w1) (foo1 r32 w1) (foo2 r32 w1) (foo3 r32 w1) (foo1 r33 w1) (foo2 r33 w1) (foo3 r33 w1) (foo1 r34 w1) (foo2 r34 w1) (foo3 r34 w1) (foo1 r35 w1) (foo2 r35 w1) (foo3 r35 w1) (foo1 r36 w1) (foo2 r36 w1) (foo3 r36 w1) (foo1 r37 w1) (foo2 r37 w1) (foo3 r37 w1) (foo1 r38 w1) (foo2 r38 w1) (foo3 r38 w1) (foo1 r39 w1) (foo2 r39 w1) (foo3 r39 w1) (foo1 r40 w1) (foo2 r40 w1) (foo3 r40 w1) (foo1 r41 w1) (foo2 r41 w1) (foo3 r41 w1) (foo1 r42 w1) (foo2 r42 w1) (foo3 r42 w1) (foo1 r43 w1) (foo2 r43 w1) (foo3 r43 w1) (foo1 r44 w1) (foo2 r44 w1) (foo3 r44 w1) (foo1 r45 w1) (foo2 r45 w1) (foo3 r45 w1) (foo1 r46 w1) (foo2 r46 w1) (foo3 r46 w1) (foo1 r47 w1) (foo2 r47 w1) (foo3 r47 w1) (foo1 r48 w1) (foo2 r48 w1) (foo3 r48 w1) (foo1 r49 w1) (foo2 r49 w1) (foo3 r49 w1) (foo1 r50 w1) (foo2 r50 w1) (foo3 r50 w1) (foo1 r51 w1) (foo2 r51 w1) (foo3 r51 w1) (foo1 r52 w1) (foo2 r52 w1) (foo3 r52 w1) (foo1 r53 w1) (foo2 r53 w1) (foo3 r53 w1) (foo1 r54 w1) (foo2 r54 w1) (foo3 r54 w1) (foo1 r55 w1) (foo2 r55 w1) (foo3 r55 w1) (foo1 r56 w1) (foo2 r56 w1) (foo3 r56 w1) (foo1 r57 w1) (foo2 r57 w1) (foo3 r57 w1) (foo1 r58 w1) (foo2 r58 w1) (foo3 r58 w1) (foo1 r59 w1) (foo2 r59 w1) (foo3 r59 w1) (foo1 r60 w1) (foo2 r60 w1) (foo3 r60 w1) (foo1 r61 w1) (foo2 r61 w1) (foo3 r61 w1) (foo1 r62 w1) (foo2 r62 w1) (foo3 r62 w1) (foo1 r63 w1) (foo2 r63 w1) (foo3 r63 w1) (foo1 r64 w1) (foo2 r64 w1) (foo3 r64 w1) (foo1 r65 w1) (foo2 r65 w1) (foo3 r65 w1) (foo1 r66 w1) (foo2 r66 w1) (foo3 r66 w1) (foo1 r67 w1) (foo2 r67 w1) (foo3 r67 w1) (foo1 r68 w1) (foo2 r68 w1) (foo3 r68 w1) (foo1 r69 w1) (foo2 r69 w1) (foo3 r69 w1) (foo1 r70 w1) (foo2 r70 w1) (foo3 r70 w1) (foo1 r71 w1) (foo2 r71 w1) (foo3 r71 w1) (foo1 r72 w1) (foo2 r72 w1) (foo3 r72 w1) (foo1 r73 w1) (foo2 r73 w1) (foo3 r73 w1) (foo1 r74 w1) (foo2 r74 w1) (foo3 r74 w1) (foo1 r75 w1) (foo2 r75 w1) (foo3 r75 w1) (foo1 r76 w1) (foo2 r76 w1) (foo3 r76 w1) (foo1 r77 w1) (foo2 r77 w1) (foo3 r77 w1) (foo1 r78 w1) (foo2 r78 w1) (foo3 r78 w1) (foo1 r79 w1) (foo2 r79 w1) (foo3 r79 w1) (foo1 r80 w1) (foo2 r80 w1) (foo3 r80 w1) (foo1 r81 w1) (foo2 r81 w1) (foo3 r81 w1) (foo1 r82 w1) (foo2 r82 w1) (foo3 r82 w1) (foo1 r83 w1) (foo2 r83 w1) (foo3 r83 w1) (foo1 r84 w1) (foo2 r84 w1) (foo3 r84 w1) (foo1 r85 w1) (foo2 r85 w1) (foo3 r85 w1) (foo1 r86 w1) (foo2 r86 w1) (foo3 r86 w1) (foo1 r87 w1) (foo2 r87 w1) (foo3 r87 w1) (foo1 r88 w1) (foo2 r88 w1) (foo3 r88 w1) (foo1 r89 w1) (foo2 r89 w1) (foo3 r89 w1) (foo1 r90 w1) (foo2 r90 w1) (foo3 r90 w1) (foo1 r91 w1) (foo2 r91 w1) (foo3 r91 w1) (foo1 r92 w1) (foo2 r92 w1) (foo3 r92 w1) (foo1 r93 w1) (foo2 r93 w1) (foo3 r93 w1) (foo1 r94 w1) (foo2 r94 w1) (foo3 r94 w1) (foo1 r95 w1) (foo2 r95 w1) (foo3 r95 w1) (foo1 r96 w1) (foo2 r96 w1) (foo3 r96 w1) (foo1 r97 w1) (foo2 r97 w1) (foo3 r97 w1) (foo1 r98 w1) (foo2 r98 w1) (foo3 r98 w1)
    )
    (:goal
        (and
            ;; (foo4 r3 w1) (foo5 r3 w1) (foo6 r3 w1)
            (foo4 r98 w1) (foo5 r98 w1) (foo6 r98 w1)
        )
    )
)