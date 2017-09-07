(setq gtags-prefix-key "\C-c")
(when (locate-library "gtags")
  (require 'gtags))
;; キーバインド
(setq gtags-mode-hook
      '(lambda ()
         (setq gtags-select-buffer-single t) ;バッファを1つだけ生成されるようにする.
         (setq gtags-path-style 'relative) ; ファイル名は相対パスで表示する.
         (define-key gtags-mode-map "\C-cs" 'gtags-find-symbol)
         (define-key gtags-mode-map "\C-cr" 'gtags-find-rtag)
         (define-key gtags-mode-map "\C-ct" 'gtags-find-tag)
         (define-key gtags-mode-map "\C-cf" 'gtags-find-file)
         (define-key gtags-mode-map "\C-cp" 'gtags-find-pattern)))


;; 保存時にGTAGSを更新する
(defun update-gtags (&optional prefix)
  (interactive "P")
  (let ((rootdir (gtags-get-rootpath))
        (args (if prefix "-v" "-iv")))
    (when rootdir
      (let* ((default-directory rootdir)
             (buffer (get-buffer-create "*update GTAGS*")))
        (save-excursion
          (set-buffer buffer)
          (erase-buffer)
          (let ((result (process-file "gtags" nil buffer nil args)))
            (if (= 0 result)
                (message "GTAGS successfully updated.")
              (message "update GTAGS error with exit status %d" result))))))))
(add-hook 'after-save-hook 'update-gtags)

;; カレントバッファのメソッド一覧の表示
;;   gtags-parse-file の改良
;;   ファイル名の指定を省けるようにしたもの
(defun gtags-parse-file2 ()
  (interactive)
  (if (gtags-get-rootpath)
      (let*
          ((root (gtags-get-rootpath))
           (path (buffer-file-name))
           (gtags-path-style 'root)
           (gtags-rootdir root))
        (if (string-match (regexp-quote root) path)
            (gtags-goto-tag
             (replace-match "" t nil path)
             "f" nil)
          ;; delegate to gtags-parse-file
          (gtags-parse-file)))
    ;; delegate to gtags-parse-file
    (gtags-parse-file)))

(provide 'init-gtags)
