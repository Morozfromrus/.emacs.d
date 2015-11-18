(defun mcs-run-server()
  (interactive)
  (spawn-shell "*mcs-server*"
	       (concatenate 'string
			    "cd ~/work/new_cs/server/;"
			    "python manage.py runserver localhost:8888")))

(defun mcs-run-crawler()
  (interactive)
  (spawn-shell "*mcs-consumer*"
	       (concatenate 'string
			    "cd ~/work/new_cs/server/;"
			    "celery worker -A tasks -E -l INFO -n consume -Q consume -B"))
  (spawn-shell "*mcs-launcher*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.tasks -E -l INFO -n launch -Q launch"))
  (spawn-shell "*mcs-downloader*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.tasks -E -l INFO -n download -Q download"))
  (spawn-shell "*mcs-parser*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.tasks -E -l INFO -n parse -Q parse"))
  (spawn-shell "*mcs-processor*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.tasks -E -l INFO -n process -Q process"))
  (spawn-shell "*mcs-finisher*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.tasks -E -l INFO -n finish -Q finish"))
  (spawn-shell "*mcs-transfer*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery worker -A crawler.tasks -E -l INFO -n transfer -Q transfer")))

(defun mcs-run-flower()
  (interactive)
  (spawn-shell "*mcs-flower*"
	       (concatenate 'string
			    "cd ~/work/new_cs/crawler/;"
			    "celery flower -A crawler.tasks -E -l INFO --persistent True")))

(defun mcs-run()
  (interactive)
  (mcs-run-server)
  (mcs-run-crawler)
  (mcs-run-flower)
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
