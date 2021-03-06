;; Auto generated by cnfonts
;; <https://github.com/tumashu/cnfonts>
(set-face-attribute
 'default nil
 :font (font-spec :name "-APPL-Monaco-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 10.0))
(when (display-graphic-p)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-APPL-PingFangx SC-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 12.0))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(solarized-light))
 '(custom-safe-themes
   '("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" default))
 '(highlight-parentheses-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(package-selected-packages
   '(pyim posframe slime-repl-ansi-color yasnippet-snippets yaml-mode window-numbering web-mode use-package undo-tree solarized-theme smartparens slime-company session scratch popwin ox-gfm nyan-mode nginx-mode magit json-mode iedit hungry-delete highlight-parentheses helm-ag gnu-elpa-keyring-update flycheck fira-code-mode expand-region exec-path-from-shell counsel common-lisp-snippets auto-yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path "~/.emacs.d/init")
(require 'init)
(setenv "LANG" "zh_CN.UTF-8")
