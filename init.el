;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration for emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Settings
(setq settings-dir (concat user-emacs-directory "settings/"))
(if (not (file-directory-p settings-dir)) (make-directory settings-dir))
(add-to-list 'load-path settings-dir)

(require 'init-paths)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Desin changes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'appearance)

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

;; Highlight leading spaces
;; (require 'init-highlight-leading-spaces)

;; IDO
(require 'init-ido)

;; Shell
(require 'init-shell)

;; Ace-jump
(require 'init-ace-jump)

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
