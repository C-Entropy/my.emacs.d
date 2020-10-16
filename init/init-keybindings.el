;;oepn init dire 
(require 'init-units)

(global-set-key (kbd "C-c SPC") 'rm-space-line)
(global-set-key (kbd "<f1>") 'open-init-dire)

;;org part
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;;code floding
(global-set-key (kbd "C-,") 'hs-hide-block)
(global-set-key (kbd "C-.") 'hs-show-block)
(global-set-key (kbd "C-<") 'hs-hide-all)
(global-set-key (kbd "C->") 'hs-show-all)

;;change yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;specific a buffer for dired
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key (kbd "C-h C-v") 'find-variable)

(global-set-key (kbd "s-/") 'hippie-expand)

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "C-n") 'next-line)
(global-set-key (kbd "C-p") 'previous-line)
;auto-yasnippet

(provide 'init-keybindings)
