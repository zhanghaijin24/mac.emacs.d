(setq make-backup-files nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x b") 'consult-buffer)

(delete-selection-mode 1)

(toggle-frame-maximized)

(electric-pair-mode t)

(show-paren-mode t)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))

(setq mouse-wheel-progressive-speed nil)

(global-hl-line-mode 1)      

(provide 'init-better-defaults)
