;;; init-cc.el --- Support for C and C++ -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun crun ()
  "Run single file c++ programs after compiling."
  (interactive)
  (shell-command (file-name-sans-extension buffer-file-name)))

(defun cpp-template-add ()
  "Add CPP Template."
  (interactive)
  (insert-file-contents "/home/abhaas/Documents/cp/template.cpp")
  )

(add-hook 'c++-mode-hook (lambda () (local-set-key (kbd "<f7>") #'crun)))

(add-hook 'c++-mode-hook
          (lambda () (local-set-key (kbd "C-c C-f") 'cpp-template-add)))

(add-hook 'c++-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (concat "g++ -std=c++11 -O2 -Wall " buffer-file-name " -o "

                         (file-name-base buffer-file-name)))))

(provide 'init-cc)
;;; init-cc.el ends here
