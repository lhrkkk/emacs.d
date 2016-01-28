;; -*- Emacs-Lisp -*-

;; Time-stamp: <2011-08-10 20:12:29 Wednesday by lhr>

(require 'recent-jump)
(require 'recent-jump-small)

(setq rj-mode-line-format nil)
(setq rjs-mode-line-format nil)

(recent-jump-mode)
(recent-jump-small-mode)

;;C-.原来是cua-set-mark, 取消掉才能用
(global-unset-key (kbd "C-."))

(add-hook 'cua-mode-hook
          (lambda()
            (local-unset-key (kbd "C-."))))


(let ((map global-map)
      (org-map org-mode-map)

      (key-pairs
       `(("C-,"   recent-jump-backward)
         ("C-."   recent-jump-forward)
         ("C-x ," recent-jump-small-backward)
         ("C-x ." recent-jump-small-forward))))
  (apply-define-key org-map key-pairs)
  (apply-define-key map key-pairs)
  (apply-define-key evil-insert-state-map  key-pairs)
  (apply-define-key  evil-visual-state-map key-pairs)
  (apply-define-key  evil-emacs-state-map  key-pairs)
  (apply-define-key  evil-normal-state-map key-pairs)
  ; 没有cua-mode-map
  ; (apply-define-key  cua-mode-map key-pairs)

  )

(provide 'recent-jump-settings)
