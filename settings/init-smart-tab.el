(use-package smart-tab
  :ensure t
  :config
  (global-smart-tab-mode 1)
  (setq smart-tab-using-hippie-expand t)
  (setq smart-tab-completion-functions-alist ())
  (define-key read-expression-map [(tab)] 'hippie-expand)
  (define-key read-expression-map [(shift tab)] 'hippie-unexpand))

(defun hippie-unexpand ()
  (interactive)
  (hippie-expand 0))

(global-set-key (kbd "<backtab>") 'hippie-unexpand)

(provide 'init-smart-tab)
