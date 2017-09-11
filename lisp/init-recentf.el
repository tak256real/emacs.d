(require-package 'recentf-ext)

(add-hook 'after-init-hook (lambda () (recentf-mode 1)))
(setq-default
 recentf-max-saved-items 5120
 recentf-exclude '("/tmp/" "/ssh:"))


(provide 'init-recentf)
