;; UI
(scroll-bar-mode 1)
(tool-bar-mode   -1)
(tooltip-mode    1)
(menu-bar-mode   1)

(add-to-list 'default-frame-alist '(font . "Fira Code-13"))

;; package config
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; packages
(use-package magit
  :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t
  helm-mode-fuzzy-match t
  helm-buffers-fuzzy-matching t
  helm-recentf-fuzzy-match t
  helm-locate-fuzzy-match t
  helm-semantic-fuzzy-match t
  helm-imenu-fuzzy-match t
  helm-completion-in-region-fuzzy-match t
  helm-candidate-number-list 150
  ;helm-split-window-in-side-p t
  helm-move-to-line-cycle-in-source t
  helm-echo-input-in-header-line t
  helm-autoresize-max-height 0
  helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

(use-package projectile
  :ensure t
  ;:pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  :config
  (evil-escape-mode 1))

(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "d" 'kill-buffer)
  (global-evil-leader-mode))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-magit
  :ensure t)

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package org
  :ensure t
  :defer  t
  :diminish org-indent-mode
  :config
  (let ((main-org-file "~/.emacs.d/todo/todo.org"))
    (setq org-agenda-files (list main-org-file))
    (setq org-default-notes-file main-org-file)
    (setq org-capture-templates
	  '(("i" "Idea" entry (file+headline main-org-file "Half-Baked Ideas")
	     "* TODO %?")
	    ("j" "Jira" entry (file+headline main-org-file "Jiras")
	     "* TODO %^{prompt}%? :%\\1:\n  %c")
	    ("l" "Listing" entry (file+headline main-org-file "Listings")
	     "* TODO opt%^{prompt}%? :opp%\\1:\n  %c")
	    ("t" "Todo" entry (file+headline main-org-file "Tasks")
	     "* TODO %?"))))

  (add-hook 'org-mode-hook
	    (lambda()
	      (org-indent-mode t)))

  ;; syntax highlighting for code blocks
  (setq org-src-fontify-natively t)

  (setq org-use-fast-todo-selection t))

(use-package org-bullets
  :ensure t
  :commands (org-bullets-mode)
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package evil-org
  :ensure t
  :after org
  :hook ((org-mode . evil-org-mode)
         (evil-org-mode . evil-org-set-key-theme))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))


;; replace emacs M-x with helm-M-x
(global-set-key (kbd "M-x") 'helm-M-x)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
