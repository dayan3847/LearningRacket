#lang racket

; hello world

(define (hello-world)
    (display "Hello World!"))

(hello-world)


(define word '(0 1 0 1 1))


; 1 is member of word
(display "Hello World!2")

(define f (member 1 word))
; cast f to boolean
(if f
    (display "1 is member of word")
    (display "1 is not member of word")
)
