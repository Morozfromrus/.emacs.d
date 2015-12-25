(use-package python-django
  :ensure t)

(use-package python
  :ensure t
  :init
  (progn
    (setq
     gud-pdb-command-name "ipdb"
     python-shell-interpreter "ipython"
     python-shell-interpreter-args "-i --autoindent"
     python-shell-prompt-regexp "In \\[[0-9]+\\]: "
     python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
     python-shell-completion-setup-code
     "import rlcompleter2
rlcompleter2.setup()
from IPython.core.completerlib import module_completion"
     python-shell-completion-module-string-code
     "';'.join(module_completion('''%s'''))\n"
     python-shell-completion-string-code
     "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
    (when (fboundp 'jedi:setup)
      (add-hook 'python-mode-hook 'jedi:setup))))

(defun python-add-breakpoint ()
  "Add a break point"
  (interactive)
  (insert "import ipdb; ipdb.set_trace()")
  (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))

(define-key python-mode-map (kbd "C-c C-b") 'python-add-breakpoint)

(provide 'init-python-mode)
