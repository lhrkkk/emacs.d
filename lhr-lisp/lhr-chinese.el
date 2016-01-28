; now test
; #+BEGIN_SRC emacs-lisp


;(popwin-mode 1)
;; Save point position between sessions
;(require 'saveplace)
;(setq-default save-place t)
;(setq save-place-file (expand-file-name ".places" user-emacs-directory))



;; 中文增强
;; 中英文空格
(require-package 'pangu-spacing)
(require 'pangu-spacing)
(global-pangu-spacing-mode 1)
(setq pangu-spacing-real-insert-separtor t)

;; If you only want to insert whitespace in some specific mode, but just add virtual space in other mode, you can use following code to achive this: (take org-mode as example)

;;  (add-hook 'org-mode-hook
;;            '(lambda ()
;;             (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))



;; 有道词典
; (require 'youdao-dictionary)
; (setq url-automatic-caching t)
; (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+)


;; 拼音 isearch
(require 'pinyin-search)

; ;; 拼音输入法
; (require-package 'chinese-pyim)
; (require 'chinese-pyim)
; (setq default-input-method "chinese-pyim")
;;(global-set-key (kbd "C-<SPC>") 'toggle-input-method)



; google 翻译

(require-package 'popup)
(require-package 'names)
(require-package 'chinese-word-at-point)
(require-package 'google-translate)

(require 'popup)
(require 'chinese-word-at-point)
(require 'google-translate)

;;;###autoload
(define-namespace google-translate-chinese-

; (setq google-translate-base-url
;       "http://translate.google.cn/translate_a/t")

; (setq google-translate-listen-url
;       "http://translate.google.cn/translate_tts")

(defun -region-or-word ()
  (if (use-region-p)
      (buffer-substring-no-properties (region-beginning)
                                      (region-end))
    (thing-at-point 'chinese-or-other-word t)))

(defun -bounds-region-or-word ()
  (if (use-region-p)
      (cons (region-beginning) (region-end))
    (bounds-of-thing-at-point 'chinese-or-other-word)))

(defun -translate (word)
  (google-translate-json-translation
   (if (chinese-word-cjk-string-p word)
       (google-translate-request "zh-CN" "en" word)
     (google-translate-request "en" "zh-CN" word))))

(defun -detailed-translate (word)
  (google-translate-json-detailed-translation
   (if (chinese-word-cjk-string-p word)
       (google-translate-request "zh-CN" "en" word)
     (google-translate-request "en" "zh-CN" word))))

(defun concat-array-as-string (v)
  "Concat strings in v to a whole string."
  (let ((index 0) (str ""))
    (while (< index (length v))
      (setq str (concat str (elt v index) ", "))
      (cl-incf index))
    (substring str 0 (- (length str) 2))))

:autoload
(defun at-point ()
  "Translate at point and show full result with buffer."
  (interactive)
  (let ((word (-region-or-word)))
    (if word
        (if (chinese-word-cjk-string-p word)
            (google-translate-translate "zh-CN" "en" word)
          (google-translate-translate "en" "zh-CN" word))
      (message "Nothing to translate"))))

:autoload
(defun at-point-echo-area ()
  "Translate at point and show only translation in echo area. "
  (interactive)
  (let ((word (-region-or-word)))
    (if word
        (message (-translate word))
      (message "Nothing to translate"))))

:autoload
(defun query ()
  "Translate input and show full result with buffer."
  (interactive)
  (let* ((word (-region-or-word))
         (word (read-string (format "Translate (%s): "
                                    (or word ""))
                            nil nil
                            word)))
    (if word
        (if (chinese-word-cjk-string-p word)
            (google-translate-translate "zh-CN" "en" word)
          (google-translate-translate "en" "zh-CN" word))
      (message "Nothing to translate"))))

:autoload
(defun search-at-point-and-replace ()
  "可以不写 DocString."
  (interactive)
  (let ((word (-region-or-word))
        (bounds (-bounds-region-or-word)))
    (if (and word bounds)
        (let (explains
              popup-list
              (detailed-translate (-detailed-translate word))
              selected-item)
          (if (not detailed-translate)
              (progn
                (setq selected-item (popup-menu* (list (popup-make-item (-translate word)))))
                ;; 此处假设了光标在词的后面，而不是其它位置，下同
                (delete-region (car bounds) (cdr bounds))
                (insert selected-item))
            (loop for item across detailed-translate do
                  (let ((index 0))
                    (unless (string-equal (aref item 0) "")
                      (loop for translation across (aref item 1) do
                            (push (format "%d. %s" (incf index) translation) popup-list)
                            (push (concat "<" (substring (aref item 0) 0 1) "> "
                                          (concat-array-as-string (elt (elt (aref item 2) (1- index)) 1)))
                                  popup-list)))))

            (setq popup-list (reverse popup-list))

            (let ((index 0) (a-popup-menu nil))
              (while (< index (length popup-list))
                (push (popup-make-item (nth index popup-list)
                                       :summary (nth (1+ index) popup-list))
                      a-popup-menu)
                (setq index (+ index 2)))
              (setq selected-item (popup-menu* (reverse a-popup-menu)))
              (delete-region (car bounds) (cdr bounds))
              (insert (substring selected-item 3)))))
      (message "Nothing to translate"))))

:autoload
(defun open-word-with-web ()
  "搜索附近的词，用浏览器打开。"
  (interactive)
  (let ((word (-region-or-word))
        from to)
    (if (not word)
        (message "No word found")
      (if (chinese-word-cjk-string-p word)
          (setq from "zh-CN" to "en")
        (setq from "en" to "zh-Cn"))
      ;; URL 格式：比如需要搜索 "example" (en => zh-Cn), URL `https://translate.google.cn/#en/zh-CN/example'
      (browse-url (concat "https://translate.google.cn/#"
                          from "/" to "/"
                          (url-hexify-string word))))))

:autoload
(defun search-and-replace ()
  "Search word at point and replace with selected result."
  (interactive)
  (let ((word (thing-at-point 'word t))
        (bounds (bounds-of-thing-at-point 'word))
        selected)
    (if (not (and word bounds))
        (message "Nothing to translate")
      (setq selected (popup-menu* `("item 1" "item 2" ,word)))
      (delete-region (car bounds) (cdr bounds))
      (insert selected))))
)


(global-set-key (kbd "C-c t") 'google-translate-chinese-search-at-point-and-replace)


; #+END_SRC

; iclcle mode
; #+BEGIN_SRC emacs-lisp :tangle no

; (require-package 'icicles)
; (require 'icicles)
; (icy-mode 1)
; (defun my-find-file ()
;   "Like `icicle-find-file', but alt action views file temporarily.
;     Alternate action keys such as `C-S-down' visit the candidate file in
;     `view-mode' and kill the buffer of the last such viewed candidate."
;   (interactive)
;   (let ((icicle-candidate-alt-action-fn
;          (lambda (file)
;            (when (and my-last-viewed
;                       (get-file-buffer my-last-viewed))
;              (kill-buffer (get-file-buffer my-last-viewed)))
;            (setq my-last-viewed  (abbreviate-file-name file))
;            (view-file file)
;            (select-frame-set-input-focus
;             (window-frame (active-minibuffer-window))))))
;     (icicle-find-file-of-content)))

;     (defvar my-last-viewed nil
;       "Last file viewed by alternate action of `my-find-file'.")

; #+END_SRC


; dired
; #+BEGIN_SRC emacs-lisp


;; little modification to dired-mode that let's you browse through lots of files


; (add-hook 'dired-mode-hook
;           (lambda()
;             (define-key dired-mode-map (kbd "C-o") 'dired-view-current)     ; was dired-display-file
;             (define-key dired-mode-map (kbd "n")   'dired-view-next)           ; was dired-next-line
;             (define-key dired-mode-map (kbd "p")   'dired-view-previous))) ; was dired-previous-line

; (defun dired-view-next ()
;   "Move down one line and view the current file in another window."
;   (interactive)
;   (dired-next-line 1)
;   (dired-view-current))

; (defun dired-view-previous ()
;   "Move up one line and view the current file in another window."
;   (interactive)
;   (dired-previous-line 1)
;   (dired-view-current))

; (defun dired-view-current ()
;   "View the current file in another window (possibly newly created)."
;   (interactive)
;   (if (not (window-parent))
;       (split-window))                                   ; create a new window if necessary
;   (let ((file (dired-get-file-for-visit))
;         (dbuffer (current-buffer)))
;     (other-window 1)                                          ; switch to the other window
;     (unless (equal dbuffer (current-buffer))                 ; don't kill the dired buffer
;       (if (or view-mode (equal major-mode 'dired-mode))   ; only if in view- or dired-mode
;           (kill-buffer)))                                                    ; ... kill it
;     (let ((filebuffer (get-file-buffer file)))
;       (if filebuffer                              ; does a buffer already look at the file
;           (switch-to-buffer filebuffer)                                    ; simply switch
;         (view-file file))                                                    ; ... view it
;       (other-window -1))))                   ; give the attention back to the dired buffer




; #+END_SRC

; #+BEGIN_FSTREE: /Users/lhr/_ev/content/paper

; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/#init-misc.el#][#init-misc.el#]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/V.el][V.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/emacs-buffer.el][emacs-buffer.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/frame-buff-mimic.el][frame-buff-mimic.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/frame-bufs.el][frame-bufs.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-ace-jump-mode.el][init-ace-jump-mode.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-company.el][init-company.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-company.el~][init-company.el~]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-dash.el][init-dash.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-eim.el][init-eim.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-elpa.el][init-elpa.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-elscreen.el][init-elscreen.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-ergoemacs-mode.el][init-ergoemacs-mode.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-evil.el][init-evil.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-helm.el][init-helm.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-leuven-theme.el][init-leuven-theme.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-linum-mode.el][init-linum-mode.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-misc.el][init-misc.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-moe-theme.el][init-moe-theme.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-my-dea.el][init-my-dea.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-neotree.el][init-neotree.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-yasnippet.el][init-yasnippet.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-osx-keys.el][init-osx-keys.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-persp-mode.el][init-persp-mode.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-powerline.el][init-powerline.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-projectile.el][init-projectile.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-revive.el][init-revive.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-sublimity.el][init-sublimity.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-tabbar-ruler.el][init-tabbar-ruler.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-tabbar.el][init-tabbar.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-which-func.el][init-which-func.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-which-func.el~][init-which-func.el~]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-windows.el][init-windows.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-windowsel.el][init-windowsel.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-workgroups2.el][init-workgroups2.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/init-yasnippet.el~][init-yasnippet.el~]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/maxframe-simple.el][maxframe-simple.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-coding-style.el][my-coding-style.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-dea.el][my-dea.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-functions.el][my-functions.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-hippie-expand.el][my-hippie-expand.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-iimage-settings.el][my-iimage-settings.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-minor-key-map.el][my-minor-key-map.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-misc-settings.el][my-misc-settings.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-python-settings.el][my-python-settings.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-small-tools.el][my-small-tools.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/my-ui.el][my-ui.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/org-panel.el][org-panel.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/recent-jump-settings.el][recent-jump-settings.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/recent-jump-small.el][recent-jump-small.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/recent-jump.el][recent-jump.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/revive.el][revive.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/tabbar-settings.el][tabbar-settings.el]]
; *** | | [[file:/Users/lhr/_pr/ed/purcell/mylisp/windows.el][windows.el]]


; #+END_FSTREE


(provide 'lhr-chinese)