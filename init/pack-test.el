(require 'package)
(package-initialize)

;;--------when in gdut--------
;; (setq package-archives '(("gnu" . "http://mirrors.gdut.edu.cn/elpa/gnu/")
;; 			 ("melpa" . "http://mirrors.gdut.edu.cn/elpa/melpa/")))

;;--------when out of gdut--------
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

					; prestart
					; in case the gnu keyring is out of date, use gnu-elpa-keyring-update to update it.
(unless (package-installed-p 'gnu-elpa-keyring-update)
  (setq package-check-signature nil); first we need to disable it
  (package-refresh-contents)
  (package-install 'gnu-elpa-keyring-update)
  (gnu-elpa-keyring-update)
  (setq package-check-signature 'allow-unsigned); after update, enable it again.
  )

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package company
  :ensure t
  :init
  ;; :hook 'after-init-hook 'global-company-mode
  :config
  (set-face-attribute 'company-tooltip-selection nil :foreground "#190110")
  (setq company-idle-delay 0.03)
  (setq company-dabbrev-downcase nil)
  (setq company-minimum-prefix-length 2)
  :bind
  ("M-n" . #'company-select-next)
  ("M-p" . #'company-select-previous)
  ("C-n" . nil)
  ("C-p" . nil))

(global-company-mode)
(provide 'pack-test)
list-load-path-shadows
