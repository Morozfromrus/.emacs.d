;; Persistence
(setq persistence-dir (concat user-emacs-directory "persistence/"))
(if (not (file-directory-p persistence-dir)) (make-directory persistence-dir))

;; Desktop
(setq desktop-dir (concat persistence-dir "desktop/"))
(if (not (file-directory-p desktop-dir)) (make-directory desktop-dir))

;; Auto-save-list
(setq auto-save-list-dir (concat persistence-dir "auto-save-list/"))
(if (not (file-directory-p auto-save-list-dir)) (make-directory auto-save-list-dir))

;; Themes
(setq custom-theme-directory (concat user-emacs-directory "themes/"))
(if (not (file-directory-p custom-theme-directory)) (make-directory custom-theme-directory))

;; paths
(setq custom-file (concat user-emacs-directory "custom.el")
      smex-save-file (concat persistence-dir ".smex-items")
      ido-save-directory-list-file (concat persistence-dir ".ido-last")
      projectile-cache-file (concat persistence-dir "projectile.cache")
      ac-comphist-file (concat persistence-dir "ac-comphist.dat")
      projectile-known-projects-file (concat persistence-dir "projectile-bookmarks.eld")
      recentf-save-file (concat persistence-dir "recentf")
      auto-save-list-file-prefix (concat auto-save-list-dir ".saves-")
      auto-save-list-file-name (concat auto-save-list-dir ".saves-2752-mad~")
      desktop-path (list desktop-dir))

(load custom-file)

(provide 'init-paths)
