;; packages
(require 'packages)
(push  '("marmalade" . "http://marmalade-repo.org/packages/")
	   package-archives)
(push  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
	   package-archives)
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))
