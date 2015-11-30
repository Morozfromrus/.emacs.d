(use-package multiple-cursors
  :ensure t
  :bind (("M-c" . mc/mark-next-like-this)
	 ("C-c M-c" . mc/mark-all-like-this)))

(provide 'init-multiple-cursors)
