;; PACKAGE MANAGEMENT

(require 'package)
(add-to-list 'package-archives 
    '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider
                      paredit
                      magit
                      idle-highlight-mode
                      rainbow-delimiters
                      rainbow-mode
                      pastels-on-dark-theme
                      smex
                      less-css-mode
                      js2-mode
                      markdown-mode
                      rspec-mode))

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

; Activate js2-mode for .js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Activate DejaVU Sans Mono if available
(when (member "DejaVu Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono"))


(require 'rspec-mode)
