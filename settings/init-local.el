(defun mcs-run-server()
  (interactive)
  (spawn-shell "*mcs-server*"
	       (concatenate 'string
			    "cd ~/work/new_cs/server/;"
			    "python manage.py runserver localhost:8888"))
  (browse-url "http://localhost:8888/sources/source/?q=эхо"))

(defun mcs-run-crawler()
  (interactive)

  (spawn-shell "*mcs-starter*"
	       (concatenate 'string
			    "cd ~/work/new_cs/server/;"
			    "python cs-starter.py"))

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
			    "celery flower -A crawler.crawler_tasks -E -l INFO --persistent True"
			    " --broker_api='http://admin:9206@localhost:15672/api/'"))
  (spawn-shell "*mcs-server-flower*"
	       (concatenate 'string
			    "cd ~/work/new_cs/server/;"
			    "celery flower -A server_tasks -E -l INFO --persistent True --port=5556"
			    " --broker_api='http://admin:9206@localhost:15672/api/'"))
  (browse-url "http://localhost:5555/tasks?limit=100")
  (browse-url "http://localhost:5556/tasks?limit=100"))

(defun mcs-run()
  (interactive)
  (mcs-run-server)
  (mcs-run-crawler)
  (mcs-run-flower)
  (delete-other-windows)
  (split-window-vertically)
  (switch-to-buffer "*mcs-server*")
  (split-window-horizontally)
  (windmove-right)
  (balance-windows)
  (switch-to-buffer "*mcs-starter*")
  (split-window-horizontally)
  (windmove-right)
  (balance-windows)
  (switch-to-buffer "*mcs-saver*")
  (split-window-horizontally)
  (windmove-right)
  (balance-windows)
  (switch-to-buffer "*mcs-controller*")
  (split-window-horizontally)
  (windmove-right)
  (balance-windows)
  (switch-to-buffer "*mcs-downloader*")
  (split-window-horizontally)
  (windmove-right)
  (balance-windows)
  (switch-to-buffer "*mcs-parser*")
  (split-window-horizontally)
  (windmove-right)
  (balance-windows)
  (switch-to-buffer "*mcs-processor*")
  (split-window-horizontally)
  (windmove-right)
  (balance-windows)
  (switch-to-buffer "*mcs-finisher*")
  (windmove-down)
  (switch-to-buffer "*mcs-crawler-flower*")
  (split-window-horizontally)
  (windmove-right)
  (balance-windows)
  (switch-to-buffer "*mcs-server-flower*")
  (balance-windows)
)
  
  ;; (delete-other-windows)
  ;; (new-frame)
  ;; (enlarge-frame 40)
  ;; (enlarge-frame-horizontally 180)
  ;; (split-window-vertically)
  ;; (switch-to-buffer "*mcs-launcher*")
  ;; (split-window-horizontally)
  ;; (windmove-right)
  ;; (balance-windows)
  ;; (switch-to-buffer "*mcs-downloader*")
  ;; (split-window-horizontally)
  ;; (windmove-right)
  ;; (balance-windows)
  ;; (switch-to-buffer "*mcs-parser*")
  ;; (split-window-horizontally)
  ;; (windmove-right)
  ;; (balance-windows)
  ;; (switch-to-buffer "*mcs-finisher*")
  ;; (split-window-horizontally)
  ;; (windmove-right)
  ;; (balance-windows)
  ;; (switch-to-buffer "*mcs-transferer*")
  ;; (windmove-down)
  ;; (switch-to-buffer "*mcs-consumer*")
  ;; (split-window-horizontally)
  ;; (windmove-right)
  ;; (switch-to-buffer "*mcs-processor*")
  ;; (balance-windows)

(provide 'init-local)
