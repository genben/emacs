(provide 'init-helm)

;;; ==================================================
;;; Helm
;;; ==================================================
(require-package 'helm)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs. Changed to "C-c h". 
;; This variable should be set before loading of helm-config
(setq helm-command-prefix-key "C-c h")

(after 'helm
  ;; take between 10-30% of screen space
  (setq helm-autoresize-min-height 10)
  (setq helm-autoresize-max-height 30)
  (helm-autoresize-mode t)
  (require 'helm-config)    ;; Load helm-config to create global key binding
  (require 'helm-imenu)
  )


;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
; (global-set-key (kbd "C-c h") 'helm-command-prefix)
; (global-unset-key (kbd "C-x c"))

(require-package 'helm-ag)

(require-package 'helm-flx)
(helm-flx-mode t)

(require-package 'helm-fuzzier)
(helm-fuzzier-mode t)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)

(setq helm-bookmark-show-location t)

(global-set-key [remap execute-extended-command] #'helm-M-x)
(global-set-key [remap find-file] #'helm-find-files)

(global-set-key (kbd "C-c C-b") 'helm-buffers-list)

(after "projectile-autoloads"
  (require-package 'helm-projectile))


(helm-mode t)

(global-set-key (kbd "C-c h a") 'helm-do-ag-project-root)

