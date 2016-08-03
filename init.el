;;; init.el --- emacs configuration by Mad
;;; Commentary:
;;; supported by rails-to-cosmos
;;; Code:

(require 'package)

(setq dist-packages-dir (concat user-emacs-directory "dist-packages/")
      package-user-dir (concat dist-packages-dir "elpa/"))

(make-directory dist-packages-dir t)
(make-directory package-user-dir t)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(eval-when-compile
  (require 'use-package))

(use-package use-package
  :init (progn
	  (setq use-package-verbose t)))

(use-package flycheck
  :config (progn
            (add-hook 'after-init-hook 'global-flycheck-mode)
            (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
                  flycheck-idle-change-delay 0.8
                  flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))
  :ensure t)

(use-package my/http
  :init (progn

          ;; https://github.com/emacs-pe/http.el
          (use-package http
            :ensure t)))

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
;; Package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Packages
(require 'init-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Desin changes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'appearance)

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
(setq initial-scratch-message "")

;; Load saved desktop
;; (require 'desktop)
;; (desktop-save-mode 1)

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

;; Smart tab
(require 'init-smart-tab)

;; Hippie-expand
(require 'init-hippie-expand)

;; Yasnippet
(require 'init-yasnippet)

;; Auto-Complete
;; (require 'init-auto-complete)

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
;; (require 'init-python-mode)
;; (require 'init-python-mode-rope)

;; Json
(require 'init-json-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-keys)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-local nil t)

(provide 'init)
;;; init.el ends here
