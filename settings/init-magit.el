(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-completing-read-function 'magit-ido-completing-read))

(provide 'init-magit)
