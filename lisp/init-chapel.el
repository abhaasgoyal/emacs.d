;;; init-chapel.el --- Chapel support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'company-ctags)
(with-eval-after-load 'company (company-ctags-auto-setup))

(setq chapel-use-ctags t)
(require 'chapel-mode)
(setq chapel-format-on-save t)
(define-key chapel-mode-map (kbd "<f6>")  'chapel-menu)
(define-key chapel-mode-map (kbd "C-c C-f") 'chapel-format-buffer)

(provide 'init-chapel)
;;; init-chapel ends here
