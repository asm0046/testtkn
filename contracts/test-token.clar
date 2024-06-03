(define-token test-token)

(define-constant token-name (some "Test Token"))
(define-constant token-symbol (some "TK"))
(define-constant token-decimals u8)
(define-constant token-total-supply u1000000000) ; 1 milyar token

(define-map balances 
  ((address principal))
  ((balance int))
)

(define-constant contract-owner (as-contract tx-sender))

(define-public (initialize)
  (begin
    (map-insert balances
      ((address contract-owner))
      ((balance token-total-supply))
    )
    (ok token-total-supply)
  )
)

(define-public (transfer (recipient principal) (amount int))
  (let (
    (sender-balance (default-to 0 (get balance (map-get? balances ((address tx-sender))))))
    (recipient-balance (default-to 0 (get balance (map-get? balances ((address recipient))))))
  )
    (if (<= amount sender-balance)
      (begin
        (map-set balances ((address tx-sender)) ((balance (- sender-balance amount))))
        (map-set balances ((address recipient)) ((balance (+ recipient-balance amount))))
        (ok true)
      )
      (err u1)
    )
  )
)

(define-read-only (get-balance (account principal))
  (default-to 0 (get balance (map-get? balances ((address account)))))
)
