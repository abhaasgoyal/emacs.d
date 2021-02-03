;;; package --- Golang support  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'go-mode)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

;;; gopls integration
(add-hook 'go-mode-hook 'lsp-deferred)

(provide 'init-go)
;;; init-go.el ends here
