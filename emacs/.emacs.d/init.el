;; debugging startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; some private settings
(setq user-full-name "Thomas Ruoff"
      calendar-latitude 48.286993
      calendar-longitude 8.726407
      calendar-location-name "Rosenfeld, Germany")

;; my functions
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file user-init-file))


;; ui
(toggle-frame-maximized)

(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; no backups
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; Splash Screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; Now, go wild!")

;; editor
(setq-default tab-width 4
              tab-always-indent t
              indent-tabs-mode nil
              fill-column 80)

;; Word wrapping
(setq-default word-wrap t
              truncate-lines t
              truncate-partial-width-windows nil)

(setq sentence-end-double-space nil
      delete-trailing-lines nil
      require-final-newline t
      tabify-regexp "^\t* [ \t]+")  ; for :retab

;; package
(require 'package)

;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                         user-emacs-directory)))
  (setq package-user-dir versioned-package-dir))

;; Use Melpa-Stable
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("org" . "http://orgmode.org/elpa/"))

(package-initialize)

;; Install use-package.el if have not
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish)
  (package-install 'bind-key))

;; use-package.el is no longer needed at runtime
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; keybindings
(use-package general
  :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   "/" '(counsel-rg :wich-key "rg")
   "TAB" '(ivy-switch-buffer :which-key "prev buffer")
   "SPC" '(counsel-M-x :which-key "M-x")
   "w" '(hydra-window/body :which-key "Window")

   "g" '(:ignore t :which-key "Git")
   "gg" '(magit :which-key "Magit Status")

   "f" '(:ignore t :which-key "Files")
   "ff" '(counsel-git :which-key "find in git dir")
   "fd" '(find-user-init-file :which-key "open init file")
   ))

;; evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map "jk" 'evil-normal-state))

(use-package evil-magit
  :ensure t)

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; which key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))


;; ivy
(use-package ivy
  :ensure t
  :defer 1
  :init
  (setq ivy-re-builders-alist
        '((counsel-ag . ivy--regex-plus)
          (counsel-rg . ivy--regex-plus)
          (counsel-grep . ivy--regex-plus)
          (swiper . ivy--regex-plus)
          (swiper-isearch . ivy--regex-plus)
          ;; Ignore order for non-fuzzy searches by default
          (t . ivy--regex-ignore-order)))
  :config
  (setq ivy-height 15
        ivy-wrap t
        ivy-fixed-height-minibuffer t
        projectile-completion-system 'ivy
        ;; Don't use ^ as initial input
        ivy-initial-inputs-alist nil
        ;; disable magic slash on non-match
        ivy-magic-slash-non-match-action nil
        ;; don't show recent files in switch-buffer
        ivy-use-virtual-buffers nil
        ;; ...but if that ever changes, show their full path
        ivy-virtual-abbreviate 'full
        ;; don't quit minibuffer on delete-error
        ivy-on-del-error-function nil
        ;; enable ability to select prompt (alternative to `ivy-immediate-done')
        ivy-use-selectable-prompt t)
  (ivy-mode +1))

(use-package ivy-rich
  :after ivy
  :ensure t
  :config
  (ivy-rich-mode +1))

(use-package flx
  :defer t  ; is loaded by ivy
  :init
  (setf (alist-get 't ivy-re-builders-alist) #'ivy--regex-fuzzy)
  (setq ivy-initial-inputs-alist nil
        ivy-flx-limit 10000))

(use-package counsel
  :ensure t)

(use-package counsel-projectile
  :ensure t
  :defer t)

;; Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

;; git
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package forge
  :ensure t)

;; org
(use-package f
  :ensure t)
(use-package org
  :ensure t
  :config
  (setq org-directory "~/org/"))

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-one t))

(use-package all-the-icons)
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
