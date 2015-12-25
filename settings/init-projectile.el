(setq persistence-dir (concat user-emacs-directory "persistence/"))
(if (not (file-directory-p persistence-dir)) (make-directory persistence-dir))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-cache-file (concat persistence-dir "projectile.cache"))
  (setq projectile-require-project-root nil))

(provide 'init-projectile)
