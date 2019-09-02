;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Fira Code" :size 16))

;; Place your private configuration here

(eval-after-load 'js-mode
  '(add-hook 'js-mode-hook #'add-node-modules-path))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path))

;; org-mode
(setq org-directory "~/documents/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-clock-persist 'history)
(setq org-log-done 'time)

(org-clock-persistence-insinuate)
