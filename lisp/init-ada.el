;;; init-ada.el --- Ada Support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun ada-pretty-print ()
  "Run pretty print on ada mode on Saving."
  (when (equal major-mode 'ada-mode)
    (shell-command (concat "gnatpp " (shell-quote-argument (buffer-file-name)))
                   )))

(when (maybe-require-package 'ada-mode)

  (global-set-key (kbd "C-c q d") 'ada-build-prompt-select-prj-file)

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
    :group 'project-build))


(provide 'init-ada)

;;; init-ada.el ends here
