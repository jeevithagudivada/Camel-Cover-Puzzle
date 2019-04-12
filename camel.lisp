;;;This code will initialize variables, initialize the moves and does recursion along with checking the valid moves and visited paths


;;;initalize variables
(setq steps 0)
(setq visited-list ())

;;;initialize the moves using starting point(row col)
(defun get-values (row col)
  (list 
;;; there are at most eight possible move values 
    (list (+ row 3) (+ col 1))
    (list (+ row 3) (- col 1))
    (list (+ row 1) (+ col 3))
    (list (+ row 1) (- col 3))

    (list (- row 3) (+ col 1))
    (list (- row 3) (- col 1))
    (list (- row 1) (+ col 3))
    (list (- row 1) (- col 3))) )


;;; check if "l" is a member of "visited"
;;; return 't' if so
(defun list-member (l visited)
  (cond
    ((null visited) nil)
    ((equal (car visited) l) t)
    (t (list-member l (cdr visited)))) )

;;; test_valid_values will return a list containing only the valid
;;; values allowed, removing those values that have already been
;;; visited and are not on the board
(defun test-valid-values (vals)
  (let 
;;; grab the first value out of the vals list
    ((v (car vals)))
  (cond
    ((null vals) ()) 
;;; test for out of bound values, or already traversed
;;; if value is out of bound, remove it (cdr vals)
;;; disable (3 3) 
    ((or (> (car v)  6) (< (car v)  0) 
         (> (cadr v) 6) (< (cadr v) 0)
	     (and (eq (car v) 3) (eq (cadr v) 3))
         (list-member v visited-list))
            (test-valid-values (cdr vals)))
;;; value is valid, add to our "valid" list
    (t (cons (car vals) 
             (test-valid-values (cdr vals)))))) )

(defun recurse-down ()
;;; get the valid values, store as val
  (let
    ((vals (test-valid-values
		(get-values
		(car (car (last visited-list))) (cadr (car (last visited-list)))))))
    (cond
;;; no valid values, backtrack 
;;; note, that we test for sucessful completion before this 
      ((null vals) nil)
;;; else recurse across
      (t (recurse-across vals)))) )

(defun recurse-across (vals)
  (cond
;;; no more valid moves, backtrack
    ((null vals) nil)
    (t 
      (cond
;;; if number of steps taken equals number of squares on board
;;; then we're done
      ((equal (+ steps 1) 17) 
;;; increment number of steps, add new visited square
        (setq steps (+ steps 1)) 
        (setq visited-list (append visited-list (list (car vals)))) 
;;; return t 
        t)
      (t
;;; else continue moving until end
;;; increment steps and add to visited-list 
        (setq steps (+ steps 1))
        (setq visited-list (append visited-list (list (car vals))))
;;; (format t "Steps:~D Path:~S~%"  steps visited-list)
        (cond 
;;; recurse down, return t if recurse_down found solution
          ((recurse-down) t)
          (t 
;;; if recurse_down did not find solution, backtrack, removing
;;; moves from visited-list and from "steps" as we backtrack
;;; and then recurse_across
            (setq steps (- steps 1))
            (setq visited-list (reverse (cdr (reverse visited-list))))
            (recurse-across (cdr vals)))))))) )

(defun find-camels-path (row col)
;;; set the global variables
  (setq visited-list (list (list row col)))
  (setq steps 1)
;;; start searching...
  (cond
    ((recurse-down) visited-list)
    (t nil)) )

