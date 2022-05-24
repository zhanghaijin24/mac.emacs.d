(require 'package)
(setq package-archives '(("gnu" . "http://elpa.zilongshanren.com/gnu/")
			 ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "M-p") 'open-init-file)

(global-set-key (kbd "M-1") 'bookmark-jump)

(set-face-attribute 'default nil :height 160)

(require 'recentf)
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-linum-mode 1)

(setq inhibit-startup-screen t)

;;(toggle-frame-maximized)

(setq make-backup-files nil)

(global-auto-revert-mode t)

(setq ring-bell-function 'ignore)


(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'cdlatex)
(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list 'turn-on-cdlatex
	    'reftex-mode
	    'outline-minor-mode
	    'auto-fill-mode
	    'flyspell-mode
	    'hide-body t))

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))  
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))

(defun my/latex-buffer-setup ()
  (TeX-source-correlate-mode)
  (TeX-PDF-mode))
(add-hook 'LaTeX-mode-hook 'my/latex-buffer-setup)
(setq TeX-source-correlate-method 'synctex
      TeX-view-program-list   ;; Use Skim, it's awesome
      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -g -b %n %o %b"))
      TeX-view-program-selection '((output-pdf "Skim"))
      TeX-auto-save t
      TeX-parse-self t
      TeX-save-query nil
      TeX-master 'dwim)

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai 1))

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cdlatex-paired-parens "$[{(<")
 '(package-selected-packages '(monokai-theme use-package auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
