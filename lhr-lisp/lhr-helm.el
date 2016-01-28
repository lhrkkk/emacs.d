(require-package 'helm-swoop)
(require 'helm-swoop)

(require-package 'async)
(require-package 'helm-swoop)
(require-package 'helm-projectile)
;;(require 'helm-config)

;;;; helm-swoop settings
;;save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save nil)

;;if this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;;split direction. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;;;if nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

;;go to the opposite side of line from the end or beginning of line
(setq helm-swoop-move-to-line-cycle t)

;;optional face for line numbers
;;face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-line-number-face t)

;;;; end

;; fuzzy settingfuzzy
(setq helm-m-x-fuzzy-match t )          ;helm-m-x
(setq helm-buffers-fuzzy-matching t )   ;helm-mini, helm-buffers-list
(setq helm-recentf-fuzzy-match t )      ;helm-recentf
(setq helm-locate-fuzzy-match t )      ;helm-locate
(setq helm-semantic-fuzzy-match t )     ;helm-semantic
(setq helm-imenu-fuzzy-match t )        ;helm-imenu
(setq helm-apropos-fuzzy-matc t)        ;helm-apropos
(setq helm-lisp-fuzzy-completion t)     ;helm-lisp-completion-at-point

(autoload 'helm-swoop "helm-swoop" nil t)
(autoload 'helm-back-to-last-point "helm-swoop" nil t)

;; when doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)



(provide 'lhr-helm)