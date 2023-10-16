(define (domain e-step-gadget)
    (:requirements :typing :equality)

    (:types widget - object)

    (:predicates
        (foo1 ?w - widget)
        (foo2 ?w - widget)
        (foo3 ?w - widget)
        (foo4 ?w - widget)
        (foo5 ?w - widget)
        (foo6 ?w - widget)
    )

    (:action action-1
        :parameters (?w - widget)
        :precondition (and
            (foo1 ?w)
        )
        :effect (and
            (foo4 ?w)
            (not (foo1 ?w))
        )
    )

    (:action action-2
        :parameters (?w - widget)
        :precondition (and
            (foo2 ?w)
        )
        :effect (and
            (foo5 ?w)
            (not (foo1 ?w))
            (not (foo2 ?w))
        )
    )

    (:action action-3
        :parameters (?w - widget)
        :precondition (and
            (foo3 ?w)
        )
        :effect (and
            (foo6 ?w)
            (not (foo1 ?w))
            (not (foo2 ?w))
            (not (foo3 ?w))
        )
    )
)