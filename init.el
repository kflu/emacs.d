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


(use-package helm
             :straight t
             :config
             (global-set-key (kbd "M-x") 'helm-M-x)
             (setq helm-mode-fuzzy-match 't)
             (helm-mode 1))


(use-package evil
             :straight t
             :init
             ; Use c-u for scrolling (must before the `require`)
             (setq evil-want-C-u-scroll t)
             :config
             (require 'evil)
             (evil-mode 1)
             (setq evil-default-state 'emacs))


(use-package better-jumper
             :straight t
             :config
             (require 'better-jumper)
             (better-jumper-mode +1)
             ; Configure the standard jump list navigation keybindings for evil/vim:
             (with-eval-after-load 'evil-maps
                                   (define-key evil-motion-state-map (kbd "C-o") 'better-jumper-jump-backward)
                                   (define-key evil-motion-state-map (kbd "C-i") 'better-jumper-jump-forward)))


(use-package markdown-mode
             :straight t
             :ensure t
             :commands (markdown-mode gfm-mode)
             :mode (("README\\.md\\'" . gfm-mode)
                    ("\\.md\\'" . markdown-mode)
                    ("\\.markdown\\'" . markdown-mode))
             :init (setq markdown-command "multimarkdown"))


(use-package lsp-mode
             :straight t
             :init
             (setq lsp-keymap-prefix "C-c l")
             :config
             (require 'lsp-mode)
             (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))


(use-package company
             :straight t)


(use-package lsp-ui
             :straight t)


(use-package lsp-pyright
             :straight t
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

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

