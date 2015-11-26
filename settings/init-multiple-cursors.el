(use-package multiple-cursors
  :ensure t
  :bind (("M-]" . mc/mark-next-like-this)
	 ("M-[" . mc/mark-previous-like-this)
	 ("C-c m a" . mc/mark-all-like-this)))

(provide 'init-multiple-cursors)
