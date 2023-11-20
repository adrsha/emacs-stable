(menu-bar-mode -1)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (set-scroll-bar-mode nil))
(setq-default mode-line-format nil)

(setq frame-title-format nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(setq initial-buffer-choice nil)

(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives 
	     '("MELPA" . "http://melpa.org/packages/")
	     '("ELPA" . "http://elpa.gnu.org/packages/")
	     )
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(require 'use-package)
(custom-set-variables '(use-package-always-ensure t))
(custom-set-variables '(use-package-always-defer t))

(use-package evil
  :init
  ;;(setq evil-undo-system 'undo-fu)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-i-jump nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-fine-undo t)
  (setq evil-want-Y-yank-to-eol t)

  ;; ----- Setting cursor colors
  ;;(setq evil-emacs-state-cursor    '("#cba6f7" box))
  ;;(setq evil-normal-state-cursor   '("#BAC2DE" box))
  ;;(setq evil-operator-state-cursor '("#90b6f3" (bar . 6))) 
  ;;(setq evil-visual-state-cursor   '("#6C7096" box))
  ;;(setq evil-insert-state-cursor   '("#b4befe" (bar . 2)))
  ;;(setq evil-replace-state-cursor  '("#eb998b" hbar))
  ;;(setq evil-motion-state-cursor   '("#f38ba8" box))
  )
(evil-mode 1)
;; INITIAL BINDINGS
(evil-global-set-key 'motion "j" 'evil-next-visual-line)
(evil-global-set-key 'motion "k" 'evil-previous-visual-line)
(evil-set-initial-state 'messages-buffer-mode 'normal)
(evil-set-initial-state 'dashboard-mode 'normal)
(evil-define-key 'motion help-mode-map "q" 'kill-this-buffer)

(use-package evil-collection)
(evil-collection-init)

(use-package evil-escape
  :custom
  (evil-escape-key-sequence "jk")
  (evil-escape-delay 0.2))
(evil-escape-mode 1)

(use-package evil-surround)
(global-evil-surround-mode 1)

(use-package evil-textobj-anyblock)

(define-key evil-inner-text-objects-map "u" 'evil-textobj-anyblock-inner-block)
(define-key evil-outer-text-objects-map "u" 'evil-textobj-anyblock-a-block)
