;; Interactively Do Things

(use-package ido
  :config
  (progn
    (ido-mode)
    (ido-vertical-mode)
    (ido-everywhere)
    (ido-ubiquitous-mode)
    (setq ido-enable-flex-matching t
          ido-use-filename-at-point nil
          ido-auto-merge-work-directories-length 0
          ido-use-virtual-buffers t
	  ido-enable-prefix nil
	  ido-case-fold nil
	  ido-create-new-buffer 'always
	  ido-max-prospects 10
          smex-save-file (concat emacs-persistence-directory ".smex-items")
          ido-default-buffer-method 'selected-window
          ido-save-directory-list-file (concat emacs-persistence-directory ".ido-last"))
    (global-set-key [remap execute-extended-command] 'smex)
    (defadvice ido-find-file (after find-file-sudo activate)
      "Find file as root if necessary."
      (unless (and buffer-file-name
                   (file-writable-p buffer-file-name))
        (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
;;    (defun bind-ido-keys ()
;;      "Keybindings for ido mode."
;;      (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
;;      (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
;;    (add-hook 'ido-setup-hook (lambda () (define-key ido-completion-map [up] 'previous-history-element)))
;;    (add-hook 'ido-setup-hook #'bind-ido-keys))
)
  :ensure imenu-anywhere
  :ensure ido-vertical-mode
  :ensure idomenu
  :ensure ido-completing-read+
  :ensure ido-ubiquitous
  :ensure smex)

;; C-n/p is more intuitive in vertical layout
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

(defun my/ido-go-straight-home ()
  (interactive)
  (cond
   ((looking-back "~/") (insert "projects/"))
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
