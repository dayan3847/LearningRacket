#lang racket
;RUTH BETZABE CASTRO ACOSTA
; Función de la unión de dos conjuntos
(define (union set1 set2)
  (cond ((null? set1) set2)
        ((member (car set1) set2) (union (cdr set1) set2))
        (else (cons (car set1) (union (cdr set1) set2)))))
        
  (union '(1 2 3) '(4 5 6))
  
  ; Función de la intersección de dos conjuntos
(define (intersection set1 set2)
  (cond ((null? set1) '())
        ((member (car set1) set2) (cons (car set1) (intersection (cdr set1) set2)))
        (else (intersection (cdr set1) set2))))
  (intersection '(1 2 3) '(1 8 9))

; Función de la diferencia de dos conjuntos
(define (difference set1 set2)
  (cond ((null? set1) '())
        ((member (car set1) set2) (difference (cdr set1) set2))
        (else (cons (car set1) (difference (cdr set1) set2)))))
  (difference '(1 2 3) '(10 11 12))
  
  
; Función que verifica si dos conjuntos son iguales
(define (equal-set set1 set2)
  (and (subset? set1 set2) (subset? set2 set1)))
  (equal-set '(1 2 3) '(1 2 3))

