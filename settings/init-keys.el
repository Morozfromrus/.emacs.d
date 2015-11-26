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

;; help f1
(global-set-key (kbd "<f1>") 'help-command)

;; walk
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(provide 'init-keys)
