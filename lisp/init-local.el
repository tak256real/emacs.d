;; フレームのタイトル表示指定
(setq frame-title-format
      `("Emacs - %b " (buffer-file-name "( %f )")))

;; フォント
;; 半角英字設定
(set-face-attribute 'default nil :family "Cica" :height 120)

;; ASCII 以外の Unicode.(ASCII はデフォルトで設定する)
(set-fontset-font nil
                  '(#x80 . #x10ffff)
                  (font-spec :family "Cica"))

;; 全角かな設定
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Cica" "iso10646-1"))

(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Cica" "iso10646-1"))

(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "Cica" "iso10646-1"))
;; 半角ｶﾅ設定
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "Cica" "iso10646-1"))

;;;; ずれ確認用
;;;; 0123456789012345678901234567890123456789
;;;; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
;;;; あいうえおあいうえおあいうえおあいうえお

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
  (setq truncate-lines t)                 ; 行は折り返さない.
  (setq truncate-partial-width-windows t) ; バッファ幅が狭かろうと行は折り返さない.
  (setq comment-start "// ")          ; コメントの書き出しを // にする
  (setq comment-end "")               ; コメントの書き終わり
  (hide-ifdef-mode 1)                 ; hide-ifdef-mode をフックする
  (helm-gtags-mode 1)                 ; gtags-mode をフックする
  (auto-revert-mode 1) ; 他のエディタなどがファイルを書き換えたらすぐにそれを反映
  )

;;; C を Google のスタイルに設定する.
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)

(unless window-system
  (require 'locale-eaw-emoji)
  )

(provide 'init-local)
