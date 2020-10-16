(require 'package)
(package-initialize)

;;--------when in gdut--------
(setq package-archives '(("gnu" . "http://mirrors.gdut.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.gdut.edu.cn/elpa/melpa/")))

;;--------when out of gdut--------
;; (setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;; 			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

					; prestart
					; in case the gnu keyring is out of date, use gnu-elpa-keyring-update to update it.
;; (unless (package-installed-p 'gnu-elpa-keyring-update)
;;   (setq package-check-signature nil); first we need to disable it
;;   (package-refresh-contents)
;;   (package-install 'gnu-elpa-keyring-update)
;;   (gnu-elpa-keyring-update)
;;   (setq package-check-signature 'allow-unsigned); after update, enable it again.
;;   )

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (use-package emojify
;;   :ensure t
;;   :hook (after-init . global-emojify-mode))

(use-package highlight-parentheses
  :ensure t)

(use-package gnu-elpa-keyring-update
  :ensure t)

;; (setq package-check-signature nil)
;; package-check-signature
					;run into signature error
;; - Fetch the new key manually, e.g. with something like:
;;
;;       gpg --homedir ~/.emacs.d/elpa/gnupg --receive-keys 066DAFCB81E42C40
;;
;; - Modify the expiration date of the old key, e.g. with something like:
;;
;;       gpg --homedir ~/.emacs.d/elpa/gnupg \
;;           --quick-set-expire 474F05837FBDEF9B 1y
;;
;; - temporarily disable signature verification (see variable
;;   `package-check-signature').
					;better macs

(use-package window-numbering ;use M+num to change window
  :ensure t
  :init
  (window-numbering-mode t)
  )

;;better list selection
;;package ivy and counsel is part of ivy
(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (ivy-mode 1)
  )

(use-package counsel
  :ensure t
  :init
  :bind
  (("C-x C-r" . counsel-recentf)
   ("C-c g" . counsel-git)
   ("C-c i" . counsel-imenu)
   ("C-c j" . counsel-git-grep)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-c k" . counsel-ag)
   ("\C-s" . swiper)))

;; make undo easier
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode t)
  (defadvice undo-tree-visualizer-mode (after undo-tree-face activate)
    (buffer-face-mode)))

;; solarized-theme
(use-package solarized-theme
  :ensure t)

					;Schweizer Armeemesser
;;git
(use-package magit
  :ensure t)
					;major mode
;;web-mode & js2-mode
(use-package web-mode
  :ensure t
  :init
  (setq auto-mode-alist
	(append
	 '(("\\.js\\'" . js2-mode))
	 '(("\\.html\\'" . web-mode))
	 '(("\\.phtml\\'" . web-mode))
	 '(("\\.tpl\\.php\\'" . web-mode))
	 '(("\\.[agj]sp\\'" . web-mode))
	 '(("\\.as[cp]x\\'" . web-mode))
	 '(("\\.erb\\'" . web-mode))
	 '(("\\.mustache\\'" . web-mode))
	 '(("\\.djhtml\\'" . web-mode))
	 auto-mode-alist))
  :config
  (defun my-web-mode-indent-setup ()
    (setq web-mode-markup-indent-offset 3) ; web-mode, html tag in html file
    (setq web-mode-css-indent-offset 3)    ; web-mode, css in html file
    (setq web-mode-code-indent-offset 3)   ; web-mode, js code in html file
    )
  :hook web-mode-hook
  )

(use-package yaml-mode
  :ensure t
  :hook yaml-mode
  )

(use-package json-mode
  :ensure t
  :hook json-mode
  )

;; (use-package lua-mode
;;   :ensure t
;;   )

(use-package nginx-mode
  :ensure t
  :init
  )

;; (use-package js2-refactor
;;   :hook js2-mode
;;   :init
;;   (js2r-add-keybindings-with-prefix "C-c C-m")
;;   )

(use-package nyan-mode
  :ensure t
  :init
  (nyan-mode))

(use-package fira-code-mode
  :ensure t
  :hook prog-mode)

(use-package hungry-delete
  :ensure t
  :init
  (global-hungry-delete-mode)
  )

(use-package flycheck
  :ensure t
  :hook js2-mode
  )

(use-package exec-path-from-shell
  :ensure t
  )

(use-package company
  :ensure t
  :init
  :hook (after-init . global-company-mode)
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

(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode)
  :config
  (sp-local-pair '(emacs-lisp-mode lisp-mode slime-repl-mode lisp-interaction-mode) "`" nil :actions nil)
  (sp-local-pair '(emacs-lisp-mode lisp-mode slime-repl-mode lisp-interaction-mode) "'" nil :actions nil)
  )


(use-package popwin
  :ensure t
  :config
  (popwin-mode t)
  )

(use-package posframe
  :ensure t)

(use-package yasnippet
  :ensure t
  :hook
  (prog-mode . yas-minor-mode)
  )

(use-package yasnippet-snippets
  :ensure t
  :after yas)

(use-package common-lisp-snippets
  :ensure t
  :after yas
  :hook lisp-mode-hook)

(use-package helm-ag
  :ensure t
  :bind
  ("C-c s" . helm-do-ag-project-root)
  )

(use-package iedit
  :ensure t
  :bind
  ("C-;" . iedit-mode)
  )

;;while in macos
;; (use-package iedit
;;   :ensure t
;;   :init
;;   (define-key osx-key-mode-map (kbd "C-;") nil)
;;   :bind
;;   ("C-;" . iedit-mode))

(use-package pyim
  :ensure t
  :config
  (setq default-input-method "pyim")
  (setq pyim-page-length 9)
  (setq pyim-page-tooltip 'posframe)
  :bind
  ("C-s-SPC" . toggle-input-method))

(use-package expand-region
  :ensure t
  :bind
  ("C-SPC" . er/expand-region))

;; (use-package cnfonts
;;   :ensure t
;;   :init
;;   (cnfonts-enable))

(use-package session
  :ensure t
  :init
  :hook 'after-init-hook 'session-initialize)


(use-package scratch
  :ensure t)
					; slime for common lisp

(defun horizontalp ()
  (> (window-height) (window-width)))


(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl")
  (setq slime-lisp-implementations
	'((sbcl ("sbcl" "--core" "/home/null/.emacs.d/sbcl.core-for-slime"))))
  :config
  (eval-after-load "slime" '(progn (slime-setup '(slime-fancy
  						  ;; slime-company
						  ))))
  :hook
  (slime-mode . (lambda ()
		  (unless (slime-connected-p)
		    (let ((bak-buffer (current-buffer)))
		      (slime)
		      (delete-other-windows)
		      (split-window-horizontally)
		      (other-window 1)
		      (switch-to-buffer bak-buffer)
		      ))
		  )))

(use-package slime-repl-ansi-color
  :ensure t)

(use-package slime-company
  :ensure t
  :after (slime company)
  :hook
  (lisp-mode
         . (lambda ()
             (set (make-local-variable 'company-backends)
                  '((company-slime company-yasnippet company-semantic)))))
  (slime-editing-mode-hook
         . (lambda ()
             (set (make-local-variable 'company-backends)
                  '((company-slime company-yasnippet company-semantic)))))
  :config
  (setq slime-company-completion 'fuzzy
        slime-company-after-completion 'slime-company-just-one-space))

					; convert .org to github prefred markdown.
(use-package ox-gfm
  :ensure t)

;;latex
;; (use-package auctex
;;   :ensure t)

(provide 'init-packages)
