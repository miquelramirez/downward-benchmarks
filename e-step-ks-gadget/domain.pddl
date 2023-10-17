(define (domain e-step-gadget)
    (:requirements :typing :equality)

    (:types widget rank - object)

    (:predicates
        (foo1 ?r - rank ?w - widget)
        (foo2 ?r - rank ?w - widget)
        (foo3 ?r - rank ?w - widget)
        (foo4 ?r - rank ?w - widget)
        (foo5 ?r - rank ?w - widget)
        (foo6 ?r - rank ?w - widget)
        (before ?r1 - rank ?r2 - rank)
    )

    (:action action-1
        :parameters (?r1 - rank ?r2 - rank ?w - widget)
        :precondition (and
            (before ?r2 ?r1)
            (foo4 ?r2 ?w)
            (foo1 ?r1 ?w)
        )
        :effect (and
            (foo4 ?r1 ?w)
            (not (foo1 ?r1 ?w))
        )
    )

    (:action action-2
        :parameters (?r1 - rank ?r2 - rank ?w - widget)
        :precondition (and
            (before ?r2 ?r1)
            (foo5 ?r2 ?w)
            (foo2 ?r1 ?w)
        )
        :effect (and
            (foo5 ?r1 ?w)
            (not (foo1 ?r1 ?w))
            (not (foo2 ?r1 ?w))
        )
    )

    (:action action-3
        :parameters (?r1 - rank ?r2 - rank ?w - widget)
        :precondition (and
            (before ?r2 ?r1)
            (foo6 ?r2 ?w)
            (foo3 ?r1 ?w)
        )
        :effect (and
            (foo6 ?r1 ?w)
            (not (foo1 ?r1 ?w))
            (not (foo2 ?r1 ?w))
            (not (foo3 ?r1 ?w))
        )
    )
)