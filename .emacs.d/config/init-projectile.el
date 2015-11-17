(provide 'init-projectile)

;;; ==================================================
;;; Projectile
;;; ==================================================
(require-package 'projectile)


(setq projectile-cache-file (concat my-cache-directory "projectile.cache"))
(setq projectile-known-projects-file (concat my-cache-directory "projectile-bookmarks.eld"))

(after "helm-autoloads"
  (after 'helm-projectile
    (add-to-list 'helm-projectile-sources-list 'helm-source-projectile-recentf-list)))


(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)

(require 'projectile)

; (add-to-list 'projectile-globally-ignored-directories "elpa")
(add-to-list 'projectile-globally-ignored-directories ".cache")
(add-to-list 'projectile-globally-ignored-directories "node_modules")

(projectile-global-mode t)


