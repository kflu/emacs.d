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

(straight-use-package 'helm)
(straight-use-package 'evil)
(straight-use-package 'better-jumper)

; ----------------------------------------------------------------------
; HELM
; ----------------------------------------------------------------------
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-mode-fuzzy-match 't)

; ----------------------------------------------------------------------
; EVIL
; ----------------------------------------------------------------------
(require 'evil)
(evil-mode 1)

; ----------------------------------------------------------------------
; better-jumper
; ----------------------------------------------------------------------
(require 'better-jumper)
(better-jumper-mode +1)

; Configure the standard jump list navigation keybindings for evil/vim:
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "C-o") 'better-jumper-jump-backward)
  (define-key evil-motion-state-map (kbd "C-i") 'better-jumper-jump-forward))


; ----------------------------------------------------------------------
; MISC
; ----------------------------------------------------------------------
(setq inhibit-startup-screen 't)
(xterm-mouse-mode)
(global-display-line-numbers-mode)
