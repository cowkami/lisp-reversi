(load "./game.lisp")

(defvar black-board #b0000000000000000000000000000100000010000000000000000000000000000)
(defvar white-board #b0000000000000000000000000001000000001000000000000000000000000000)

;;; return whether Ith bit-board is 1 or 0.
(defun ith-flag (board i)
  (if (> (logand 1 (ash board (- i))) 0)
      t
      nil))

(defun bits2color (black-flag white-flag)
  (cond ((assert (not (and black-flag white-flag))
                 nil 
                 "Two stones are on one place."))
        ((not (or black-flag white-flag)) ".")
        (black-flag "o")
        (white-flag"x")))

(defun bit-board2str (b-board w-board &optional (i 0))
  (if (> i 63)
      nil
      (let ((b-flag (ith-flag b-board i))
            (w-flag (ith-flag w-board i)))
           (concatenate 'string
               (when (= i 0)
                     "*12345678*~%")
               (when (= (mod i 8) 0)
                     (string (code-char (+ (char-code #\a) (floor i 8)))))
               (bits2color b-flag w-flag)
               (when (= (mod i 8) 7) "~%")
               (bit-board2str b-board w-board (+ i 1))))))

(defun main()
  (let ((black-board ))))

