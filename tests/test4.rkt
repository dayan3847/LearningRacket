#lang racket

; si tenemos una lista de trios
(define list '(((a 1 b) (a 0 a) (b 1 a) (b 0 b)) a (b) ))
(car list)
(car (car list))
(car (car (car list)))

