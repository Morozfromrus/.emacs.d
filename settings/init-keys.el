;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Useful keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; M-; - Smart comment-region
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Terminal ctr key bind map
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; CTRL+SPACE
;; CTRL+@
;; CTRL+A
;; etc..
;; CTRL+Z
;; CTRL+[
;; CTRL+\
;; CTRL+]
;; CTRL+^
;; CTRL+_
;;

;; delete keys
(global-set-key (kbd "C-d") 'delete-backward-char)
(global-set-key (kbd "M-d") 'backward-kill-word)
(global-set-key (kbd "C-h") 'delete-char)
(global-set-key (kbd "M-h") 'kill-word)

;; help f1
(global-set-key (kbd "<f1>") 'help-command)

;; walk
(global-set-key (kbd "M-e") 'forward-paragraph)
(global-set-key (kbd "M-a") 'backward-paragraph)

(provide 'init-keys)
