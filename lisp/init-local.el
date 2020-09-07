;;; package --- summary Personal config addons for emacs
;;; Commentary:
;;; Code:


;;; Pretty print go before saving
(require 'init-exec-path) ;; Set up $PATH
(add-to-list 'exec-path "/usr/local/go1.14.6.linux-amd64/bin/")
(add-hook 'before-save-hook 'gofmt-before-save)


(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;;; Ada mode Settings:
(global-set-key (kbd "C-c q d") 'ada-build-prompt-select-prj-file)
(defun ada-pretty-print ()
  "Run pretty print on ada mode on Saving."
  (when (equal major-mode 'ada-mode)
    (shell-command (concat "gnatpp " (shell-quote-argument (buffer-file-name)))
                   )))

(add-hook 'after-save-hook #'ada-pretty-print)

(defgroup project-build nil
  "LSP options for Project"
  :group 'ada-mode)

(defcustom project-build-type "Debug"
  "Controls the type of build of a project.
   Default is Debug, other choices are Release and Coverage."
  :type '(choice
          (const "Debug")
          (const "Coverage")
          (const "Release"))
  :group 'project-build)


;;; Saving TODO entry automatically when all children are done
(defun org-summary-todo ( n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)    ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

;;; Spacemacs modeline integration
(require 'spaceline-config)
(spaceline-emacs-theme)

;;; Org mode extensions
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


;;; Tex Integration
;; (server-start)
;; (setq TeX-view-program-selection '((output-pdf "Okular")))
;; (setq TeX-source-correlate-mode t)

(setq org-latex-pdf-process
      '("latexmk -pdflatex='xelatex' -pdf -bibtex -f %f"))
(require 'org-ref)

(provide 'init-local)
;;; init-local.el ends here
