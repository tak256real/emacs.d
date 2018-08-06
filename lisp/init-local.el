;; フレームのタイトル表示指定
(setq frame-title-format
      `("Emacs - %b " (buffer-file-name "( %f )")))
;;-----------------------------------------------
;; %b : バッファ名
;; %f : ファイル名
;; %l : 行数(リアルタイムで表示するものではない)
;; 現在はフルパスのファイル名としてある
;;-----------------------------------------------
(maybe-require-package 'google-c-style)

;; (defun my-c-mode-common-hook ()
;;   (c-set-style "k&r")
;;   (c-toggle-hungry-state 1)
;;   (setq tab-width 4)
;;   (setq c-basic-offset tab-width)
;;   (setq indent-tabs-mode nil)           ; インデントはスペースで
;;                                         ;  (setq indent-tabs-mode t)             ; インデントはtabで
;;   (c-set-offset 'case-label '+)    ; switch - case文のインデントを変更
;;                                         ;  (c-set-offset 'case-label '0)         ; switch - case文のインデントを変更
;;   (setq c-tab-always-indent t)         ; [TAB] キーで、TABコードを入力
;;   (hide-ifdef-mode 1)                  ; hide-ifdef-mode をフックする
;;                                         ;  (gtags-mode 1)                        ; gtags-mode をフックする
;;   (helm-gtags-mode 1)                   ; gtags-mode をフックする
;;   (define-key c-mode-base-map "\C-m" 'newline-and-indent) ; RET の改行で自動インデント
;;   (setq comment-start "// ")
;;   (setq comment-end "")
;;   (auto-revert-mode) ; 他のエディタなどがファイルを書き換えたらすぐにそれを反映
;;   )

;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; *.h ファイルもcpp-modeで

(defun my-c-mode-common-hook ()
  (hide-ifdef-mode 1)                  ; hide-ifdef-mode をフックする
  (helm-gtags-mode 1)                   ; gtags-mode をフックする
  (auto-revert-mode 1) ; 他のエディタなどがファイルを書き換えたらすぐにそれを反映
  )

;;; C を Google のスタイルに設定する.
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
(provide 'init-local)
