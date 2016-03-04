(require 'em-tramp)

;; shell
(setq comint-buffer-maximum-size 200)
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

;; eshell
(setq eshell-prefer-lisp-functions t)

(setq password-cache t)
(setq password-cache-expiry 3600)

;; load esh-mode first
(require 'esh-mode)
(setq eshell-buffer-maximum-lines 200)
(add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

(defun eshell-init-aliases()
  (add-to-list 'eshell-command-aliases-list '("ff" "find-file"))
  (add-to-list 'eshell-command-aliases-list '("d" "dired $1"))
  (add-to-list 'eshell-command-aliases-list '("l" "ls"))
  (add-to-list 'eshell-command-aliases-list '("ll" "ls -la"))
  (add-to-list 'eshell-command-aliases-list '("sudo" "eshell/sudo $*")))

(add-hook 'eshell-mode-hook 'eshell-init-aliases)

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

;; ansi-term

;; Allow shell mode to handle color output from shell commands
;; (notably from ls --color command)
;;
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;
;; `term/shell' is similar to `shell' based on `ansi-term' code.
;;
(defun term/shell (program &optional new-buffer-name)
  "Start a terminal-emulator in a new buffer.
With a prefix argument, it prompts the user for the shell
executable.
If there is already existing buffer with the same name, switch to
that buffer, otherwise it creates new buffer.
Like `shell', it loads `~/.emacs_SHELLNAME' if exists, or
`~/.emacs.d/init_SHELLNAME.sh'.
The shell file name (sans directories) is used to make a symbol
name such as `explicit-bash-args'.  If that symbol is a variable,
its value is used as a list of arguments when invoking the
shell."
  (interactive (let ((default-prog (or explicit-shell-file-name
                                       (getenv "ESHELL")
                                       shell-file-name
                                       (getenv "SHELL")
                                       "/bin/sh")))
                 (list (if (or (null default-prog)
                               current-prefix-arg)
                           (read-from-minibuffer "Run program: " default-prog)
                         default-prog))))

  (require 'term)
  ;; Pick the name of the new buffer.
  (setq term-ansi-buffer-name
        (if new-buffer-name
            new-buffer-name
          (if term-ansi-buffer-base-name
              (if (eq term-ansi-buffer-base-name t)
                  (file-name-nondirectory program)
                term-ansi-buffer-base-name)
            "shell/term")))

  (setq term-ansi-buffer-name (concat "*" term-ansi-buffer-name "*"))

  ;; In order to have more than one term active at a time
  ;; I'd like to have the term names have the *term-ansi-term<?>* form,
  ;; for now they have the *term-ansi-term*<?> form but we'll see...
  (when current-prefix-arg
    (setq term-ansi-buffer-name
          (generate-new-buffer-name term-ansi-buffer-name)))

  (let* ((name (file-name-nondirectory program))
         (startfile (concat "~/.emacs_" name))
         (xargs-name (intern-soft (concat "explicit-" name "-args"))))
    (unless (file-exists-p startfile)
      (setq startfile (concat user-emacs-directory "init_" name ".sh")))

    (setq term-ansi-buffer-name
          (apply 'term-ansi-make-term term-ansi-buffer-name program
                 (if (file-exists-p startfile) startfile)
                 (if (and xargs-name (boundp xargs-name))
                     ;; `term' does need readline support.
                     (remove "--noediting" (symbol-value xargs-name))
                   '("-i")))))

  (set-buffer term-ansi-buffer-name)
  (term-mode)
  (term-char-mode)

  ;; I wanna have find-file on C-x C-f -mm
  ;; your mileage may definitely vary, maybe it's better to put this in your
  ;; .emacs ...

  (term-set-escape-char ?\C-x)

  (switch-to-buffer term-ansi-buffer-name))

(provide 'init-shell)
