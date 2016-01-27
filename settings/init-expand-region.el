(use-package expand-region
  :ensure t
  :commands (er/expand-region er/mark-inside-quotes)
  :bind (("M-r" . er/expand-region)))

(provide 'init-expand-region)
