;; -*- coding: utf-8 -*-
;; ====开始====
;; brew tap railwaycat/emacsmacport
;; brew install emacs-mac


;; ====环境====

;; ----init path----

;(defvar best-gc-cons-threshold gc-cons-threshold "Best default gc threshold value. Should't be too big.")
(defvar best-gc-cons-threshold 4000000 "Best default gc threshold value. Should't be too big.")
;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lhr-lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/mylisp"))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *win64* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *emacs24* (and (not (featurep 'xemacs)) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)))

(require 'init-modeline)
(require 'cl-lib)

;; ----init elpa----
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el

;; Windows configuration, assuming that cygwin is installed at "c:/cygwin"
;; (condition-case nil
;;     (when *win64*
;;       ;; (setq cygwin-mount-cygwin-bin-directory "c:/cygwin/bin")
;;       (setq cygwin-mount-cygwin-bin-directory "c:/cygwin64/bin")
;;       (require 'setup-cygwin)
;;       ;; better to set HOME env in GUI
;;       ;; (setenv "HOME" "c:/cygwin/home/someuser")
;;       )
;;   (error
;;    (message "setup-cygwin failed, continue anyway")
;;    ))


; 这里是开始
; (require 'org)
; (org-babel-load-file "~/.emacs.d/all-init.org")




(require 'idle-require)
(require 'init-elpa)
(require 'init-exec-path) ;; Set up $PATH
;; 和 red 在文件级别上进行差异, 然后就是这个 init.el 是综合的, 放在一起.
;; ====外观====frame

;; ----os, frame----
(require 'init-frame-hooks)
;; any file use flyspell should be initialized after init-spelling.el
;; actually, I don't know which major-mode use flyspell.
(require 'init-spelling)
(require 'init-xterm)
(require 'init-gui-frames)


;; ----complete and editing ui----
(require 'init-ido)
(require 'init-dired)

(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flymake)
(require 'init-smex)
(require 'init-helm)
(require 'init-ivy)
(require 'init-hippie-expand)
;; ----window----
(require 'init-windows)
;; ----session----
(require 'init-sessions)


;; ====编辑导航====core editing, complete, navigate
;; ====开发====dev

(require 'init-git)
(require 'init-crontab)
(require 'init-markdown)
(require 'init-erlang)
(require 'init-javascript)
(require 'init-org)
(require 'init-org-mime)
(require 'init-css)
(require 'init-python-mode)
(require 'init-haskell)
(require 'init-ruby-mode)
(require 'init-lisp)
(require 'init-elisp)
(require 'init-yasnippet)
;; Use bookmark instead
(require 'init-zencoding-mode)
(require 'init-cc-mode)
(require 'init-gud)
(require 'init-linum-mode)
;; (require 'init-gist)
(require 'init-moz)
(require 'init-gtags)
;;evil 原来在这里, 有问题的话移动回来
(require 'init-evil)

(require 'init-sh)
(require 'init-ctags)
(require 'init-bbdb)
(require 'init-gnus)
(require 'init-lua-mode)
(require 'init-workgroups2)
(require 'init-term-mode)
(require 'init-web-mode)
(require 'init-slime)
(require 'init-clipboard)
(require 'init-company)
(require 'init-chinese-pyim) ;; cannot be idle-required
;; need statistics of keyfreq asap
(require 'init-keyfreq)
(require 'init-httpd)

;; projectile costs 7% startup time
;; ====evil====
;; use evil mode (vi key binding)

;; ====最后====finally
;; ====其他====other
;; misc has some crucial tools I need immediately
(require 'init-misc)

;; comment below line if you want to setup color theme in your own way
(if (or (display-graphic-p) (string-match-p "256color"(getenv "TERM"))) (require 'init-color-theme))

(require 'init-emacs-w3m)
(require 'init-hydra)

;==========

(require 'lhr-org-evil)

;; ====键盘====apply keybindings
(require 'lhr-elpa)
(require 'lhr-proxies)
(require 'lhr-osx-keys)

(require 'lhr-utils)
(require 'lhr-defun)
(require 'lhr-keybindings)

(require 'lhr-chinese)
(require 'lhr-linum)
(require 'lhr-helm)
(setq idle-require-message-verbose nil)
; (require 'setup-clojure-mode)




;==========




;; {{ idle require other stuff
(setq idle-require-idle-delay 3)
(setq idle-require-symbols '(init-misc-lazy
                             init-which-func
                             init-fonts
                             init-hs-minor-mode
                             init-textile
                             init-csv
                             init-writting
                             init-doxygen
                             init-pomodoro
                             init-emacspeak
                             init-artbollocks-mode
                             init-semantic))
(idle-require-mode 1) ;; starts loading
;; }}

(when (require 'time-date nil t)
   (message "Emacs startup time: %d seconds."
    (time-to-seconds (time-since emacs-load-start-time))))

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

;; my personal setup, other major-mode specific setup need it.
;; It's dependent on init-site-lisp.el
(if (file-exists-p "~/.custom.el") (load-file "~/.custom.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/Users/lhr/.emacs.d/.bookmarks.el")
 '(git-gutter:handled-backends (quote (svn hg git)))
 '(safe-local-variable-values (quote ((lentic-init . lentic-orgel-org-init))))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold))) t))

(setq gc-cons-threshold best-gc-cons-threshold)
;;; Local Variables:
;;; no-byte-compile: t
;;; End:
(put 'erase-buffer 'disabled nil)
