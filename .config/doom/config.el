;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(add-hook 'window-setup-hook #'toggle-frame-maximized)

(setq doom-theme 'doom-dracula
      display-line-numbers-type 'relative
      doom-font (font-spec :family "Fira Code" :size 18 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 24)
      doom-big-font (font-spec :family "Fira Code" :size 36)
      doom-modeline-buffer-file-name-style 'buffer-name
      doom-modeline-window-width-limit fill-column
      doom-modeline-major-mode-icon t
      doom-modeline-enable-word-count t)

;; Scheme
(global-prettify-symbols-mode 1)
(global-font-lock-mode 1)
(setq show-paren-delay 0 show-paren-style 'parenthesis) (show-paren-mode 1)
(setq scheme-program-name "chicken-csi")

;; Org-mode
(setq org-directory "~/Documents/Org/")
(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "●")
    org-superstar-remove-leading-stars t)

;; Company
(setq! company-idle-delay 0)
(after! python
  (set-company-backend! 'python-mode-hook 'company-jedi)) ;; Python jedi completion

;; Format Autopep8
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
