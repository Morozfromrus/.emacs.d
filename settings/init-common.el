;; select word when isearch
(defun xah-search-current-word ()
  "Call `isearch' on current word or text selection.
“word” here is A to Z, a to z, and hyphen 「-」 and underline 「_」, independent of syntax table.
URL `http://ergoemacs.org/emacs/modernization_isearch.html'
Version 2015-04-09"
  (interactive)
  (let ( ξp1 ξp2 )
    (if (use-region-p)
        (progn
          (setq ξp1 (region-beginning))
          (setq ξp2 (region-end)))
      (save-excursion
        (skip-chars-backward "-_A-Za-z0-9")
        (setq ξp1 (point))
        (right-char)
        (skip-chars-forward "-_A-Za-z0-9")
        (setq ξp2 (point))))
    (setq mark-active nil)
    (when (< ξp1 (point))
      (goto-char ξp1))
    (isearch-mode t)
    (isearch-yank-string (buffer-substring-no-properties ξp1 ξp2))))
(global-set-key (kbd "M-s") 'xah-search-current-word)

(progn
  ;; set arrow keys in isearch. left/right is backward/forward, up/down is history. press Return to exit
;;  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat)
;;  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)
  (define-key isearch-mode-map (kbd "<up>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<down>") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward) ; single key, useful
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward) ; single key, useful
  (define-key isearch-mode-map (kbd "<tab>") 'isearch-exit))

;; y and p
(fset 'yes-or-no-p 'y-or-n-p)

;; spawn shell
(defun spawn-shell (name &rest commands)
  "Invoke shell with commands"
  (interactive "MName of shell buffer to create: ")
  (pop-to-buffer (get-buffer-create name))
  (setq default-eshell-buffer-name (if (string= (boundp 'eshell-buffer-name) nil)
                                       "*eshell*"
                                     eshell-buffer-name))
  (setq eshell-buffer-name name)
  (eshell)
  (setq eshell-buffer-name default-eshell-buffer-name)
  (loop for command in commands
        do (insert (concat command "\n")))
  (eshell-send-input)
  (goto-char (point-max)))

;; move line up
;; (defun move-line-up ()
;;   (interactive)
;;   (transpose-lines 1)
;;   (previous-line 2))
;; (global-set-key (kbd "C-S-<up>") 'move-line-up)

;; move line down
;; (defun move-line-down ()
;;   (interactive)
;;   (next-line 1)
;;   (transpose-lines 1)
;;   (previous-line 1))
;; (global-set-key (kbd "C-S-<down>") 'move-line-down)

;; sudo edit
(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(global-set-key (kbd "C-x C-r") 'sudo-edit)

(provide 'init-common)
