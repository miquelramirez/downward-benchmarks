(define (problem BLOCKS-TEST)

    (:domain BLOCKS)
    (:objects D B A C)
    (:init
            (CLEAR C) (CLEAR A) (CLEAR B) (CLEAR D) (ONTABLE C) (ONTABLE A)
            (ONTABLE B) (ONTABLE D) (HANDEMPTY))

    (:goal (AND (ON D C)))
)