;;
;; emacs4developer demo - emacs config
;; by Pierre Lecocq
;;
;; See https://github.com/pierre-lecocq/emacs.d for full configuration
;;

(setq debug-on-error t)

;; ----------------
;; Install packages

(when (>= emacs-major-version 24)

  ;; Require the library
  (require 'package)

  ;; Set repositories
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("melpa" . "http://melpa.milkbox.net/packages/")))

  ;; Initialize the package manager
  (package-initialize)

  ;; Install autopair package (to match parentheses, brackets, ...)
  (unless (package-installed-p 'autopair)
    (progn
      (package-refresh-contents)
      (package-install 'autopair)))
  
  (require 'autopair)
  (autopair-global-mode)

  ;; Install darkmine-theme package (a darkish theme)
  (unless (package-installed-p 'darkmine-theme)
    (progn
      (package-refresh-contents)
      (package-install 'darkmine-theme)))

  (load-theme 'darkmine t)

  )

;; ------------------
;; Some basic configs

;; See matching pairs of parentheses
(show-paren-mode t)
;; Fontify the text in the buffer
(global-font-lock-mode t)
;; Selection highlighting
(transient-mark-mode t)
;; Display line number in the modeline
(line-number-mode t)
;; Display column number in the modeline
(column-number-mode t)
;; Layziness is the best invention, ever
(fset 'yes-or-no-p 'y-or-n-p)
