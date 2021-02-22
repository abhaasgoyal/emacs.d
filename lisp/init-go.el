;;; package --- Golang support  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'go-mode)
  (setq gofmt-command "goimports")

  ;; gopls integration
  (with-eval-after-load 'lsp
    (add-hook 'go-mode-hook 'lsp-deferred))

  (add-hook 'before-save-hook 'gofmt-before-save))

(provide 'init-go)
;;; init-go.el ends here
