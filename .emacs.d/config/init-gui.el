(provide 'init-gui)


;;; --------------------------------------------------
;;; Various settings
;;; --------------------------------------------------
(setq inhibit-splash-screen t)       ;; Don't show initial Emacs-logo and info
(recentf-mode)                       ;; Add menu-item "File->Open recent"
(blink-cursor-mode nil)              ;; Disable cursor blinking
(setq make-backup-files nil)         ;; Disable the creation of backup file such as #file#
(global-hl-line-mode t)             ;; Highlight Current Line (globally)
(global-linum-mode t)                       ;; Display line numbers
(global-auto-revert-mode t)         ;; Automatically reload buffer if file is changed on disk

;;; ---------------------------------------------------
;;; Show matching parenthesis
;;; ---------------------------------------------------
; You can change the default background color for highlighting the paren. Call customize-face, then type “show-paren-match”. Change settings, click the button “Apply and Save” at the top.
(show-paren-mode 1)




;;; ---------------------------------------------
;;; Smooth scrolling like in VIM
;;; ---------------------------------------------
(setq scroll-margin 5
			scroll-conservatively 9999
			scroll-step 1)


;;; ==================================================
;;; Solarized theme
;;; ==================================================
(require-package 'solarized-theme)
;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

(load-theme 'solarized-dark t)

; (require-package 'zenburn-theme)
; (load-theme 'zenburn t)


;;; ==================================================
;;; Powerline
;;; ==================================================
; (require-package 'powerline)
; (powerline-default-theme)



;; -----------------------------------
;; Default colors for mode-line-inactive are not distinguishable from background color
;; Especially this is annoying then we have vertial split of windows
;; and top window is not active. In this case the window boundaries are not visible at all
;; TODO: maybe adjust colors to be more solarized-like
;; -----------------------------------
(set-face-background 'mode-line-inactive "#606060")
(set-face-foreground 'mode-line-inactive "#202020")
