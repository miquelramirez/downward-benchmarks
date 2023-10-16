(define (domain russian-doll)
    (:requirements :typing :equality)

    (:types doll - object)

    (:predicates
        (out ?d - doll)
        (in ?d1 -doll ?d2 - doll)
        (empty ?d - doll)
    )

    (:action put-in
        :parameters (?d1 - doll ?d2 - doll)
        :precondition (and
            (empty ?d2)
            (out ?d1)
            (out ?d2)
        )
        :effect (and
            (not (empty ?d2))
            (not (out ?d1))
            (in ?d1 ?d2)
        )
    )

    (:action take-out
        :parameters (?d1 - doll ?d2 - doll)
        :precondition (and
            (in ?d1 ?d2)
            (out ?d2)
        )
        :effect (and
            (not (in ?d1 ?d2))
            (empty ?d2)
            (out ?d1)q
        )
    )
)