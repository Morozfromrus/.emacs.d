(use-package undo-tree
  :ensure t
  :bind (("C-x u" . undo-tree-visualize)
	 ("C-/" . undo-tree-undo)
	 ("M-/" . undo-tree-redo)))

(provide 'init-undo-tree)
