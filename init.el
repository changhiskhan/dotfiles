;;; package -- Summary
;;; Commentary:
;;; Code:
(emacs-version)
(defconst emacs-start-time (current-time))
(setq inhibit-startup-message t)
(global-linum-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/downloads"))
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
 '(conda-anaconda-home (expand-file-name "~/miniconda3") t)
 '(package-selected-packages
   '(conda magit blacken pyimpsort importmagic pyimport better-defaults material-theme solarized-theme use-package aria2))
 '(warning-suppress-types '((comp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(if window-system
    (load-theme 'solarized-dark t)
    ;;(load-theme 'material t)
  )

(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq column-number-mode t)
(setq-default fill-column 80)
(setq-default global-display-fill-column-indicator-column t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)


(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (require 'flycheck-mypy)
  )

(require 'conda)
(conda-env-initialize-interactive-shells)

(add-hook 'python-mode-hook
          (lambda ()
            (anaconda-mode)
            (flycheck-mode)
            (anaconda-eldoc-mode)
            (importmagic-mode)
            (blacken-mode)
            (add-hook 'before-save-hook #'pyimpsort-buffer)
            (setq tab-width 4)
            '(python-guess-indent nil)
            '(python-indent 4)
            (add-to-list 'flycheck-disabled-checkers 'python-flake8)
            (add-to-list 'flycheck-disabled-checkers 'python-pylint)
            ))

(provide 'init)
;;; init.el ends here
