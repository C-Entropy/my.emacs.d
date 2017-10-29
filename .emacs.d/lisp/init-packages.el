;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)


(defvar MorosithII/packages '(
			      ;; --- Auto-completion ---
			      company
			      auto-complete
			      ;; --- Better Editor ---
			      smooth-scrolling
			      hungry-delete
			      swiper
			      exec-path-from-shell
			      counsel
			      smartparens
			      popwin
			      nodejs-repl
			      popwin
			      ;; --- Major Mode ---
			      js2-mode
			      markdown-mode
			      ;;theme
			      solarized-theme
			      nyan-mode
			      ;;common lisp
			      slime
			      )"Default packages")

(setq package-selected-packages MorosithII/packages)

(defun MorosithII/packages-installed-p ()
  (loop for pkg in MorosithII/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (MorosithII/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg MorosithII/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)
(ac-config-default)


(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)



;; Setup load-path, autoloads and your lisp system
;; Not needed if you install SLIME via MELPA
;;(add-to-list 'load-path "~/gitc/slime")
;;(require 'slime-autoloads)
(setq inferior-lisp-program "/usr/local/bin/sbcl")
;;(setq slime-lisp-implementations
  ;;    '((sbcl ("sbcl" "--core" "sbcl.core-for-slime"))))



(provide 'init-packages)

;;nyan-mode
(nyan-mode t);;启动nyan-mode
