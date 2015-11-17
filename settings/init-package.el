(require 'package)

;; Add melpa to package repos
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(eval-when-compile
  (require 'use-package))

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(provide 'init-package)
