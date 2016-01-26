(use-package expand-region
  :ensure t
  :commands (er/expand-region er/mark-inside-quotes)
  :bind (("M-r" . er/expand-rexgion)))

(provide 'init-expand-region)
