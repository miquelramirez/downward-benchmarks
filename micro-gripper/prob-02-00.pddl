(define (problem micro-gripper-02-00)
   (:domain gripper-strips)
   (:objects rooma roomb ball2 ball1 left right)
   (:init (room rooma)
          (room roomb)
          (ball ball2)
          (ball ball1)
          (at-robby rooma)
          (free left)
          (free right)
          (at ball2 rooma)
          (at ball1 rooma)
          (gripper left)
          (gripper right))
   (:goal (and  (at-robby roomb)
                (carry ball2 left)
                (carry ball1 right))
   )
)