(defun mcs-run-server()
  (interactive)
  (spawn-shell "*mcs-server*"
	       (concatenate 'string
			    "cd ~/work/new_cs/server/;"
			    "python manage.py runserver localhost:8888")))

(defun mcs-run-crawler()
  (interactive)

  (spawn-shell "*mcs-starter*"
	       (concatenate 'string
			    "cd ~/work/new_cs/server/;"
			    "python cs-starter.py"))

  (spawn-shell "*mcs-schedule*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n schedule -Q schedule"))

  (spawn-shell "*mcs-messenger*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n messenger -Q messenger"))
  
  (spawn-shell "*mcs-saver*"
	       (concatenate 'string
			    "cd ~/work/new_cs/server/;"
			    "celery worker -A server_tasks -E -l INFO -n save -Q save"))

  (spawn-shell "*mcs-controller*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.server_tasks -E -l INFO -n controller -Q controller"))

  (spawn-shell "*mcs-downloader*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n download -Q download"))

  (spawn-shell "*mcs-parser*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n parse -Q parse"))

  (spawn-shell "*mcs-processor*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n process -Q process"))

  (spawn-shell "*mcs-finisher*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n finish -Q finish")))

(defun mcs-run-flower()
  (interactive)
  (spawn-shell "*mcs-crawler-flower*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery flower -A crawler.crawler_tasks -E -l INFO --persistent True --port=5001"
			    " --broker_api='http://admin:9206@localhost:15672/api/'"))
  (spawn-shell "*mcs-server-flower*"
	       (concatenate 'string
			    "cd ~/work/new_cs/server/;"
			    "celery flower -A server_tasks -E -l INFO --persistent True --port=5002"
			    " --broker_api='http://admin:9206@localhost:15672/api/'")))

(defun mcs-run()
  (interactive)
  (elscreen-create)
  (mcs-run-server)
  (mcs-run-crawler)
  (mcs-run-flower)
  (delete-other-windows)
  (split-window-vertically)
  (switch-to-buffer "*mcs-server*")
  (balance-windows)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-starter*")
  (balance-windows)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-schedule*")
  (balance-windows)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-saver*")
  (balance-windows)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-controller*")
  (balance-windows)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-downloader*")
  (balance-windows)
  (windmove-down)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-parser*")
  (balance-windows)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-processor*")
  (balance-windows)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-messenger*")
  (balance-windows)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-finisher*")
  (balance-windows)
  (switch-to-buffer "*mcs-crawler-flower*")
  (balance-windows)
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-server-flower*")
  (balance-windows))

(defun mcs-stop()
  (interactive)
  (elscreen-find-and-goto-by-buffer "*mcs-server*")
  (kill-matching-buffers-not-ask "*mcs-")
  (elscreen-kill))

;; (request
;;  "http://ya.ru/"
;;  :parser 'buffer-string
;;  :success
;;  (function* (lambda (&key data &allow-other-keys)
;;               (when data
;;                 (with-current-buffer (get-buffer-create "*request demo*")
;;                   (erase-buffer)
;;                   (insert data)
;;                   (pop-to-buffer (current-buffer)))))))

(provide 'init-local)
