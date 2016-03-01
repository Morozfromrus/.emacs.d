(require 'em-tramp)

(setq eshell-prefer-lisp-functions t)
;; (setq eshell-prefer-lisp-variables t)

(setq password-cache t)
(setq password-cache-expiry 3600)

(setq comint-buffer-maximum-size 200)
(add-hook 'comint-output-filter-functions
          'comint-truncate-buffer)

;; load esh-mode first
(require 'esh-mode)

(setq eshell-buffer-maximum-lines 200)
(add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

(defun eshell-init-aliases()
  (add-to-list 'eshell-command-aliases-list '("ff" "find-file"))
  (add-to-list 'eshell-command-aliases-list '("d" "dired $1"))
  (add-to-list 'eshell-command-aliases-list '("l" "ls"))
  (add-to-list 'eshell-command-aliases-list '("ll" "ls -la"))
  (add-to-list 'eshell-command-aliases-list '("sudo" "eshell/sudo $*")))

(add-hook 'eshell-mode-hook 'eshell-init-aliases)

(provide 'init-shell)
