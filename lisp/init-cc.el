;;; init-cc.el --- Support for C and C++ -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(with-eval-after-load  'cc-mode

  (setq gdb-many-windows t)

  (defun single-file-run ()
    "Run single file c++ programs after compiling."
    (interactive)
    (shell-command (file-name-sans-extension buffer-file-name)))

  (defun cpp-template-add ()
    "Add CPP Template."
    (interactive)
    (insert-file-contents "/home/abhaas/Documents/cp/template.cpp"))

  (defun c-single-file-compile ()
    "Compile only the current file"
    (interactive)
    (set (make-local-variable 'compile-command)
         (concat "gcc -O2 -Wall " buffer-file-name " -o "
                 (file-name-base buffer-file-name))))

  (defun cpp-single-file-compile ()
    "Compile only the current file"
    (interactive)
    (set (make-local-variable 'compile-command)
         (concat "g++ -std=c++11 -O2 -Wall " buffer-file-name " -o "
                 (file-name-base buffer-file-name))))

  (defun project-compile ()
    "Compile only the current file"
    (interactive)
    (set (make-local-variable 'compile-command) "make -k "))

  (define-key c-mode-base-map (kbd "<f5>") #'single-file-run)
  (define-key c-mode-base-map (kbd "<f9>") 'project-compile)

  (define-key c-mode-map (kbd "<f8>") 'c-single-file-compile)

  (define-key c++-mode-map (kbd "<f8>") 'cpp-single-file-compile)
  (define-key c++-mode-map (kbd "C-c C-f") 'cpp-template-add))

(provide 'init-cc)
;;; init-cc.el ends here
