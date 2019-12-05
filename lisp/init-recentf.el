;;; init-recentf.el --- Settings for tracking recent files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'recentf-ext)

(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 5120
 recentf-exclude '("/tmp/" "/ssh:"))


(provide 'init-recentf)
;;; init-recentf.el ends here
