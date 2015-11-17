; (let ((debug-on-error t)
      ; (gc-cons-threshold (* 1024 1024 1024))
      ; (file-name-handler-alist nil)
		; )


  ; (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  ; (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  ; (unless (display-graphic-p) (menu-bar-mode -1))


;;; --------------------------------------------------
;;; packages
;;; --------------------------------------------------
(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
												 ("org" . "http://orgmode.org/elpa/")
												 ("gnu" . "http://elpa.gnu.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)



;;; --------------------------------------------------
;;; "config" and ".cache" directories
;;; --------------------------------------------------
(setq my-config-directory (concat user-emacs-directory "config/"))
(setq my-cache-directory (concat user-emacs-directory ".cache/"))


;; ---------------------------------------------------------
;; Set location for custom configuration, which was edited via GUI
;; ---------------------------------------------------------
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
	(load custom-file))


;; ---------------------------------------------------------
;; Add ./config directory to load-path
;; ---------------------------------------------------------
(add-to-list 'load-path my-config-directory)


;; ---------------------------------------------------------
;; Load configuration files
;; ---------------------------------------------------------
(require 'init-util)
(require 'init-gui)
(require 'init-evil)
(require 'init-helm)
(require 'init-projectile)
(require 'init-other)
(require 'init-python)

