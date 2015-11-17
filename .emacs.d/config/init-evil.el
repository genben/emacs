(provide 'init-evil)

;;; ==================================================
;;; Evil
;;; ==================================================
(defvar my-evil-state-modes
  '(
	; fundamental-mode
    conf-mode
    text-mode
    prog-mode
    ; sws-mode
    ; yaml-mode
    vimrc-mode
	; dired-mode
    web-mode
    log-edit-mode)
  "List of modes that should start up in Evil state."
)


; (setq evil-search-module 'evil-search)
; (setq evil-magic 'very-magic)

;; -----------------------------------------------
;; Change color of cursor depending on Evil mode
;; -----------------------------------------------
(defvar my-emacs-cursor "gray" "The color of the cursor when in Emacs state.")
(setq evil-emacs-state-cursor `(,my-emacs-cursor box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; VIM-like word search (*). By default Emacs ends words at _ and -.
;; If we try to press star (*) on "some_variable", then only "some" will be searched
(setq evil-symbol-word-search t)

;; C-u srolls the buffer up. If nil (the defalt), then C-u begins a numeric prefix argument
(setq evil-want-C-u-scroll t)

(require-package 'evil)
(require 'evil)    ; this line is required. For some reason show-paren-function below is not recognized without this line


;;; ---------------------------------------------------
;;; Compatibility of Evil with Emacs
;;; Emacs show-paren-mode will highlight parentheses when cursor is before opening bracket or AFTER closing bracket
;;; In VIM in normal mode the expected behavior is "cursor before opening bracket or BEFORE closing bracket)
;;; ---------------------------------------------------
(after 'paren
  (ad-enable-advice #'show-paren-function 'around 'evil)
  (ad-activate #'show-paren-function))


; (unless (display-graphic-p)
  ; (evil-esc-mode))


;; ------------------------------
;; Nerd commenter
;; ------------------------------
(require-package 'evil-nerd-commenter)

;; ------------------------------
;; <leader> key
;; ------------------------------
(require-package 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "b" 'switch-to-buffer
)



; (require-package 'evil-commentary)
; (evil-commentary-mode t)


; (require-package 'evil-surround)
; (global-evil-surround-mode t)


; (require-package 'evil-exchange)
; (evil-exchange-install)


; (require-package 'evil-anzu)
; (require 'evil-anzu)


; (setq evil-jumper-auto-center t)
; (require-package 'evil-jumper)
; (evil-jumper-mode t)


; (require-package 'evil-matchit)
; (defun evilmi-customize-keybinding ()
  ; (evil-define-key 'normal evil-matchit-mode-map
    ; "%" 'evilmi-jump-items))
; (global-evil-matchit-mode t)


; (require-package 'evil-indent-textobject)
; (require 'evil-indent-textobject)


; (require-package 'evil-visualstar)
; (global-evil-visualstar-mode t)


;; Vim-like increment and decrement
; (require-package 'evil-numbers)


(defun my-major-mode-evil-state-adjust ()
  (if (apply 'derived-mode-p my-evil-state-modes)
      (turn-on-evil-mode)
    (set-cursor-color my-emacs-cursor)
    (turn-off-evil-mode)))
(add-hook 'after-change-major-mode-hook #'my-major-mode-evil-state-adjust)


; (defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  ; (recenter))

; (defadvice evil-ex-search-previous (after advice-for-evil-ex-search-previous activate)
  ; (recenter))

; (after 'edebug
  ; (add-hook 'edebug-mode-hook (lambda ()
                                ; (if edebug-mode
                                    ; (evil-emacs-state)
                                  ; (evil-normal-state)))))



;; Function to toggle Evil mode manually via <F12>
; (defvar evil-enabled-state nil)
; (defun toggle-evil-mode ()
  ; "Toggle evil mode"
  ; (interactive)
  ; (setq evil-enabled-state (not evil-enabled-state))
  ; (if evil-enabled-state
      ; (progn
        ; (message "Enabling Evil mode..")
        ; (evil-mode t))
    ; (message "Disabling Evil mode...")
    ; (dolist (buffer (buffer-list))
      ; (with-current-buffer buffer (evil-local-mode -1)))
    ; (evil-mode -1)))
; (global-set-key (kbd "<f12>") 'toggle-evil-mode)

; (setq evil-emacs-state-cursor '("gray" box))
; (setq evil-normal-state-cursor '("green" box))
; (setq evil-visual-state-cursor '("orange" box))
; (setq evil-insert-state-cursor '("red" bar))
; (setq evil-replace-state-cursor '("red" bar))
; (setq evil-operator-state-cursor '("red" hollow))

;; -----------------------------------------------
;; Persistent incremental search highlight
;; SRC: http://stackoverflow.com/questions/25768036/emacs-evil-non-incremental-search-and-persistent-highlighting
;; This will highlight all searches done with isearch or Evil search. The highlight will remain until you make another one or call highlight-remove-all. I've mapped it to leader SPC with:
;;   (evil-leader/set-key "SPC" 'highlight-remove-all)
;; PS: I made a package, it's already on melpa with the name "evil-search-highlight-persist" and: https://github.com/juanjux/evil-search-highlight-persist
;; -----------------------------------------------
(defun highlight-remove-all ()
  (interactive)
  (hi-lock-mode -1)
  (hi-lock-mode 1))

(defun search-highlight-persist ()
  (highlight-regexp (car-safe (if isearch-regexp
                                  regexp-search-ring
                                search-ring)) (facep 'hi-yellow)))

(defadvice isearch-exit (after isearch-hl-persist activate)
  (highlight-remove-all)
  (search-highlight-persist))

(defadvice evil-search-incrementally (after evil-search-hl-persist activate)
  (highlight-remove-all)
  (search-highlight-persist))


(evil-leader/set-key "ch" 'highlight-remove-all)
