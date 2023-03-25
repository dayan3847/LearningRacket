# Learning Racket

## Operates Automata Word

### Exercise 5

Escribe una función llamada (opera automata palabra) que implemente la operación de un autómata finito
determinista definido como una lista de listas para validar una palabra definida como lista de átomos. A
continuación se muestra la estructura de la definición del autómata por su tabla de transiciones y la estructura
principal de la función opera.

````
; Automata para las palabras en {0,1} que

; tienen un numero impar de 1's

(define automata '(((a 1 b) (a 0 a) (b 1 a) (b 0 b)) a (b) ))
(define palabra '(0 1 0 1 1))
(define (opera automata palabra)
(define transiciones (car automata))
(define inicial (cadr automata))
(define finales (caddr automata))
(verifica transiciones inicial finales palabra))
(opera automata palabra)
````
