(require 'org)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/gitc/org/agenda/gtd.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/gitc/org/agenda/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))

;;use xelatex
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

(provide 'init-org)

