;; a cps-transform progam for racket

;;lang racket

(define tempNum 0)

(define (gentemp tempnum) 
	(set! tempnum (random 1000))
	(string-append "K" `,tempnum))   

(define (cpc sexpr env cont)
	(cond ((atom? sexpr) (cpc-atom sexpr env cont))
		((quote? (car sexpr))
			(if cont `( ,cont ,sexpr) sexpr))
		((lambda? (car sexpr)) (cpc-lambda expr env cont))
		((if? (car sexpr)) (cpc-lambda expr env cont))
		(else ())))

(define (atom? sexpr)
	(not (pair? sexpr)))

(define (quote? sym)
	(or (eq? sym "'")
		(eq? sym """)
		(eq? sym "quote")))

(define (lambda? sym)
	(eq? sym "lambda"))

(define (if? sym)
	(eq? sym "if"))



