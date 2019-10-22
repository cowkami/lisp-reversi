;;;; Main


;;; load modules
(load "./game.lisp")
(load "./board.lisp")

(defparameter *black-stones* #x810000000)
(defparameter *white-stones* #x1008000000)

(defun main ()
  (display-board *black-stones* *white-stones*))

