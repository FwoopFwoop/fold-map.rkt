#lang racket

(require (for-syntax racket/match))
(require (for-syntax racket/list))

(provide foldmapr foldmapl)

(define-syntax (foldmapr stx)
  (define crunch
    (λ [foldr base map lst]
      (cond [(empty? lst) base]
            [(cons? lst) (foldr (map (car lst)) (crunch foldr base map (cdr lst)))])))
  (match (syntax->list stx) [(list fmr f-f f-b m-f lst)
                             (datum->syntax stx `(,crunch ,f-f ,f-b ,m-f ,lst))]))

(define-syntax (foldmapl stx)
  (define (chomp foldl base map lst)
    (cond
      [(empty? lst) base]
      [(cons? lst) (chomp foldl (foldl (map (first lst)) base) map (rest lst))]))
  (match (syntax->list stx) [(list fml f-f f-b m-f lst)
                             (datum->syntax stx `(,chomp ,f-f ,f-b ,m-f ,lst))]))