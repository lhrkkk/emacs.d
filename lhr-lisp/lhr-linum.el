
; *** highlight and linum
; #+BEGIN_SRC emacs-lisp
(require-package 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-mode)

(require-package 'linum-relative)
(require 'linum-relative)
(delq 'org-mode linum-mode-inhibit-modes-list)
(linum-mode 1)

;; https://www.ptt.cc/bbs/Editor/M.1328010417.A.4D4.html
(defun toggle-linum-relative ()
      (interactive)
      (if (eq linum-format 'dynamic)
        (setq linum-format 'linum-relative)
        (setq linum-format 'dynamic))
      )

; (defadvice evil-normal-state (after evil-normal-state-after activate) (toggle-linum-relative))
(add-hook 'evil-normal-state-entry-hook '(lambda ()(setq linum-format 'linum-relative)))
(add-hook 'evil-insert-state-entry-hook '(lambda ()(setq linum-format 'dynamic)))

; #+END_SRC


(provide 'lhr-linum)