(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(setq inhibit-startup-screen t
      use-short-answers t
      ring-bell-function 'ignore
      auto-save-default nil
      make-backup-files nil
      create-lockfiles nil)

(setq-default indent-tabs-mode nil
              show-trailing-whitespace t
              indicate-empty-lines t
              dired-dwim-target t
              fill-column 79)

(fido-mode)
(delete-selection-mode)
(column-number-mode)
(display-time)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(global-set-key (kbd "C-x C-o") 'ff-find-other-file)
(global-set-key (kbd "C-,") (lambda () (interactive) (delete-indentation -1)))
(global-set-key (kbd "C-.") 'duplicate-line)

(add-to-list 'default-frame-alist '(font . "Menlo-15"))

(load-theme 'modus-vivendi)

(use-package magit
  :ensure t)

(use-package wgrep
  :ensure t)

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))

(use-package multiple-cursors
  :ensure t
  :bind
  ("C-<" . 'mc/mark-all-like-this)
  ("C->" . 'mc/mark-next-like-this))

(use-package auctex
  :ensure t
  :hook
  (LaTeX-mode . LaTeX-math-mode)
  :custom
  (preview-scale-function 2.0)
  (TeX-view-program-selection '((output-pdf "open"))))
