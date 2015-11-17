(use-package python
    :no-require t
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

    (add-hook 'python-mode-hook
              #'(lambda ()
                  (define-key python-mode-map (kbd "C-m") 'newline-and-indent)))

    (when (fboundp 'jedi:setup)
      (add-hook 'python-mode-hook 'jedi:setup))

    (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)))

(provide 'init-python-mode)
