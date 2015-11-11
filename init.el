;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration for emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Settings
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(setq custom-theme-directory
      (expand-file-name "themes" user-emacs-directory))
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(setq desktop-path '("~/.emacs.d/desktop/"))
(setq emacs-persistence-directory (concat user-emacs-directory "persistence/"))
(load custom-file)
(add-to-list 'load-path settings-dir)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Desin changes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'appearance)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Startup settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; start with *scratch* buffer
(setq inhibit-startup-screen t)

;; load saved desktop
(require 'desktop)
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilites
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Packages
(require 'init-package)
;; IDO
(require 'init-ido)
;; Auto-Complete
(require 'init-auto-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Languages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Web
(require 'init-web-mode)
;; PHP
(require 'init-php-mode)

;; THE END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
