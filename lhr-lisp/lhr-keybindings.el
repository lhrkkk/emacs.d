; * apply keybindings
; 一共只有 C, M 两个 keys, s 只用在 ui 界面里面.
; 好的开始吧

; 变红是怎么回事, 没看清, 好像和 undo 有关系, 另外变黄(按 option+鼠标选)的是什么. 这个在 purcell 基础包里面就有.

; *** 移动光标, 移动内容 C, M , arrow                                             :keymap:

; C-c, ; 是标题状态切换到 comment  (org-toggle-comment)

; | C-hjkl,uo | 移动光标, 删除     |                        |
; | C-M-hjkl  | 单词移动, 删除     |                        |
; | M-hjkl    | 移动内容           |                        |
; | M-S-hjkl  | 移动子树           |                        |
; | C-k       | 删除行             |                        |
; | C-a,e     | 行首尾, 要重新定义 |                        |
; #+begin_src emacs-lisp




; ** key tranlate                                                                 :keymap:
; #+begin_src emacs-lisp


; 交换, od, yv, jn, kp, hb, lf
(defun lhr/keyboard-translate ()
    (interactive)
  (keyboard-translate ?\C-o ?\C-d)
  (define-key key-translation-map (kbd "M-o") (kbd "M-d"))
  (define-key key-translation-map (kbd "C-M-o") (kbd "C-M-d"))
  (define-key key-translation-map (kbd "C-S-o") (kbd "C-S-d"))
  (define-key key-translation-map (kbd "M-S-o") (kbd "M-S-d"))
  (define-key key-translation-map (kbd "C-M-S-o") (kbd "C-M-S-d"))

  (keyboard-translate ?\C-d ?\C-o)
  (define-key key-translation-map (kbd "M-d") (kbd "M-o"))
  (define-key key-translation-map (kbd "C-S-d") (kbd "C-S-o"))
  (define-key key-translation-map (kbd "C-M-d") (kbd "C-M-o"))
  (define-key key-translation-map (kbd "M-S-d") (kbd "M-S-o"))
  (define-key key-translation-map (kbd "C-M-S-d") (kbd "C-M-S-o"))

  (keyboard-translate ?\C-y ?\C-v)
  (define-key key-translation-map (kbd "M-y") (kbd "M-v"))
  (define-key key-translation-map (kbd "C-S-y") (kbd "C-S-v"))
  (define-key key-translation-map (kbd "C-M-y") (kbd "C-M-v"))
  (define-key key-translation-map (kbd "M-S-y") (kbd "M-S-v"))
  (define-key key-translation-map (kbd "C-M-S-y") (kbd "C-M-S-v"))

  (keyboard-translate ?\C-v ?\C-y)
  (define-key key-translation-map (kbd "M-v") (kbd "M-y"))
  (define-key key-translation-map (kbd "C-S-v") (kbd "C-S-y"))
  (define-key key-translation-map (kbd "C-M-v") (kbd "C-M-y"))
  (define-key key-translation-map (kbd "M-S-v") (kbd "M-S-y"))
  (define-key key-translation-map (kbd "C-M-S-v") (kbd "C-M-S-y"))



  (keyboard-translate ?\C-j ?\C-n)
  (define-key key-translation-map (kbd "M-j") (kbd "M-n"))
  (define-key key-translation-map (kbd "C-S-j") (kbd "C-S-n"))
  (define-key key-translation-map (kbd "C-M-j") (kbd "C-M-n"))
  (define-key key-translation-map (kbd "M-S-j") (kbd "M-S-n"))
  (define-key key-translation-map (kbd "C-M-S-j") (kbd "C-M-S-n"))


  (keyboard-translate ?\C-k ?\C-p)
  (define-key key-translation-map (kbd "M-k") (kbd "M-p"))
  (define-key key-translation-map (kbd "C-S-k") (kbd "C-S-p"))
  (define-key key-translation-map (kbd "C-M-k") (kbd "C-M-p"))
  (define-key key-translation-map (kbd "M-S-k") (kbd "M-S-p"))
  (define-key key-translation-map (kbd "C-M-S-k") (kbd "C-M-S-p"))

  (keyboard-translate ?\C-h ?\C-b)
  (define-key key-translation-map (kbd "M-h") (kbd "M-b"))
  (define-key key-translation-map (kbd "C-S-h") (kbd "C-S-b"))
  (define-key key-translation-map (kbd "C-M-h") (kbd "C-M-b"))
  (define-key key-translation-map (kbd "M-S-h") (kbd "M-S-b"))
  (define-key key-translation-map (kbd "C-M-S-h") (kbd "C-M-S-b"))

  (keyboard-translate ?\C-l ?\C-f)
  (define-key key-translation-map (kbd "M-l") (kbd "M-f"))
  (define-key key-translation-map (kbd "C-S-l") (kbd "C-S-f"))
  (define-key key-translation-map (kbd "C-M-l") (kbd "C-M-f"))
  (define-key key-translation-map (kbd "M-S-l") (kbd "M-S-f"))
  (define-key key-translation-map (kbd "C-M-S-l") (kbd "C-M-S-f"))

  (keyboard-translate ?\C-f ?\C-l)
  (define-key key-translation-map (kbd "M-f") (kbd "M-l"))
  (define-key key-translation-map (kbd "C-S-f") (kbd "C-S-l"))
  (define-key key-translation-map (kbd "C-M-f") (kbd "C-M-l"))
  (define-key key-translation-map (kbd "M-S-f") (kbd "M-S-l"))
  (define-key key-translation-map (kbd "C-M-S-f") (kbd "C-M-S-l"))

  (keyboard-translate ?\C-b ?\C-h)
  (define-key key-translation-map (kbd "M-b") (kbd "M-h"))
  (define-key key-translation-map (kbd "C-S-b") (kbd "C-S-h"))
  (define-key key-translation-map (kbd "C-M-b") (kbd "C-M-h"))
  (define-key key-translation-map (kbd "M-S-b") (kbd "M-S-h"))
  (define-key key-translation-map (kbd "C-M-S-b") (kbd "C-M-S-h"))

  (keyboard-translate ?\C-p ?\C-k)
  (define-key key-translation-map (kbd "M-p") (kbd "M-k"))
  (define-key key-translation-map (kbd "C-S-p") (kbd "C-S-k"))
  (define-key key-translation-map (kbd "C-M-p") (kbd "C-M-k"))
  (define-key key-translation-map (kbd "M-S-p") (kbd "M-S-k"))
  (define-key key-translation-map (kbd "C-M-S-p") (kbd "C-M-S-k"))

  (keyboard-translate ?\C-n ?\C-j)
  (define-key key-translation-map (kbd "M-n") (kbd "M-j"))
  (define-key key-translation-map (kbd "C-S-n") (kbd "C-S-j"))
  (define-key key-translation-map (kbd "C-M-n") (kbd "C-M-j"))
  (define-key key-translation-map (kbd "M-S-n") (kbd "M-S-j"))
  (define-key key-translation-map (kbd "C-M-S-n") (kbd "C-M-S-j")))

(lhr/keyboard-translate)

; #+end_src



; **** init-editing-utils.el
; #+BEGIN_SRC emacs-lisp



; (if (fboundp 'with-eval-after-load)
;     (defalias 'after-load 'with-eval-after-load)
;   (defmacro after-load (feature &rest body)
;     "After FEATURE is loaded, evaluate BODY."
;     (declare (indent defun))
;     `(eval-after-load ,feature
;        '(progn ,@body))))


(require-package 'unfill)

(when (fboundp 'electric-pair-mode)
  (electric-pair-mode))
(when (eval-when-compile (version< "24.4" emacs-version))
  (electric-indent-mode 1))

;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 make-backup-files t
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(transient-mark-mode t)


;;; Whitespace

(defun sanityinc/no-trailing-whitespace ()
  "Turn off display of trailing whitespace in this buffer."
  (setq show-trailing-whitespace nil))

;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(dolist (hook '(special-mode-hook
                eww-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook #'sanityinc/no-trailing-whitespace))


(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)

(global-set-key [remap just-one-space] 'cycle-spacing)



;;; Newline behaviour

(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'sanityinc/newline-at-end-of-line)



; (when (eval-when-compile (string< "24.3.1" emacs-version))
;   ;; https://github.com/purcell/emacs.d/issues/138
;   (after-load 'subword
;     (diminish 'subword-mode)))



(when (fboundp 'global-prettify-symbols-mode)
  (global-prettify-symbols-mode))


; (require-package 'undo-tree)
; (global-undo-tree-mode)
; (diminish 'undo-tree-mode)



;; (require-package 'highlight-symbol)
;; (dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
;;   (add-hook hook 'highlight-symbol-mode)
;;   (add-hook hook 'highlight-symbol-nav-mode))
;; (eval-after-load 'highlight-symbol
;;   '(diminish 'highlight-symbol-mode))

;;----------------------------------------------------------------------------
;; Zap *up* to char is a handy pair for zap-to-char
;;----------------------------------------------------------------------------
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")
(global-set-key (kbd "M-Z") 'zap-up-to-char)



(require-package 'browse-kill-ring)


;;----------------------------------------------------------------------------
;; Don't disable narrowing commands
;;----------------------------------------------------------------------------
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;;----------------------------------------------------------------------------
;; Show matching parens
;;----------------------------------------------------------------------------
(show-paren-mode 1)

;;----------------------------------------------------------------------------
;; Expand region
;;----------------------------------------------------------------------------

; (require-package 'expand-region)
(require 'expand-region)



;;----------------------------------------------------------------------------
;; Don't disable case-change functions
;;----------------------------------------------------------------------------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;;----------------------------------------------------------------------------
;; Rectangle selections, and overwrite text when the selection is active
;;----------------------------------------------------------------------------
(cua-selection-mode t)                  ; for rectangles, CUA is nice


;;----------------------------------------------------------------------------
;; Handy key bindings
;;----------------------------------------------------------------------------
;; To be able to M-x without meta
;;todo 这里有问题, C-m会转化成为C-c m 从而退出.
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Vimmy alternatives to M-^ and C-u M-^
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-c J") (lambda () (interactive) (join-line 1)))

(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)

(require-package 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "C-:") 'ace-jump-word-mode)


(require-package 'multiple-cursors)
(require 'multiple-cursors)
;; multiple-cursors
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; From active region to multiple cursors:

; (global-set-key (kbd "C-c c r") 'set-rectangular-region-anchor)
; (global-set-key (kbd "C-c c c") 'mc/edit-lines)
; (global-set-key (kbd "C-c c e") 'mc/edit-ends-of-lines)
; (global-set-key (kbd "C-c c a") 'mc/edit-beginnings-of-lines)


;; Train myself to use M-f and M-b instead
(global-unset-key [M-left])
(global-unset-key [M-right])



(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)


;;----------------------------------------------------------------------------
;; Page break lines
;;----------------------------------------------------------------------------
(require-package 'page-break-lines)
(global-page-break-lines-mode)
(diminish 'page-break-lines-mode)

;;----------------------------------------------------------------------------
;; Fill column indicator
;;----------------------------------------------------------------------------
(when (eval-when-compile (> emacs-major-version 23))
  (require-package 'fill-column-indicator)
  (defun sanityinc/prog-mode-fci-settings ()
    (turn-on-fci-mode)
    (when show-trailing-whitespace
      (set (make-local-variable 'whitespace-style) '(face trailing))
      (whitespace-mode 1)))

  ;;(add-hook 'prog-mode-hook 'sanityinc/prog-mode-fci-settings)

  (defun sanityinc/fci-enabled-p ()
    (and (boundp 'fci-mode) fci-mode))

  (defvar sanityinc/fci-mode-suppressed nil)
  (defadvice popup-create (before suppress-fci-mode activate)
    "Suspend fci-mode while popups are visible"
    (let ((fci-enabled (sanityinc/fci-enabled-p)))
      (when fci-enabled
        (set (make-local-variable 'sanityinc/fci-mode-suppressed) fci-enabled)
        (turn-off-fci-mode))))
  (defadvice popup-delete (after restore-fci-mode activate)
    "Restore fci-mode when all popups have closed"
    (when (and sanityinc/fci-mode-suppressed
               (null popup-instances))
      (setq sanityinc/fci-mode-suppressed nil)
      (turn-on-fci-mode)))

  ;; Regenerate fci-mode line images after switching themes
  (defadvice enable-theme (after recompute-fci-face activate)
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (when (sanityinc/fci-enabled-p)
          (turn-on-fci-mode))))))


;;----------------------------------------------------------------------------
;; Shift lines up and down with M-up and M-down. When paredit is enabled,
;; it will use those keybindings. For this reason, you might prefer to
;; use M-S-up and M-S-down, which will work even in lisp modes.
;;----------------------------------------------------------------------------
(require-package 'move-dup)
(global-set-key [M-up] 'md/move-lines-up)
(global-set-key [M-down] 'md/move-lines-down)
(global-set-key [M-S-up] 'md/move-lines-up)
(global-set-key [M-S-down] 'md/move-lines-down)

(global-set-key (kbd "C-c p") 'md/duplicate-down)
(global-set-key (kbd "C-c P") 'md/duplicate-up)

;;----------------------------------------------------------------------------
;; Fix backward-up-list to understand quotes, see http://bit.ly/h7mdIL
;;----------------------------------------------------------------------------
(defun backward-up-sexp (arg)
  "Jump up to the start of the ARG'th enclosing sexp."
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'backward-up-sexp) ; C-M-u, C-M-up


;;----------------------------------------------------------------------------
;; Cut/copy the current line if no region is active
;;----------------------------------------------------------------------------
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

(defun suspend-mode-during-cua-rect-selection (mode-name)
  "Add an advice to suspend `MODE-NAME' while selecting a CUA rectangle."
  (let ((flagvar (intern (format "%s-was-active-before-cua-rectangle" mode-name)))
        (advice-name (intern (format "suspend-%s" mode-name))))
    (eval-after-load 'cua-rect
      `(progn
         (defvar ,flagvar nil)
         (make-variable-buffer-local ',flagvar)
         (defadvice cua--activate-rectangle (after ,advice-name activate)
           (setq ,flagvar (and (boundp ',mode-name) ,mode-name))
           (when ,flagvar
             (,mode-name 0)))
         (defadvice cua--deactivate-rectangle (after ,advice-name activate)
           (when ,flagvar
             (,mode-name 1)))))))

(suspend-mode-during-cua-rect-selection 'whole-line-or-region-mode)




(defun sanityinc/open-line-with-reindent (n)
  "A version of `open-line' which reindents the start and end positions.
If there is a fill prefix and/or a `left-margin', insert them
on the new line if the line would have been blank.
With arg N, insert N newlines."
  (interactive "*p")
  (let* ((do-fill-prefix (and fill-prefix (bolp)))
         (do-left-margin (and (bolp) (> (current-left-margin) 0)))
         (loc (point-marker))
         ;; Don't expand an abbrev before point.
         (abbrev-mode nil))
    (delete-horizontal-space t)
    (newline n)
    (indent-according-to-mode)
    (when (eolp)
      (delete-horizontal-space t))
    (goto-char loc)
    (while (> n 0)
      (cond ((bolp)
             (if do-left-margin (indent-to (current-left-margin)))
             (if do-fill-prefix (insert-and-inherit fill-prefix))))
      (forward-line 1)
      (setq n (1- n)))
    (goto-char loc)
    (end-of-line)
    (indent-according-to-mode)))

(global-set-key (kbd "C-o") 'sanityinc/open-line-with-reindent)


;;----------------------------------------------------------------------------
;; Random line sorting
;;----------------------------------------------------------------------------
(defun sort-lines-random (beg end)
  "Sort lines in region randomly."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr nil 'forward-line 'end-of-line nil nil
                   (lambda (s1 s2) (eq (random 2) 0)))))))




;;高亮脱字符\t,\n等
; (require-package 'highlight-escape-sequences)
(require 'highlight-escape-sequences)

(hes-mode)


(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-x 4" "C-x 5" "C-c ;" "C-c ; f" "C-c ' f" "C-x n"))
(guide-key-mode 1)
(diminish 'guide-key-mode)


(provide 'init-editing-utils)
; #+END_SRC






;;==============================
(lhr/define-keys-every-mode "C-a" 'move-beginning-of-line)
(lhr/define-keys-every-mode "C-e" 'move-end-of-line)

(lhr/define-keys-every-mode "M-n" 'forward-paragraph)
(lhr/define-keys-every-mode "M-p" 'backward-paragraph)



;; push buffer 到窗口
(require-package 'buffer-move)
(lhr/define-keys-every-mode  "<C-S-up>" 'buf-move-up)
(lhr/define-keys-every-mode  "<C-S-down>" 'buf-move-down)
(lhr/define-keys-every-mode  "<C-S-left>" 'buf-move-left)
(lhr/define-keys-every-mode  "<C-S-right>" 'buf-move-right)





(defun lhr/C-d (arg)
  "mark whole and mc/next"
  (interactive "p")
  (if mark-active
      (if (region-active-p)
          (if (< arg 0)
              (let ((cursor (mc/furthest-cursor-after-point)))
                (if cursor
                    (mc/remove-fake-cursor cursor)
                  (error "No cursors to be unmarked")))
            (mc/mark-more-like-this (= arg 0) 'forwards))
        (mc/mark-lines arg 'forwards))
    (mc/maybe-multiple-cursors-mode)
    (er/expand-region arg) )
  )

;;高亮相同的行为, 只在 mc 的时候加框
(remove-hook 'prog-mode-hook 'highlight-symbol-mode)
(remove-hook 'prog-mode-hook 'highlight-symbol-nav-mode)

;; 鼠标选中就复制
(setq mouse-drag-copy-region t)


;;C-d mark word, and select next like this

(lhr/define-keys-every-mode  "C-o" 'lhr/C-d)
(lhr/define-keys-every-mode  "C-<" 'mc/mark-previous-like-this)
(lhr/define-keys-every-mode  "C-c C-<" 'mc/mark-all-like-this)


;;复制行
(lhr/define-keys-every-mode "C-S-o" 'md/duplicate-down)

;;helm-M-x
;;(lhr/define-keys-every-mode "M-x" 'helm-M-x)

;;vim 的*#行为, 以及高亮, 绑定在 387 上面
(global-set-key (kbd "C-*") 'highlight-symbol-next)
(global-set-key (kbd "C-#") 'highlight-symbol-prev)
(global-set-key (kbd "C-&") 'highlight-symbol-at-point)


;;C-w
(lhr/define-keys-every-mode "C-w" 'lhr/C-w)

(defun lhr/C-w ()
  "有 region 的时候 cut region, 没有的时候删除单词, 行首的时候操作整行"
  (interactive)
  (if mark-active
      (whole-line-or-region-kill-region nil)
    (if (bolp)
        (whole-line-or-region-kill-region nil)
      (backward-kill-word 1))
    )
  )

;;(browse-kill-ring-default-keybindings)

(lhr/define-keys-every-mode "M-y" 'helm-show-kill-ring)



; #+end_src

; *** 基本功能: 复制粘贴, 撤销, zxcv, 标准行为, 统一键位 !!!
; C: 基本操作
; C-M: 单词
; M: 功能
; S: 项目
; | C-z ,C-S-z | undo,redo       |                     |
; | C-x        | cut             |                     |
; | C-c        | copy            |                     |
; | C-c        | paste           |                     |
; | C-M-x,c    | 单词            |                     |
; | C-M-v      | paste 历史      |                     |
; |            |                 |                     |
; | C-s        | 存盘            |                     |
; | C-s        | org-存盘        | (org-edit-src-save) |
; |            |                 |                     |
; | C-M-s      | 存全部          |                     |
; | C-S-s      | 另存为          |                     |
; | C-f        | helm-swoop      |                     |
; | C-S-f      | 全 buffer 搜索  |                     |
; | ag         | 项目内 ag, 搜索 |                     |
; | M-f        | find-file       | helm-find           |
; | C-M-f      | 项目内 find     | helm-find-proj      |
; 所有 M-S 的键都有失效
; | C-t   | imenu                  |             |
; | C-M-t | 项目内 imenu           |             |
; | C-S-t | 打开刚关闭的 buffer    |             |
; | M-x   | command palette        | helm-M-x    |
; | M-z   | last-helm              | helm-resume |
; | C-/   | 注释                   |             |
; | C-S-/ | 菜单项, 以后探索       |             |
; | C-w   | 关闭 buffer            |             |
; | C-n   | 新建                   |             |
; | C-r   | 运行                   |             |
; | C-d   | debug                  |             |
; | C-d   | 选择单词, 模拟 sublime | review      |
; |       | 多行操作, 复制粘贴     |             |

;    - `M-x helm-swoop` when region active
;    - `M-x helm-swoop` when the cursor is at any symbol
;    - `M-x helm-swoop` when the cursor is not at any symbol
;    - `M-3 M-x helm-swoop` or `C-u 5 M-x helm-swoop` multi separated line culling
;    - `M-x helm-multi-swoop` multi-occur like feature
;    - `M-x helm-multi-swoop-all` apply all buffers
;    - `C-u M-x helm-multi-swoop` apply last selected buffers from the second time
;    - `M-x helm-swoop-same-face-at-point` list lines have the same face at the cursor is on
;    - During isearch `M-i` to hand the word over to helm-swoop
;    - During helm-swoop `M-i` to hand the word over to helm-multi-swoop-all
;    - While doing `helm-swoop` press `C-c C-e` to edit mode, apply changes to original buffer by `C-x C-s`


; *** bookmark
; #+BEGIN_SRC emacs-lisp
(lhr/define-keys-every-mode "<f9>" 'bookmark-set)
(lhr/define-keys-every-mode "S-<f9>" 'helm-bookmarks)


; (global-set-key [f12] 'list-bookmarks)
; (global-set-key (kbd "M-o") 'switch-window)
;;(my-define-keys-every-mode "<f9>" 'bookmark-set)

; #+END_SRC

; #+begin_src emacs-lisp


  ;; zxcv

  ;;需要调整 mode
  (lhr/define-keys-every-mode  "C-z" 'undo-tree-undo)
  (lhr/define-keys-every-mode  "C-S-z" 'undo-tree-redo)

  ;;  (lhr/define-keys-every-mode "H-x" 'whole-line-or-region-kill-region)
  ;;  (lhr/define-keys-every-mode "H-c" 'whole-line-or-region-kill-ring-save)
  (lhr/define-keys-every-mode "C-y" 'whole-line-or-region-yank)
  (lhr/define-keys-every-mode "s-v" 'whole-line-or-region-yank)
  (lhr/define-keys-every-mode "s-c" 'whole-line-or-region-kill-ring-save)
  ;; cua-scroll-up 原来的 C-v
  ;; cua-scroll-down 原来的 M-v
  ;; 单词 zxcv
  ;;  (global-set-key (kbd "C-M-x") ')

  ;; 存盘
  ; (lhr/define-keys-every-mode "C-s" 'save-buffer)
  ; (define-key org-src-mode-map (kbd "C-s") 'org-edit-src-save )


  ;;helm
;; todo
  (lhr/define-keys-every-mode "M-l" 'helm-find)
  (lhr/define-keys-every-mode "C-M-l" 'helm-projectile)
  (lhr/define-keys-every-mode "s-n" 'scratch)

    ;;撤销和恢复
    (global-unset-key (kbd "C-z"))
    (global-set-key (kbd "C-z") 'undo-tree-undo)
    (global-set-key (kbd "C-S-z") 'undo-tree-redo)

    ;;切换evil模式, helm-recent
    (evil-set-toggle-key "C-M-z")
    (lhr/define-keys-every-mode "M-z" 'helm-resume)


    ;;没什么作用
    (global-set-key (kbd "C-M-r") 'cua-set-rectangle-mark)




  (lhr/define-keys-every-mode "C-t" 'helm-imenu)
  (lhr/define-keys-every-mode "C-M-t" 'helm-imenu)


;;恢复关闭的 buffer:  http://stackoverflow.com/questions/10394213/emacs-reopen-previous-killed-buffer
  (require 'cl)
  (require 'recentf)

  (defun find-last-killed-file ()
    (interactive)
    (let ((active-files (loop for buf in (buffer-list)
                              when (buffer-file-name buf) collect it)))
      (loop for file in recentf-list
            unless (member file active-files) return (find-file file))))

  (lhr/define-keys-every-mode "C-S-t" 'find-last-killed-file)



  (windmove-default-keybindings)
  (lhr/define-keys-every-mode "s-w" 'kill-this-buffer)
  (lhr/define-keys-every-mode "C-S-w" 'kill-this-buffer)
  (lhr/define-keys-every-mode "C-x b" 'helm-mini)
  (lhr/define-keys-every-mode "C-x C-b" 'helmqhelm-mini)


  ;; (lhr/define-keys-every-mode "M-e" 'sanityinc/eval-last-sexp-or-region)

  ; (require-package 'unbound)
  ;;(describe-unbound-keys)

  ;;(global-set-key (kbd "C-s") 'save-buffer)

  ;;(bind-key* "<C-return>" 'newline-and-indent)

    ;;;(bind-key* "C-f" 'isearch-forward)

  (lhr/define-keys-every-mode "C-l" 'helm-swoop)
;;  (lhr/define-keys-every-mode "C-l" 'helm-occur)
  (lhr/define-keys-every-mode "C-S-l" 'helm-multi-swoop-all)



      ;;; 每一个 buffer 是独立的进程吗, 看起开是的, 因为每个 buffer 的 mode 都是不一样的, 同一个函数在不同的 buffer 里面有的能执行有的则不能. '
    ;;; translate shift

    ;;; define*

    ;;;

; #+end_src


; *** 编辑功能: jump, 选择块, 并为 region 加框, 编辑模式插入下一行和上一行, 矩形和多光标 !!
;     - State "DOING"      from "DONE"       [2015-02-09 Mon 19:02]
;     - State "DONE"       from "WAITING"    [2015-02-09 Mon 19:02]

; | C-[ | 后退              |                        |      |   |
; | C-] | 前进              |                        |      |   |
; |-----+-------------------+------------------------+------+---|
; | C-p | 选择段落          |                        |      |   |
; |     | 为 region 加 src     |                        |      |   |
; |-----+-------------------+------------------------+------+---|
; |     | 下面插入一行      |                        |      |   |
; |     | 上面插入一行      |                        |      |   |
; |-----+-------------------+------------------------+------+---|
; |     | 多光标            |                        | need |   |
; |     | paredit           |                        |      |   |
; |-----+-------------------+------------------------+------+---|
; |     | mark 当前单词      | s                      |      |   |
; |     | 删除当前单词      | C-M-x                  |      |   |
; |     | 删除当前子树      | 查找子树的是什么修饰键 |      |   |
; |     | 复制当前子树      |                        |      |   |
; |     |                   |                        |      |   |
; |     | narrow and widden |                        |      |   |
; |     |                   |                        |      |   |


; #+begin_src emacs-lisp
;;b = 标记段落


;;global-mark-set and pop 都是 C-S-SPC, 挺好用的, 别纠结了, 换按键吧.

;; 如果没有 reigion C-d mark 单词, 否则, 选择下一个




(if window-system
    (progn (keyboard-translate ?\C-m ?\H-m)
           (define-key key-translation-map (kbd "H-m") (kbd "C-c m")))
  )
(lhr/define-keys-every-mode "C-c m" 'er/mark-text-paragraph)
(lhr/define-keys-every-mode "M-a" 'mark-whole-buffer)

;;, . = 翻页



;;  (lhr/define-keys-every-mode "C-." [next])
;;  (lhr/define-keys-every-mode "C-," [prior])

;; (global-set-key (kbd "C-m") [next])


; #+end_src

; *** 界面切换, 管理
; | 窗口分割          |                            |                             |                 |
; | swap 布局          |                            |                             |                 |
; |                   |                            |                             |                 |
; | 选择段落          |                            |                             |                 |
; | 选择块            |                            |                             |                 |
; | 切换 tab          | C-tab, C-S-tab             |                             | org 冲突        |
; | 关闭 tab          |                            |                             |                 |
; | winner undo       | C-c, left, right           |                             |                 |
; | 切换 buffer       | C-x, left, right           |                             |                 |
; |                   |                            |                             |                 |
; |                   |                            |                             |                 |
; | 撤销              | C-/ , C-S-/ ,  u,          |                             |                 |
; |                   | C-x, u                     |                             |                 |
; | 滚屏              | C-v                        | scroll-up-command           |                 |
; | 回滚              |                            |                             |                 |
; | 描述函数          | ,hd  , C-h f               | describe-function           |                 |
; |                   |                            |                             |                 |
; | 描述 key           | ,hk  , C-h k               | describe-key                |                 |
; | 回删单词          | C-w                        | evil-delete-backward-word   |                 |
; | Cut               | C-w, s-x                   | kill-region                 | yes             |
; | 拷贝上一行字符    | C-y                        | evil-copy-from-above        |                 |
; |                   |                            |                             |                 |
; |                   |                            |                             |                 |
; | 标记成 黄色       | M-select                   |                             | review          |
; | 段落移动          | M-jk            ,C-up,down | forward-paragraph           | review          |
; |                   |                            |                             |                 |
; |                   |                            |                             |                 |
; | 存盘              | ,ww ,xw  s-s  C-x C-s      | save-buffer                 | done            |
; |                   |                            |                             |                 |
; |                   | C-s                        | isearch-forward-regexp      |                 |
; |                   | s-f                        | isearch-forward             |                 |
; |                   |                            |                             |                 |
; | copy              | s-c  , 菜单 copy           | ns-copy-including-secondary | yes             |
; | paste             | s-v  ,  菜单 paste         | yank                        | yes             |
; |                   |                            |                             |                 |
; | 翻页              | s-j, C-x C-x               | exchange-point-and-mark     | yes             |
; |                   | s-k                        | 切到 normal ,  删除 buffer  | yes  改成翻页吧 |
; |                   |                            |                             |                 |
; |                   | C-r                        | evil-paste-from-register    | yes             |
; |                   |                            |                             |                 |
; |                   | C-backspace, M-backspace   | backward-kill-word          | yes             |
; |                   | C-S-backspace              | kill-whole-line             |                 |
; |                   | C-k                        | kill-line                   |                 |
; |                   |                            |                             |                 |
; | todo: recent 跳转 | C-[                        | 目前是切换模式, 切到 normal |                 |
; |                   | C-]                        | abort-recursive-edit        |                 |
; |                   |                            |                             |                 |
; | list bookmarks    | f12                        |                             |                 |
; |                   |                            |                             |                 |

; #+begin_src emacs-lisp


  (when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

  (winner-mode 1)

  (lhr/define-keys-every-mode "M-`"  'elscreen-next)

  ;; http://tapoueh.org/emacs/switch-window.html
  ; (global-set-key (kbd "C-x o") 'switch-window)

  ;; move window
  (require-package 'window-numbering)
  (custom-set-faces '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold)))))
  (window-numbering-mode 1)



  ;; make "C-x o" prompt for a target window when there are more than 2
  ; (add-to-list 'melpa-include-packages 'switch-window)

  ; (require-package 'switch-window)
  ; (require 'switch-window)
  ; (setq switch-window-shortcut-style 'alphabet)
  ; (global-set-key (kbd "C-x o") 'switch-window)



; #+end_src

; *** todo:  [5/24]

; **** todo orgsubtree 内部搜索

; **** TODO org subree 操作
; **** TODO C-h,j,l

; **** TODO 推 buffer
; **** TODO purcell 有个功能是光标移动就自动 reindent, review
; **** TODO C-d 无 mark 的时候 mark 单词, 有 mark 的时候就是下一个, 参考 C-w dea
; **** TODO 多光标, 见上面

; **** TODO 调整
; **** TODO s 系按键都不能用
; **** TODO 基于 lium 主题调整一些颜色
; **** TODO C-i 被解放出来了
; **** TODO 新行
; **** TODO mark-whole-word C-= expand-region
; **** TODO 终端下的颜色, C-H 行为
; **** TODO 当前 del 的行为 M-d

; **** DONE 研究 lisha 是怎样实现的, 用键盘映射的方式实现 emacs 的快捷键. 可以写个自己的键盘映射文件. neo 其实就是多设置了一个快捷键, 我不要, 我就用 ctrl 一个键就可以了, 多了烦. 自己写一个跨平台的键位映射就行了. 就用 qwerty 吧. 或者 coleman, 或者 workman, 暂时就用 qwerty, 因为它对中文输入和快捷键都很友好.
;      CLOSED: [2015-02-02 Mon 23:44]
;      - State "DONE"       from "STARTED"    [2015-02-02 Mon 23:44]

; **** STARTED 把 sublime 和 emacs 快捷键配成一样的.

; **** CANCELLED emacs 快捷键变成 C-b, C-i
;      CLOSED: [2015-02-02 Mon 23:45]
;      - State "CANCELLED"  from ""           [2015-02-02 Mon 23:45] \\
;        恢复 xc 快捷键

; **** DONE tmux 快捷键也用 b
;      CLOSED: [2015-02-02 Mon 23:45]
;      - State "DONE"       from "STARTED"    [2015-02-02 Mon 23:45]

; **** TODO lhr.rc

; **** 分析 purecell, 比较 commit, 还有就是分析

; **** TODO keybinding 可以分离出来单独管理. 如果禁用某个包只需要禁用本身就可以了. 或者用 tag 管理

; **** DONE 先用自己的映射实现.
;      CLOSED: [2015-02-02 Mon 23:46]
;      - State "DONE"       from "STARTED"    [2015-02-02 Mon 23:46]

; **** DONE 并不一定是奇异的技巧才是好的, 把快捷键统一起来. 才是最好的. 能有效的工作就好. 把 emacs 该造成 sublime...ok, gou le.
;      CLOSED: [2015-02-02 Mon 23:46]
;      - State "DONE"       from "STARTED"    [2015-02-02 Mon 23:46]


; **** TODO eval-after-load 是覆盖还是添加.

; **** C-M-r, sublime 中终端重复执行上一条命令并切回来. sublime 内

; **** C-M-c, 复制 python 代码到已有的 iterm 窗口并运行, 全局

; *** 补全, python dev
; 修复 company mode and yasnippets
; todo: python ide
; elpy anaconda

; *** org mode
; | 目标           | 快捷键                  | 函数                    | 需修改       | 模式 |
; |----------------+-------------------------+-------------------------+--------------+------|
; | 编辑           |                         |                         |              |      |
; |----------------+-------------------------+-------------------------+--------------+------|
; | 插入 标题      | C-enter, M-enter        |                         |              |      |
; | 插入 项目      | M-enter                 | M 和项目联系起来         |              |      |
; | 切换 todo      | S + 左右                | S 和 todo 或者状态联系起来 |              |      |
; | 插入 todo      | C-S-enter               |                         |              |      |
; | 删除一项       |                         |                         | review       |      |
; |                | C-M-enter               | not defined             | review       |      |
; | 剪切子树       | not defined             | org-cut-subtree         |              |      |
; |----------------+-------------------------+-------------------------+--------------+------|
; |                |                         |                         |              |      |
; | swap 行列      | M-arrow, M-hl, C-M-hjkl |                         | 多行需要修正 |      |
; | 插入一列,  行  | M-shift+down, right     | shift 插入               |              |      |
; |                |                         |                         |              |      |
; | 分割行         | M-enter                 |                         |              |      |
; | 复制上一行     | S-enter                 | (org-table-copy-down N) |              |      |
; |                |                         |                         |              |      |
; |----------------+-------------------------+-------------------------+--------------+------|
; | 操作           |                         |                         |              |      |
; |----------------+-------------------------+-------------------------+--------------+------|
; | 表格操作       |                         |                         |              |      |
; | 重排表格       | C-c C-c                 |                         |              |      |
; | 插入表格       | C-c  竖线               |                         |              |      |
; | 插入水平分割线 | C-c -                   |                         |              |      |
; | 计算一列之和   | C-c +                   |                         |              |      |
; | 排序           | C-c ^                   |                         |              |      |
; | column formula | C-c =                   |                         |              |      |
; |----------------+-------------------------+-------------------------+--------------+------|
; | 列表操作       |                         |                         |              |      |
; | 转换列表符号   | C-c -                   |                         |              |      |
; | 转换为标题     | C-c *                   |                         |              |      |
; | 排序           | C-c ^                   |                         |              |      |
; |----------------+-------------------------+-------------------------+--------------+------|


; *** tabbar (暂停)

; 撤销关闭的 buffer
; 即使不显示 tabbar, 也要有能切换 buffer 按键

;   (define-key org-mode-map (kbd "C-<tab>") 'tabbar-forward)



; #+begin_src emacs-lisp
;;  (define-key org-mode-map (kbd "C-<tab>") 'next-buffer)
;;  (define-key org-mode-map (kbd "C-S-<tab>") 'previous-buffer)
;;  (define-key evil-normal-state-map (kbd "C-<tab>") 'next-buffer)
  (lhr/define-keys-every-mode "<C-S-tab>" 'previous-buffer); 暂时定义这个按键, 以后再改
  (lhr/define-keys-every-mode "<C-tab>" 'next-buffer); 暂时定义这个按键, 以后再改

; #+end_src




; ** todo: 配置
; ***  complile 配置文件.
; 无所谓, 其实可以不用编译, 实测速度上区别不大, 而且配置文件编译了不方便.
; (byte-recompile-directory) 默认只是 recompile, 前面加 C-u, 0, 强制 recompile 整个目录.

; *** 编辑功能有点问题:
; - mark visible 有问题
; - s-c s-v 有问题. 不能整行复制删除了.
; - 用 24 版本, 并且 terminal 通用.
; - 解决 org comment 的问题, 用 ome 来做吗?  暂时不要.
; - 用 purcell 的版本, 它的 terminal 通用, 且能用鼠标, 反向合并
; - 滚动的速度的配置, 分离出来. 在 osx-keys 里面
; - 升级插件, evil

; *** quickrun

; *** evil update
; *** ropemacs

; *** rv regexp visual

; *** shell switch

; *** smartparens

; *** STARTED helm-swoop
;     :LOGBOOK:
;     :END:

; *** helm is good!
; *** window and ui
; *** ui 设置

; #+begin_src emacs-lisp
; #+end_src

; *** 安装 emacs-mac






(provide 'lhr-keybindings)