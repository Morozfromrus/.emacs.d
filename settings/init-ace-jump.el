(use-package ace-jump-mode
  :ensure t
  :bind ("M-j" . ace-jump-mode))

(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

;; (global-set-key (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(provide 'init-ace-jump)
