(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(setq tls-checktrust t)
(setq gnutls-verify-error t)

(mapc
 (lambda (package)
   (if (not (package-installed-p package))
       (progn
         (package-refresh-contents)
         (package-install package))))
 '(use-package diminish bind-key))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
(setq use-package-always-ensure t)

(use-package flx)
(use-package helm-flx)
(use-package helm
  :demand
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("C-x r l" . helm-bookmarks)
         ("C-c s" . helm-occur)
         :map helm-find-files-map ;; I like these from Ido
         ("C-<tab>"         . helm-execute-persistent-action)
         ("C-<backspace>" . helm-find-files-up-one-level))
  :config
  (helm-mode 1)
  (helm-flx-mode +1)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-locate-fuzzy-match t)
  (setq helm-lisp-fuzzy-completion t)
  (setq helm-bookmark-show-location t)
  (setq helm-buffer-max-length 30))
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(setq tls-checktrust t)
(setq gnutls-verify-error t)

(mapc
 (lambda (package)
   (if (not (package-installed-p package))
       (progn
         (package-refresh-contents)
         (package-install package))))
 '(use-package diminish bind-key))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
(setq use-package-always-ensure t)

(use-package flx)
(use-package helm-flx)
(use-package helm
  :demand
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("C-x r l" . helm-bookmarks)
         ("C-c s" . helm-occur)
         :map helm-find-files-map ;; I like these from Ido
         ("C-<tab>"         . helm-execute-persistent-action)
         ("C-<backspace>" . helm-find-files-up-one-level))
  :config
  (helm-mode 1)
  (helm-flx-mode +1)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-locate-fuzzy-match t)
  (setq helm-lisp-fuzzy-completion t)
  (setq helm-bookmark-show-location t)
  (setq helm-buffer-max-length 30))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package forge)

(setq user-full-name "Thomas Ruoff"
      calendar-latitude 48.286993
      calendar-longitude 8.726407
      calendar-location-name "Rosenfeld, Germany")


(use-package f)
(use-package org)
(setq org-directory "~/org/")
(setq org-agenda-files '("~/org"))

(use-package org-bullets
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

; fullscreen
(toggle-frame-maximized)


(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
