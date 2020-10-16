(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-linum-mode t)
;;while in macos
;; (tabbar-mode -1)

					;parens
(smartparens-global-mode t)
(show-paren-mode t)
(setq inhibit-splash-screen t); turn off the welcome page

(setq-default cursor-type 'bar)

;; (add-hook 'emacs-lisp-mode-hook 'show-paren-mode); Highlight Matching Parenthesis
;; (load-file "/Users/null/Library/Preferences/Aquamacs Emacs/Packages/mine/asup.el")
;; (always-show-unbalanced-paren-mode 1)

;;Highlight Matching Parenthesis when cursor inside matching parenthesis
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;; (my-setup-initial-window-setup)
;; (load-theme 'solarized-light)


;; (add-hook 'emacs-startup-hook '(lambda () (set-frame-parameter nil 'fullscreen 'fullboth)))
;; (add-hook 'window-setup-hook #'my-setup-initial-window-setup)
;; (global-hl-line-mode t);;highlight present line

(provide 'init-ui)
