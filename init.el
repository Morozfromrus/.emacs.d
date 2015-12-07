;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration for emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Settings
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)

;; Themes
(setq custom-theme-directory
      (expand-file-name "themes" user-emacs-directory))

;; Custom
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Desktop
(setq desktop-dir (concat user-emacs-directory "desktop/"))
(if (not (file-directory-p desktop-dir)) (make-directory desktop-dir))
(setq desktop-path (list desktop-dir))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Packages
(require 'init-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Common
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-perfomance)
(require 'init-common)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Desin changes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'appearance)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Startup settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start with *scratch* buffer
(setq inhibit-startup-screen t)

;; Load saved desktop
(require 'desktop)
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilites
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Packages
(require 'init-package)

;; IDO
(require 'init-ido)

;; Shell
(require 'init-shell)

;; Ace-jump
(require 'init-ace-jump)

;; Helm
;; (require 'init-helm)

;; Undo tree
(require 'init-undo-tree)

;; Hippie-expand
(require 'init-hippie-expand)

;; Auto-Complete
(require 'init-auto-complete)

;; Magit
(require 'init-magit)

;; drag-stuff
(require 'init-drag-stuff)

;; Multiple cursors
(require 'init-multiple-cursors)

;; Expand region
(require 'init-expand-region)

;; Projectle
(require 'init-projectile)

;; Elscreen
(require 'init-elscreen)

;; Request
(require 'init-request)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Languages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Web
(require 'init-web-mode)

;; PHP
(require 'init-php-mode)

;; Python
(require 'init-python-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-keys)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-local nil t)

;; THE END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
