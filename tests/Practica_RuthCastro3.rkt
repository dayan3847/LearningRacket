#lang racket
;RUTH BETZABE CASTRO ACOSTA
;Se crean dos conjuntos con sus elementos
(define conjunto1 '(5 7 2 1 9))

(define conjunto2 '(8 6 3 4 10))
;Unión de conjuntos
(define (union-conjuntos conjunto1 conjunto2)
  (cond ((null? conjunto1) conjunto2)
        ((member (car conjunto1) conjunto2) (union-conjuntos (cdr conjunto1) conjunto2))
        (else (cons (car conjunto1) (union-conjuntos (cdr conjunto1) conjunto2)))))
;Se imprime la unión
(display (union-conjuntos conjunto1 conjunto2))
(newline)
;Intersección de conjuntos
(define (interseccion-conjuntos conjunto1 conjunto2)
  (cond ((null? conjunto1) '())
        ((member (car conjunto1) conjunto2) (cons (car conjunto1) (interseccion-conjuntos (cdr conjunto1) conjunto2)))
        (else (interseccion-conjuntos (cdr conjunto1) conjunto2))))
;Se imprimen los conjuntos
(display (interseccion-conjuntos conjunto1 conjunto2))
(newline)

;Diferencia dos conjuntos
(define (diferencia-conjuntos conjunto1 conjunto2)
  (cond ((null? conjunto1) '())
        ((member (car conjunto1) conjunto2) (diferencia-conjuntos (cdr conjunto1) conjunto2))
        (else (cons (car conjunto1) (diferencia-conjuntos (cdr conjunto1) conjunto2)))))
;Se imprime la diferencia
(display (diferencia-conjuntos conjunto1 conjunto2))
(newline)

;Igualdad de conjuntos
(define (igualdad-conjuntos conjunto1 conjunto2)
  (and (subset-conjuntos conjunto1 conjunto2) (subset-conjuntos conjunto2 conjunto1)))

(display (igualdad-conjuntos conjunto1 conjunto2))

; Verifica que no existan elementos repetidos en los conjuntos
(define (subset-conjuntos conjunto1 conjunto2)
  (cond ((null? conjunto1) #t)
        ((member (car conjunto1) conjunto2) (subset-conjuntos (cdr conjunto1) conjunto2))
        (else #f)))
