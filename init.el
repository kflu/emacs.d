(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)


(require 'use-package)


(straight-use-package 'helm)
(use-package helm
             :config
             (global-set-key (kbd "M-x") 'helm-M-x)
             (setq helm-mode-fuzzy-match 't)
             (helm-mode 1))


(straight-use-package 'evil)
(use-package evil 
             :init
             ; Use c-u for scrolling (must before the `require`)
             (setq evil-want-C-u-scroll t)
             :config
             (message "fo")
             (require 'evil)
             (evil-mode 1)
             (setq evil-default-state 'emacs))


(straight-use-package 'better-jumper)
(use-package better-jumper
             :config
             (require 'better-jumper)
             (better-jumper-mode +1)
             ; Configure the standard jump list navigation keybindings for evil/vim:
             (with-eval-after-load 'evil-maps
                                   (define-key evil-motion-state-map (kbd "C-o") 'better-jumper-jump-backward)
                                   (define-key evil-motion-state-map (kbd "C-i") 'better-jumper-jump-forward)))


(straight-use-package 'markdown-mode)
(use-package markdown-mode
             :ensure t
             :commands (markdown-mode gfm-mode)
             :mode (("README\\.md\\'" . gfm-mode)
                    ("\\.md\\'" . markdown-mode)
                    ("\\.markdown\\'" . markdown-mode))
             :init (setq markdown-command "multimarkdown"))


(straight-use-package 'lsp-mode)
(use-package lsp-mode
             :init
             (setq lsp-keymap-prefix "C-c l")
             :config
             (require 'lsp-mode)
             (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))


(straight-use-package 'company)
(use-package company)


(straight-use-package 'lsp-ui)
(use-package lsp-ui)


(straight-use-package 'lsp-pyright)
(use-package lsp-pyright
             :commands lsp
             :ensure t
             :hook (python-mode . (lambda ()
                                    (require 'lsp-pyright)
                                    (lsp))))


; ----------------------------------------------------------------------
; MISC
; ----------------------------------------------------------------------
(setq inhibit-startup-screen 't)
(xterm-mouse-mode)
(global-display-line-numbers-mode 1)

(setq custom-file "~/.config/emacs-custom.el")
(load custom-file)

