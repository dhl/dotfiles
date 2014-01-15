;; PACKAGES

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(better-defaults
                      clojure-mode
                      clojure-test-mode
                      paredit
                      magit
                      find-file-in-project
                      idle-highlight-mode
                      rainbow-delimiters
                      rainbow-mode
                      pastels-on-dark-theme
                      smex
                      less-css-mode
                      js2-mode
                      markdown-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; ACTIVATIONS

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)

(defalias 'yes-or-no-p 'y-or-n-p)

(column-number-mode t)

(load-theme 'pastels-on-dark t)

; activating paredit when in clojure mode
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;Activate js2-mode for .js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
