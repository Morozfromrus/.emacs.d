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
(define-key key-translation-map (kbd "M-n") (kbd "<C-down>"))
(define-key key-translation-map (kbd "M-p") (kbd "<C-up>"))

;; delete
(define-key key-translation-map (kbd "C-h") (kbd "DEL"))
(define-key key-translation-map (kbd "M-h") (kbd "<C-backspace>"))

(provide 'init-keys)
