(define (problem prob-01-01)
    (:domain e-step-gadget)
    (:objects
        w1 - widget
    )
    (:init
        (foo1 w1)
        (foo2 w1)
        (foo3 w1)
    )
    (:goal
        (and
            (foo4 w1)
            (foo5 w1)
            (foo6 w1)
        )
    )
)