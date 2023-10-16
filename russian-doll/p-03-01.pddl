(define (problem p-03-01)
    (:domain russian-doll)
    (:objects
        d1 d2 d3 - doll
    )
    (:init
        (out d1)
        (out d2)
        (out d3)
        (empty d1)
        (empty d2)
        (empty d3)
    )
    (:goal
        (and
            (in d1 d2)
            (in d2 d3)
        )
    )
)