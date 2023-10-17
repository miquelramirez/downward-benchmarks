(define (problem prob-01-02)
    (:domain e-step-gadget)
    (:objects
        r0 r1 r2 - rank
        w1 - widget
    )
    (:init

        (before r0 r1)
        (before r1 r2)
        (foo4 r0 w1)
        (foo5 r0 w1)
        (foo6 r0 w1)

        (foo1 r1 w1)
        (foo2 r1 w1)
        (foo3 r1 w1)

        (foo1 r2 w1)
        (foo2 r2 w1)
        (foo3 r2 w1)
    )
    (:goal
        (and
            (foo4 r2 w1)
            (foo5 r2 w1)
            (foo6 r2 w1)
        )
    )
)