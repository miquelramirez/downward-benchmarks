(define (problem prob-01-03)
    (:domain e-step-gadget)
    (:objects
        r0 r1 r2 r3 - rank
        w1 - widget
    )
    (:init

        (before r0 r1)
        (before r1 r2)
        (before r2 r3)
        (foo4 r0 w1)
        (foo5 r0 w1)
        (foo6 r0 w1)

        (foo1 r1 w1)
        (foo2 r1 w1)
        (foo3 r1 w1)

        (foo1 r2 w1)
        (foo2 r2 w1)
        (foo3 r2 w1)

        (foo1 r3 w1)
        (foo2 r3 w1)
        (foo3 r3 w1)
    )
    (:goal
        (and
            (foo4 r3 w1)
            (foo5 r3 w1)
            (foo6 r3 w1)
        )
    )
)