;;; init-markdown.el --- Markdown support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'markdown-mode)
  (add-auto-mode 'markdown-mode "\\.md\\.html\\'")
  (with-eval-after-load 'whitespace-cleanup-mode
    (add-to-list 'whitespace-cleanup-mode-ignore-modes 'markdown-mode)))

(defun my--markdown-entery-key-ad (this-func &rest args)
  "markdown-modeでskk-henkan-mode中にエンターすると行頭にカーソルが飛んでしまう問題の対応"
  (if skk-henkan-mode (skk-kakutei)
    (apply this-func args)))

(advice-add #'markdown-enter-key :around #'my--markdown-entery-key-ad)

(provide 'init-markdown)

;;; init-markdown.el ends here

