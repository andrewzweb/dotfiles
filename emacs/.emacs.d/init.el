(setq comp-deferred-compilation nil)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-base-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-navigation-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-org-mode-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-programming-config.org"))
