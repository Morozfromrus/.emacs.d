(defun mcs-run-server()
  (interactive)
  (spawn-shell "*mcs-server*"
	       (concatenate 'string
			    "cd ~/work/new_repos/server/;"
			    "python manage.py runserver 0.0.0.0:8080")))

(defun mcs-run-crawler()
  (interactive)

  (spawn-shell "*mcs-starter*"
	       (concatenate 'string
			    "cd ~/work/new_repos/server/;"
			    "python manage.py starter"))

  (spawn-shell "*mcs-schedule*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "python -m crawler.scheduler"))

  (spawn-shell "*mcs-messenger*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n messenger -Q messenger --concurrency=1 -Ofair"))

  (spawn-shell "*mcs-virtual_bro*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n virtual_bro -Q virtual_bro --concurrency=20 -Ofair"))

  (spawn-shell "*mcs-status-changer*"
	       (concatenate 'string
			    "cd ~/work/new_repos/server/;"
			    "celery worker -A server_tasks -E -l INFO -n change_status -Q change_status --concurrency=1 -Ofair"))

  (spawn-shell "*mcs-process-crawler-result*"
	       (concatenate 'string
			    "cd ~/work/new_repos/server/;"
			    "celery worker -A server_tasks -E -l INFO -n process_crawler_result -Q process_crawler_result --concurrency=1 -Ofair"))

  (spawn-shell "*mcs-controller*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.server_tasks -E -l INFO -n controller -Q controller --concurrency=1 -Ofair"))

  (spawn-shell "*mcs-controller-plugin*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.server_tasks -E -l INFO -n controller_plugin -Q controller_plugin --concurrency=1 -Ofair"))

  (spawn-shell "*mcs-controller-comments*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.server_tasks -E -l INFO -n controller_comments -Q controller_comments --concurrency=1 -Ofair"))
  
  (spawn-shell "*mcs-controller-extra*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.server_tasks -E -l INFO -n controller_extra -Q controller_extra --concurrency=1 -Ofair"))  

  (spawn-shell "*mcs-downloader*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n download -Q download --concurrency=1 -Ofair"))

  (spawn-shell "*mcs-parser*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n parse -Q parse --concurrency=1 -Ofair"))

  (spawn-shell "*mcs-processor*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n process -Q process --concurrency=10 -Ofair"))

  (spawn-shell "*mcs-mad*"
	       (concatenate 'string
			    "cd ~/work/new_repos/server/;"
			    "python manage.py mad"))
  
  (spawn-shell "*mcs-finisher*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery worker -A crawler.crawler_tasks -E -l INFO -n finish -Q finish --concurrency=1 -Ofair")))

(defun mcs-run-flower()
  (interactive)
  (spawn-shell "*mcs-crawler-flower*"
	       (concatenate 'string
			    "cd ~/work/new_repos/crawler/;"
			    "celery flower -A crawler.crawler_tasks -E -l INFO --persistent True --port=5001"
			    " --broker_api='http://admin:9206@localhost:15672/api/'"))
  (spawn-shell "*mcs-server-flower*"
	       (concatenate 'string
			    "cd ~/work/new_repos/server/;"
			    "celery flower -A server_tasks -E -l INFO --persistent True --port=5002"
			    " --broker_api='http://admin:9206@localhost:15672/api/'")))

(defun mcs-run()
  (interactive)
  (elscreen-create)
  (mcs-run-server)
  (mcs-run-crawler)
  (mcs-run-flower)
  (mcs-window-render)
  )

(defun mcs-window-render()
  (interactive)
  (delete-other-windows)

  (split-window-vertically)

  (switch-to-buffer "*mcs-schedule*")
  (balance-windows)
  
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-process-crawler-result*")
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

  (split-window-vertically)
  
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

  (windmove-down)

  (switch-to-buffer "*mcs-mad*")
  (balance-windows)
      
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-starter*")
  (balance-windows)
  
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-server*")
  (balance-windows)
  
  (split-window-horizontally)
  (windmove-right)
  (switch-to-buffer "*mcs-virtual_bro*")
  (balance-windows)
  
  )

(defun mcs-stop()
  (interactive)
  (elscreen-find-and-goto-by-buffer "*mcs-controller*")
  (kill-matching-buffers-not-ask "*mcs-")
  (elscreen-kill))

(defun mcs-clear()
  (interactive)
  ;; (delete-other-windows)
  ;; (split-window-horizontally)
  ;; (windmove-right)
  ;; (switch-to-buffer "*command-log*")
  ;; (balance-windows)
  (mcs-soft-clear)
  (call-process-shell-command "psql sources -c \"truncate sources_job cascade;\"" nil "*command-log*"))

(defun mcs-soft-clear()
  (interactive)
  (call-process-shell-command "rm -rf /home/mad/work/new_repos/crawler/log/*" nil "*command-log*")
  (call-process-shell-command "redis-cli \"flushall\"" nil "*command-log*")
  (call-process-shell-command "for vhost in `rabbitmqadmin --user=admin --password=9206 -f bash list vhosts`; do for queue in `rabbitmqadmin --user=admin --password=9206 --vhost=$vhost -f bash list queues`; do echo $queue `rabbitmqadmin --user=admin --password=9206 --vhost=$vhost delete queue name=$queue`; done; done" nil "*command-log*"))

(defun mcs-update()
  (interactive)
  (mcs-stop)
  (mcs-soft-clear)
  (mcs-run))

(defun mcs-restart()
  (interactive)
  (mcs-stop)
  (mcs-run))

(defun stop-supervisor()
  (interactive)
  (call-process-shell-command "sudo service supervisor stop" nil "*command-log*"))

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
