(define (problem prob-01-01)
    (:domain e-step-gadget)
    (:objects
        r0 r1 - rank
        w1 - widget
    )
    (:init

        (before r0 r1)
        (foo4 r0 w1)
        (foo5 r0 w1)
        (foo6 r0 w1)

        (foo1 r1 w1)
        (foo2 r1 w1)
        (foo3 r1 w1)
    )
    (:goal
        (and
            (foo4 r1 w1)
            (foo5 r1 w1)
            (foo6 r1 w1)
        )
    )
)