;; Token sözleşmesini test etmek için bazı senaryolar
(define-private (asserts-true (condition bool))
  (if (not condition) (err u999) (ok true))
)

(begin
  ;; Initialize token
  (as-contract (initialize))

  ;; Check initial balance of contract owner
  (asserts-true (is-eq (get-balance contract-owner) token-total-supply))

  ;; Transfer tokens
  (let ((recipient 'SP2C2X4QK8ZQ3BPDQ0E14G3HXHNEBPGNEEVZVW6GJ))
    (asserts-true (is-ok (transfer recipient u1000)))
    (asserts-true (is-eq (get-balance recipient) u1000))
    (asserts-true (is-eq (get-balance contract-owner) (- token-total-supply u1000)))
  )

  ;; Transfer more tokens than balance (should fail)
  (let ((recipient 'SP2C2X4QK8ZQ3BPDQ0E14G3HXHNEBPGNEEVZVW6GJ))
    (asserts-true (is-err (transfer recipient (+ token-total-supply u1))))
  )
)
