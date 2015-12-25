(use-package drag-stuff
  :ensure t
  :bind (("C-S-<up>" . drag-stuff-up)
	 ("C-S-<down>" . drag-stuff-down)
	 ("C-S-p" . drag-stuff-up)
	 ("C-S-n" . drag-stuff-down)))

(provide 'init-drag-stuff)
