;;
;; emacs4developer demo - emacs config
;; by Pierre Lecocq 
;;
;; See https://github.com/pierre-lecocq/emacs.d for full configuration
;;

;; Init :: set package sources

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Init :: install use-package

(unless (package-installed-p 'use-package)
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))

(require 'use-package)

;; Init :: general config

(show-paren-mode t)
(global-font-lock-mode t)
(transient-mark-mode t)
(line-number-mode t)
(column-number-mode t)
(global-auto-revert-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(setq
 make-backup-files nil
 backup-inhibited t
 auto-save-default nil
 kill-whole-line t)

(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; Package :: autopair

(use-package autopair
	     :ensure autopair
	     :init (progn
		     (autopair-global-mode t)))


;; Package :: darkmin-theme

(use-package darkmine-theme
	     :ensure darkmine-theme
	     :init (progn
		     (load-theme 'darkmine t)))

;; Package :: ido

(use-package ido
	     :init (progn
		     (require 'ido)
		     (ido-mode t)
		     (setq ido-enable-flex-matching t)
		     (add-hook 'ido-setup-hook (lambda () (define-key ido-completion-map [tab] 'ido-complete)))))

(use-package ido-hacks
	     :ensure ido-hacks
	     :init (progn
		     (ido-hacks-mode)))

(use-package ido-vertical-mode
	     :ensure ido-vertical-mode
	     :init (progn
		     (ido-vertical-mode)))

;; Package :: ruby-mode

(use-package ruby-mode
	     :ensure ruby-mode)

;; Keybindings

(global-set-key [delete] 'delete-char)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-u") 'uncomment-region)

(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)
