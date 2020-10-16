(defun rm-space-line ()
  "Remove all space line from current line."
  (interactive)
  (flush-lines "^$"))

(defun open-init-dire ()
  "Open init directory."
  (interactive)
  (dired "~/.emacs.d/init"))

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

;; (defun my-setup-initial-window-setup ()
;;   "Make setup window suit screen"
;;   (interactive)
;;   (split-window-horizontally)
;;   (other-window 1)
;;   (split-window-horizontally)
;;   (close-window)
;;   ;; (other-window 1)
;;   (split-window-horizontally)
;;   (other-window 1)
;;   ;; (recentf-open-files)
;;   )

;; (defun horizontallyp ()
;;   (< (window-height) (window-width)))

;; (defun horizontalp ()
;;   (< (window-height) (window-width)))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(provide 'init-units)
