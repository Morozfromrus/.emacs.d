(use-package multiple-cursors
  :ensure t
  :bind (("M-n" . mc/mark-next-like-this)
	 ("M-p" . mc/mark-previous-like-this)
	 ("C-c m a" . mc/mark-all-like-this)))

(provide 'init-multiple-cursors)
