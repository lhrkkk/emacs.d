
(mapcar '(lambda (thelist) (add-to-list 'melpa-include-packages thelist))
  '(
    ox-reveal
    org-fstree
    names
    pangu-spacing
    org-bullets
    pinyin-search
    chinese-pyim
    google-translate
    popup
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    clojure-snippets
    queue
    )
)

; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
; (package-initialize)

(require-package 'clojure-mode)
(require-package 'clojure-mode-extra-font-locking)
(require-package 'cider)
(require-package 'clojure-snippets)



; (require-package 'pinyin-search 20150719.1755)

(provide 'lhr-elpa)