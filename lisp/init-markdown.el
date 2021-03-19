;;; init-markdown.el --- Markdown support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'markdown-mode)
  (add-auto-mode 'markdown-mode "\\.md\\.html\\'")
  (with-eval-after-load 'whitespace-cleanup-mode
    (add-to-list 'whitespace-cleanup-mode-ignore-modes 'markdown-mode))
  (when (maybe-require-package 'grip-mode)
    (with-eval-after-load 'markdown-mode
      (define-key markdown-mode-command-map (kbd "g") #'grip-mode))))


(provide 'init-markdown)
;;; init-markdown.el ends here
