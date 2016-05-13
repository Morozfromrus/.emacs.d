(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (setq ac-use-menu-map t)
  ;; Default settings
  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous)
  ; case sensitivity is important when finding matches
  (setq ac-ignore-case nil)
  ;; (setq ac-auto-start nil)
  (setq ac-use-quick-help nil)
  ;; (define-key ac-mode-map (kbd "M-q") 'auto-complete)
  (setq ac-auto-show-menu nil)
  (setq ac-disable-faces nil)
  (define-key ac-completing-map "\t" 'ac-complete)
  (define-key ac-completing-map "\r" nil)
  (add-to-list 'ac-sources 'ac-source-dabbrev)
  :ensure ac-dabbrev)

(provide 'init-auto-complete)
