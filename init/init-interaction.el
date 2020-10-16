(require 'init-units)

(setq-default abbrev-mode t)

;; (abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;my name
					    ("9dgbl" "独孤步六 <1041559871@qq.com>")
					    ("9ie" "I-Entropy <1041559871@qq.com>")
					    ;;
					    ("9pgsql" "PostgreSQL")
					    ("9fbsd" "FreeBSD")
					    ("9or" "OpenResty")
					    ))

					;disable backup
(setq backup-inhibited t)
					;disable auto save
(setq auto-save-default nil)
;;auto reload files changed out macs
(global-auto-revert-mode 1)

(recentf-mode t)
;; (add-to-list 'recentf-exclude "/Users/null/Library/Preferences/Aquamacs Emacs/Packages/*" )

(delete-selection-mode t)

(add-hook 'prog-mode-hook 'hs-minor-mode)

;;remove useless whitespace before save file
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key (kbd "M-s o") 'occur-dwim)

(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq imenu-create-index-function 'js2-imenu-make-index)))



;;dired
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)
(require 'dired-x)
(setq dired-dwin-target 1)
;;hippie
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))


(provide 'init-interaction)
