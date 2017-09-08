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


(defun my-c-mode-common-hook ()
  (c-set-style "k&r")
  (c-toggle-hungry-state 1)
  (setq tab-width 4)
  (setq c-basic-offset tab-width)
  (setq indent-tabs-mode nil)          ; インデントはスペースで
                                        ;  (setq indent-tabs-mode t)             ; インデントはtabで
  (c-set-offset 'case-label '+)         ; switch - case文のインデントを変更
                                        ;  (c-set-offset 'case-label '0)         ; switch - case文のインデントを変更
  (setq c-tab-always-indent t)          ; [TAB] キーで、TABコードを入力
  (hide-ifdef-mode 1)                   ; hide-ifdef-mode をフックする
                                        ;  (gtags-mode 1)                        ; gtags-mode をフックする
  (helm-gtags-mode 1)                        ; gtags-mode をフックする
  (define-key c-mode-base-map "\C-m" 'newline-and-indent) ; RET の改行で自動インデント
  (setq comment-start "// ")
  (setq comment-end "")
  (auto-revert-mode)                    ; 他のエディタなどがファイルを書き換えたらすぐにそれを反映
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; *.h ファイルもcpp-modeで

(provide 'init-local)
