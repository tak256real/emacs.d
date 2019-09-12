(require-package 'migemo)

;;; migemo コマンドを cmigemo に置き替える
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

;;; migemo 関連のパスを設定
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
;; キャッシュ機能を利用する
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1024)
;; 辞書の文字コードを指定．
;; バイナリを利用するなら，このままで構いません
                                        ;(setq migemo-coding-system 'euc-jp-unix)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
;; 起動時に初期化も行う
(migemo-init)

(provide 'init-migemo)
