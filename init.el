;; init.el --- Emacs configuration

;; package related settings
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("org" . "https://orgmode.org/elpa/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t) ;; enable line numbers globally

;; ORG-MODE SETTINGS
;; --------------------------------------
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-log-done t)
(setq org-agenda-files '("~/org/inbox.org"
			 "~/org/gtd.org"
			 "~/org/reminders.org"))
(setq org-capture-templates '(("t" "Todo [inbox]" entry
			       (file+headline "~/org/inbox.org" "Tasks")
			       "* TODO %i%?")
			      ("T" "Reminder" entry
			       (file+headline "~/org/reminders.org" "Reminder")
			       "* %i%? \n %U")))
(setq org-refile-targets '(("~/org/gtd.org" :maxlevel . 3)
                           ("~/org/someday.org" :level . 1)
                           ("~/org/reminders.org" :maxlevel . 2)))
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
			 
;;Change backups directory to common location
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

;;Uncomment below two lines if you want to remove backup file autocreation
;(setq make-backup-files nil) ; stop creating backup~ files
;(setq auto-save-default nil) ; stop creating #autosave# files
;; init.el ends here
