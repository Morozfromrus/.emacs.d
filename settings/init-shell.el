;; (require 'em-tramp)

;; (setq eshell-prefer-lisp-functions t)
;; (setq eshell-prefer-lisp-variables t)

;; (setq password-cache t)
;; (setq password-cache-expiry 3600)

(add-hook 'comint-output-filter-functions
          'comint-truncate-buffer)

(provide 'init-shell)
