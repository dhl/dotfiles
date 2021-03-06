;; PACKAGE MANAGEMENT

(require 'package)
(add-to-list 'package-archives 
    '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
;; (add-to-list 'package-archives
;;    '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(company
                      projectile
                      clojure-mode
                      cider
                      smartparens
                      magit
                      idle-highlight-mode
                      rainbow-delimiters
                      rainbow-mode
                      smex
                      less-css-mode
                      js2-mode
                      markdown-mode
                      rspec-mode
		      php-mode
		      exec-path-from-shell
		      solarized-theme
		      scss-mode
		      jsx-mode
		      org))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; ACTIVATIONS

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)

(defalias 'yes-or-no-p 'y-or-n-p)

(column-number-mode t)

; activating paredit when in clojure mode
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

; Activate js2-mode for .js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Activate DejaVU Sans Mono if available
(when (member "DejaVu Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono"))

;; RUBY
(require 'rspec-mode)

;; THEMES
(load-theme 'solarized-dark t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; clojure-mode
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; SCSS-MODE
(setq scss-compile-at-save nil)

;; Stop that crazy indent-tabs-mode
(setq-default indent-tabs-mode nil)

;; web-mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-indent-style 2)

(setq make-backup-files nil)


;; CL lib for php-mode
(require 'cl)
