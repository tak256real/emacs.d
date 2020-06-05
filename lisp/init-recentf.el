;;; init-recentf.el --- Settings for tracking recent files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'recentf-ext)


(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 5120
 recentf-exclude `("/tmp/" "/ssh:" ,(concat package-user-dir "/.*-autoloads\\.el\\'")))

; run-with-idle-timer 30 t '(lambda ()          ;; 30秒ごとに .recentf を保存
;                             (with-suppressed-message (recentf-save-list))))


(provide 'init-recentf)
;;; init-recentf.el ends here
