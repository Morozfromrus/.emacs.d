(global-set-key (kbd "M-q") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

;; (defun try-expand-flexible-abbrev (old)
;;   "Try to complete word using flexible matching.

;; Flexible matching works by taking the search string and then
;; interspersing it with a regexp for any character. So, if you try
;; to do a flexible match for `foo' it will match the word
;; `findOtherOtter' but also `fixTheBoringOrange' and
;; `ifthisisboringstopreadingnow'.

;; The argument OLD has to be nil the first call of this function, and t
;; for subsequent calls (for further possible completions of the same
;; string).  It returns t if a new completion is found, nil otherwise."
;;   (if (not old)
;;       (progn
;; 	(he-init-string (he-lisp-symbol-beg) (point))
;; 	(if (not (he-string-member he-search-string he-tried-table))
;; 	    (setq he-tried-table (cons he-search-string he-tried-table)))
;; 	(setq he-expand-list
;; 	      (and (not (equal he-search-string ""))
;; 		   (he-flexible-abbrev-collect he-search-string)))))
;;   (while (and he-expand-list
;; 	      (he-string-member (car he-expand-list) he-tried-table))
;;     (setq he-expand-list (cdr he-expand-list)))
;;   (if (null he-expand-list)
;;       (progn
;; 	(if old (he-reset-string))
;; 	())
;;       (progn
;; 	(he-substitute-string (car he-expand-list))
;; 	(setq he-expand-list (cdr he-expand-list))
;; 	t)))

;; (defun he-flexible-abbrev-collect (str)
;;   "Find and collect all words that flex-matches STR.
;; See docstring for `try-expand-flexible-abbrev' for information
;; about what flexible matching means in this context."
;;   (let ((collection nil)
;;         (regexp (he-flexible-abbrev-create-regexp str)))
;;     (save-excursion
;;       (goto-char (point-min))
;;       (while (search-forward-regexp regexp nil t)
;;         ;; Is there a better or quicker way than using
;;         ;; `thing-at-point' here?
;;         (setq collection (cons (thing-at-point 'word) collection))))
;;     collection))

;; (defun he-flexible-abbrev-create-regexp (str)
;;   "Generate regexp for flexible matching of STR.
;; See docstring for `try-expand-flexible-abbrev' for information
;; about what flexible matching means in this context."
;;   (concat "\\b" (mapconcat (lambda (x) (concat "\\w*" (list x))) str "")
;;           "\\w*" "\\b"))

;; (setq hippie-expand-try-functions-list
;;       (cons 'try-expand-flexible-abbrev hippie-expand-try-functions-list))

;; (defun hippie-unexpand ()
;;   (interactive)
;;   (hippie-expand 0))

;; (define-key read-expression-map [(shift tab)] 'hippie-unexpand)

;; (use-package smart-tab
;;   :ensure t)

;; (global-smart-tab-mode 1)

(provide 'init-hippie-expand)
