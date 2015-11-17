(provide 'init-python)

;;; --------------------------------------------------
;; Virtual environments to Python
;;; --------------------------------------------------
;; (require-package 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location '("k:/_Projects/MiaRecPro32/Python"))

;; (setenv "PYTHONPATH" "k:/_Projects/MiaRecPro32/Python")

;; Keep underscores within a word boundary
;; It treats text like “x_y” as one word. Useful for “snake_case”.
(add-hook 'python-mode-hook
        '(lambda () (modify-syntax-entry ?_ "w" python-mode-syntax-table)))
