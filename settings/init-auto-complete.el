(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  ; case sensitivity is important when finding matches
  (setq ac-ignore-case nil))

(provide 'init-auto-complete)
