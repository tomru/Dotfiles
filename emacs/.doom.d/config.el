;;; .dotfiles/emacs/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-font (font-spec :family "Fira Code" :size 18))
(color-theme-sanityinc-tomorrow-eighties)

(setq user-full-name "Thomas Ruoff")
(setq user-mail-address "thomasruoff@gmail.com")

(eval-after-load 'js-mode
  '(add-hook 'js-mode-hook #'add-node-modules-path))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path))

(setq projectile-project-search-path '("~/projects"))

;; org-mode
(after! org
  (setq org-directory "~/org/")
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-clock-persist 'history)
  (setq org-log-done 'time)
  (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)")))
  (setq org-capture-templates '(("t" "Personal todo" entry
                                      (file+headline +org-capture-todo-file "Inbox")
                                      "* [ ] %?\n%i\n%a" :prepend t)
                                     ("n" "Personal notes" entry
                                         (file+headline +org-capture-notes-file "Inbox")
                                         "* %u %?\n%i\n%a" :prepend t)
                                     ("j" "Journal" entry
                                         (file+olp+datetree +org-capture-journal-file)
                                         "* %U %?\n%i\n%a" :prepend t)
                                     ("p" "Templates for projects")
                                     ("pt" "Project-local todo" entry
                                         (file+headline +org-capture-project-todo-file "Inbox")
                                         "* TODO %?\n%i\n%a" :prepend t)
                                     ("pn" "Project-local notes" entry
                                         (file+headline +org-capture-project-notes-file "Inbox")
                                         "* %U %?\n%i\n%a" :prepend t)
                                     ("pc" "Project-local changelog" entry
                                         (file+headline +org-capture-project-changelog-file "Unreleased")
                                         "* %U %?\n%i\n%a" :prepend t))))


