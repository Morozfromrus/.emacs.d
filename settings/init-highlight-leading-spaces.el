(use-package highlight-leading-spaces
  :ensure t
  :defer t
  :init (add-hook 'prog-mode-hook 'highlight-leading-spaces-mode))

(provide 'init-highlight-leading-spaces)
