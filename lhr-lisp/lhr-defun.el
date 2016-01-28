;  lhr/defun
; #+begin_src emacs-lisp

;;可以改善, 可以先写一个接受 mode 列表的函数, 然后再定义这个函数
(require-package  'use-package)


;;http://emacs.stackexchange.com/questions/352/how-to-override-major-mode-bindings/358#358

(require 'use-package)
(require 'bind-key)

    ;; todo: 写函数, lambda

        ;;;###autoload

(defun eal-define-keys-commonly (keymap key-defs)
  "execute `define-key' on keymap use arguments from key-defs.

        key-defs should be one list, every element of it is a list
        whose first element is key like argument of `define-key', and second element is command
        like argument of `define-key'."
  (dolist (key-def key-defs)
    (when key-def
      (define-key keymap (eval `(kbd ,(car key-def))) (nth 1 key-def)))))
    (defalias 'apply-define-key 'eal-define-keys-commonly)


    (require 'recent-jump-settings)

(defun lhr/switch-to-cut-past-tmp-file ()
  (if (not (get-buffer "lhr.cut-paste-tmp"))
      (find-file (expand-file-name "lhr.cut-paste-tmp" user-emacs-directory))
    (set-buffer "lhr.cut-paste-tmp")
    )
)

(defun lhr/cut-inter-scratch ()
  "c-w to scratch and switch back"
  (interactive)
  (if (string= (buffer-name) "lhr.cut-paste-tmp")
      (save-window-excursion
      (save-excursion
        (call-interactively (global-key-binding "\C-w"))
        (select-window-1)
        (call-interactively (global-key-binding "\C-y"))
        ))
      (save-window-excursion
      (save-excursion
        (save-restriction
          (save-match-data
            (call-interactively (global-key-binding "\C-w"))
            (lhr/switch-to-cut-past-tmp-file)
            (call-interactively (global-key-binding "\C-y"))
            ))))))

(defun lhr/copy-inter-scratch ()
  "M-w to scratch and switch back"
  (interactive)
  (if (string= (buffer-name) "lhr.cut-paste-tmp")
      (save-window-excursion
      (save-excursion
        (call-interactively (global-key-binding "\M-w"))
        (select-window-1)
        (call-interactively (global-key-binding "\C-y"))
        ))
      (save-window-excursion
      (save-excursion
        (save-restriction
          (save-match-data
            (call-interactively (global-key-binding "\M-w"))
            (lhr/switch-to-cut-past-tmp-file)
            (call-interactively (global-key-binding "\C-y"))
            ))))))

;;call-interactively  http://emacs.stackexchange.com/questions/2461/how-can-i-simulate-an-arbitary-key-event-from-elisp

(global-set-key (kbd "<f5>") 'lhr/copy-inter-scratch)
(global-set-key (kbd "<f6>") 'lhr/cut-inter-scratch)



;;  some sentence
;;(save-excursion  body)
;;(save-restriction)
;;(save-match-data)
;;(save-window-excursion)
;;(setq temp-point (point))
;;(goto-char temp-point)
;;(setq temp-buffer (current-buffer))
;;(goto-char temp-buffer)

; #+END_SRC

; 覆盖所有的快捷键. lhr/define-keys-every-mode
; #+BEGIN_SRC emacs-lisp

; (require 'evil)
; (evil-mode 1)
(require 'help-mode)
(defun lhr/define-keys-every-mode (keystring funcdd)
  "define keys every where"

  (global-set-key (kbd keystring) funcdd)


  (define-key help-mode-map (kbd keystring) funcdd)
  (define-key org-mode-map (kbd keystring) funcdd)
  (define-key minibuffer-local-map (kbd keystring) funcdd)

  (if (boundp 'evil-mode)
    (progn (define-key evil-insert-state-map (kbd keystring) funcdd)
            (define-key evil-visual-state-map (kbd keystring) funcdd)
            (define-key evil-emacs-state-map (kbd keystring) funcdd)
            (define-key evil-normal-state-map (kbd keystring) funcdd) ))
  )
;;这里总是有问题, 引用, eval, 字符等还是不清楚
;;      (bind-keys*
;;       (keystring . 'funcdd))

; #+END_SRC

; 对 org 代码块操作, split and wrap blocks
; #+BEGIN_SRC emacs-lisp :tangle no

(defun lhr/split-blocks ()
  (interactive "p")
  (insert "hello")


  )


; #+end_src

(provide 'lhr-defun)