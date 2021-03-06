;; simplifies the interface
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Theme
(use-package danneskjold-theme
  :ensure t)
;; (load-theme 'monokai)

;; (use-package color-theme
;;   :ensure t
;;   :config
;;   (setq color-theme-is-global t)
;;   (color-theme-initialize)
;;   (color-theme-pok-wob))

;; Line numbers
(global-linum-mode 1)

(provide 'appearance)
