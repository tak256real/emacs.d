(require-package 'helm)
(helm-mode 1)

                                        ;(helm-adaptative-mode 1)

(global-set-key [remap execute-extended-command] 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(require-package 'helm-gtags)

(setq helm-gtags-mode-hook
      '(lambda ()
         (define-key helm-gtags-mode-map "\C-cs" 'helm-gtags-find-symbol)
         (define-key helm-gtags-mode-map "\C-cr" 'helm-gtags-find-rtag)
         (define-key helm-gtags-mode-map "\C-ct" 'helm-gtags-find-tag)
         (define-key helm-gtags-mode-map "\C-cf" 'helm-gtags-find-files)
         (define-key helm-gtags-mode-map "\C-cp" 'helm-gtags-find-pattern)))

(provide 'init-helm)
