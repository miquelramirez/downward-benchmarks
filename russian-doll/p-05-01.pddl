(define (problem p-05-01)
    (:domain russian-doll)
    (:objects
        d1 d2 d3 d4 d5 - doll
    )
    (:init
        (out d1)
        (out d2)
        (out d3)
        (out d4)
        (out d5)
        (empty d1)
        (empty d2)
        (empty d3)
        (empty d4)
        (empty d5)
    )
    (:goal
        (and
            (in d1 d2)
            (in d2 d3)
            (in d3 d4)
            (in d4 d5)
        )
    )
)