(use-package yasnippet
  :ensure t
  :config
  (setq yas/root-directory "~/.emacs.d/snippets")
  (if (not (file-directory-p yas/root-directory)) (make-directory yas/root-directory))
  (yas/load-directory yas/root-directory)
  (yas-global-mode 1))

(provide 'init-yasnippet)
