;; Interactively Do Things

(use-package ido
  :config
  (progn
    (ido-mode)
    (ido-vertical-mode)
    (ido-everywhere)
    (ido-ubiquitous-mode)
    (flx-ido-mode)
    (setq ido-enable-flex-matching t
	  confirm-nonexistent-file-or-buffer nil
	  ido-confirm-unique-completion t
          ido-use-filename-at-point nil
          ido-auto-merge-work-directories-length -1
          ido-use-virtual-buffers t
	  ido-enable-prefix nil
	  ido-case-fold nil
	  ido-create-new-buffer 'always
	  ido-max-prospects 10
          ido-default-buffer-method 'selected-window
	  ido-enable-flex-matching t
	  ido-use-faces nil)
    (global-set-key [remap execute-extended-command] 'smex))
  :ensure imenu-anywhere
  :ensure ido-vertical-mode
  :ensure idomenu
  :ensure ido-completing-read+
  :ensure ido-ubiquitous
  :ensure flx-ido
  :ensure smex)

(global-set-key (kbd "M-.") 'imenu-anywhere)
(global-set-key (kbd "M-,") 'imenu)

;; C-n/p is more intuitive in vertical layout
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

(defun ido-clear-buffers ()
  (interactive)
  (setq ido-virtual-buffers '())
  (setq recentf-list '()))

(defun my/ido-go-straight-home ()
  (interactive)
  (cond
   ((looking-back "/") (insert "~/"))
   (:else (call-interactively 'self-insert-command))))

(defun my/setup-ido ()
  ;; Go straight home
  (define-key ido-file-completion-map (kbd "~") 'my/ido-go-straight-home)
  (define-key ido-file-completion-map (kbd "C-~") 'my/ido-go-straight-home)

  ;; Use C-w to go back up a dir to better match normal usage of C-w
  ;; - insert current file name with C-x C-w instead.
  (define-key ido-file-completion-map (kbd "C-w") 'ido-delete-backward-updir)
  (define-key ido-file-completion-map (kbd "C-x C-w") 'ido-copy-current-file-name)

 (define-key ido-file-dir-completion-map (kbd "C-w") 'ido-delete-backward-updir)
  (define-key ido-file-dir-completion-map (kbd "C-x C-w") 'ido-copy-current-file-name))

(add-hook 'ido-setup-hook 'my/setup-ido)

;; Always rescan buffer for imenu
(set-default 'imenu-auto-rescan t)

(provide 'init-ido)
