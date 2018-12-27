;; initial window settings
(setq initial-frame-alist
      '((width . 92)
        (height . 54)))

;; subsequent window settings
(setq default-frame-alist
      '((menu-bar-lines . 1)
        (tool-bar-lines . 0)
        (width . 92)
        (height . 52)))

;;Setting the cursor to a line for ease
(setq-default cursor-type 'bar) 


;;Add custom themes from the themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'dracula t)

;; start package.el with emacs
(require 'package)

;;add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;;initialize package.el
(package-initialize)

;;start autocomplete with emacs
(require 'auto-complete)

;;do default config for autocomplete
(require 'auto-complete-config)
(ac-config-default)

;;turn on yasnippet by default
(require 'yasnippet)
(yas-global-mode 1)

;;define a function that initializes the c-headers every time a file is open
(defun my:ac-c-header-init()
	(require 'auto-complete-c-headers)
	(add-to-list 'ac-sources 'ac-source-c-headers)
	(add-to-list 'achead:include-directories '"/usr/include/c++/5"
						 '"/usr/include/x86_64-linux-gnu/c++/5" 
						 '"/usr/include/c++/5/backward"
						 '"/usr/lib/gcc/x86_64-linux-gnu/5/include"
						 '"/usr/local/include"	
						 '"/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed"
						 '"/usr/include/x86_64-linux-gnu"
						 '"/usr/include")

)

;;now ca from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
 
;;Turn on minimap by default
(require 'minimap)
(minimap-mode 1)





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-width-fraction 0.06)
 '(minimap-window-location (quote right)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;The rest of the config should go under this line




