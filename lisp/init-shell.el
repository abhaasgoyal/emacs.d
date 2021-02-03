;;; package --- summary shell settings
;;; Commentary:
;;; Code:

(add-hook 'comint-output-filter-functions
          'comint-truncate-buffer)

(setq comint-buffer-maximum-size 1024)

(provide 'init-shell)
;;; init-shell.el ends here
