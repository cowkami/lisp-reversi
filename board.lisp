;;;; Reversi functions


;;; Display board functions
;; return whether Ith bits-board is 1 or 0.
(defun ith-bit (board i)
  (if (> (logand 1 (ash board (- i))) 0)
      t
      nil))

(defun bits2color (black-flag white-flag)
  (cond ((assert (not (and black-flag white-flag))
                 () 
                 "Two stones are on one place."))
        ((not (or black-flag white-flag)) ".")
        (black-flag "O")
        (white-flag "@")))

(defun bits-board2string (black-stones white-stones &optional (i 0))
  (if (> i 63)
      nil
      (let ((b-flag (ith-bit black-stones i))
            (w-flag (ith-bit white-stones i)))
           (concatenate 'string
               (when (= i 0)"*abcdefgh~%")
               (when (= (mod i 8) 0)
                     (write-to-string (+ 1 (floor i 8))))
               (bits2color b-flag w-flag)
               (when (= (mod i 8) 7) "~%")
               (bits-board2string black-stones white-stones (+ i 1))))))

(defun display-board (black-stones white-stones)
  (format t (bits-board2string black-stones white-stones)))


;;; Board controller functions
(defun coordinates-string2bit (corr)
  (let ((x (- (char-code (char corr 0)) 97))
        (y (- (char-code (char corr 1)) 49)))
       (when (not (assert (and (<= 0 x) (< x 8) (<= 0 y) (< y 8))))
             (ash 1 (+ x (* y 8))))))

(defun put-stone (black-stones white-stones stone-bits stone-color)
  ())
