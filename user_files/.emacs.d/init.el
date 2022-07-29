;;; package -- Summary
;;; Commentary:
;;; Code:
(emacs-version)
(defconst emacs-start-time (current-time))
(setq inhibit-startup-message t)
;;(global-linum-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem")
  )

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home (expand-file-name "~/miniconda3/"))
 '(package-selected-packages
   '(importmagic pyimport flycheck dracula-theme zenburn-theme conda magit blacken better-defaults use-package aria2))
 '(warning-suppress-types '((comp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'jetbrains-darcula t)

(setq-default indent-tabs-mode nil)
(setq column-number-mode t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'conda)
(conda-env-initialize-interactive-shells)

(define-key python-mode-map (kbd "C-c C-i") #'pyimport-insert-missing)

(add-hook 'python-mode-hook
          (lambda ()
            (anaconda-mode)
            (anaconda-eldoc-mode)
            (blacken-mode)
            (importmagic-mode)
            (setq tab-width 4)
            (setq-default display-fill-column-indicator-column 79)
            (display-fill-column-indicator-mode)
            (add-to-list 'flycheck-disabled-checkers 'python-mypy)
            (add-to-list 'flycheck-disabled-checkers 'python-pylint)
            ))
(provide 'init)
;;; init.el ends here

