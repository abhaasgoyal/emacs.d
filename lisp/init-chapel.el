;;; init-chapel.el --- Chapel support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'chapel-mode)
(maybe-require-package 'company-ctags)

(with-eval-after-load 'company (company-ctags-auto-setup))

(require 'chapel-mode)
(setq chapel-use-ctags t)

(setq chapel-format-on-save t)
(define-key chapel-mode-map (kbd "<f6>")  'chapel-menu)
(define-key chapel-mode-map (kbd "C-c C-f") 'chapel-format-buffer)

(provide 'init-chapel)
;;; init-chapel ends here
