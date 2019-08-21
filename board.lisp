;;;; Reversi functions


;;; Display board functions
;; return whether Ith bit-board is 1 or 0.
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
        (white-flag "X")))

(defun bit-board2str (black-board white-board &optional (i 0))
  (if (> i 63)
      nil
      (let ((b-flag (ith-bit black-board i))
            (w-flag (ith-bit white-board i)))
           (concatenate 'string
               (when (= i 0)"*abcdefgh~%")
               (when (= (mod i 8) 0)
                     (write-to-string (+ 1 (floor i 8))))
               (bits2color b-flag w-flag)
               (when (= (mod i 8) 7) "~%")
               (bit-board2str black-board white-board (+ i 1))))))

(defun display-board (black-board white-board)
  (format t (bit-board2str black-board white-board)))


;;; Board controller functions
(defun str-corr2bit (corr)
  (let ((x (- (char-code (char corr 0)) 97))
        (y (- (char-code (char corr 1)) 49)))
       (when (not (assert (and (<= 0 x) (< x 8) (<= 0 y) (< y 8))))
             (ash 1 (+ x (* y 8))))))

(defun put-stone (black-board white-board stone-bin)
  ())
