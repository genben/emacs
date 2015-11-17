(provide 'init-other)

;;; ==================================================
;; flycheck
;;; ==================================================
(require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq flycheck-flake8-maximum-line-length 320)

;; Highlight whole line with error.
(setq flycheck-highlighting-mode 'lines)

;;; --------------------------------------------------
;; color the mode line according to the error state
;;; --------------------------------------------------
(require-package 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;;; --------------------------------------------------
;; flycheck errors on a tooltip (doesnt work on console)
;;; --------------------------------------------------
; (require-package 'flycheck-tip)

; (when (display-graphic-p (selected-frame))
  ; (eval-after-load 'flycheck
		; '(custom-set-variables
				; '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))


;;; ==================================================
;;; NeoTree
;;; ==================================================
(require-package 'neotree)
(global-set-key [f3] 'neotree-toggle)

;;; ==================================================
;;; Project Explorer
;;; ==================================================
; (require-package 'project-explorer)
; (global-set-key [f3] 'project-explorer-open)
; (global-set-key [f4] 'project-explorer-helm)
; (setq pe/omit-gitignore t)

