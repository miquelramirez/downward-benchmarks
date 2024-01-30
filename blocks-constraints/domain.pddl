;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world with constraints
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain BLOCKS_CONSTRAINTS)
  (:requirements :typing :constraints :equality)
  (:types block - object)


  (:predicates  (on ?x ?y - block)
	            (ontable ?x - block)
	            (clear ?x - block)
	            (handempty)
	            (holding ?x - block)
  )

  (:constraints

    (and

        (forall (?x - block ?y - block)
            (imply    (holding ?x)
                        (not (on ?x ?y)))
        )

        (forall (?x - block ?y - block)
                (imply    (on ?x ?y)
                            (not (clear ?y))
                )
        )

        (forall (?x - block ?y - block)
                (imply    (on ?x ?y)
                            (not (holding ?y))
                )
        )

        (forall (?x - block ?y - block)
                (imply (ontable ?x) (not (on ?x ?y)))
        )

        (forall (?x - block ?y - block)
                (imply (ontable ?x) (not (holding ?x)))
        )

        (forall (?x - block) (not (on ?x ?x)))
    )

  )


  (:action pick-up
	     :parameters (?x - block)
	     :precondition (and (clear ?x) (ontable ?x) (handempty))
	     :effect
	     (and (not (ontable ?x))
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x))
  )

  (:action put-down
	     :parameters (?x - block)
	     :precondition (holding ?x)
	     :effect
	     (and (not (holding ?x))
		   (clear ?x)
		   (handempty)
		   (ontable ?x))
  )

  (:action stack
	     :parameters (?x ?y - block)
	     :precondition (and (holding ?x) (clear ?y))
	     :effect
	     (and (not (holding ?x))
		   (not (clear ?y))
		   (clear ?x)
		   (handempty)
		   (on ?x ?y))
  )

  (:action unstack
	     :parameters (?x ?y - block)
	     :precondition (and (on ?x ?y) (clear ?x) (handempty))
	     :effect
	     (and (holding ?x)
		   (clear ?y)
		   (not (clear ?x))
		   (not (handempty))
		   (not (on ?x ?y)))
  )

)
