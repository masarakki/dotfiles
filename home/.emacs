(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setenv "GOROOT" "/home/masaki/go")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(el-get 'sync '(mmm-mode
                markdown-mode gh gist git-gutter git-blame magit
                Enhanced-Ruby-Mode ruby-end rails-el rhtml-mode ri yard-mode
                flymake flymake-cursor flymake-extension flymake-html-validator
                flymake-ruby flymake-coffee flymake-haml flymake-css flymake-sass flymake-shell
                coffee-mode haml-mode slim-mode sass-mode scss-mode yaml-mode less-css-mode review-mode
                js2-mode scala-mode2 clojure-mode json-mode llvm-mode
                rust-mode
                php-mode-improved smarty-mode
                go-mode go-projectile go-test go-flymake go-imports go-lint
                nginx-mode elunit cmake-mode))

(custom-set-variables
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces )

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4 indent-tabs-mode nil)
(setq js2-basic-offset 2)

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.d?tpl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
(add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))
(setq ruby-indent-level 2)
(setq coffee-tab-width 2)
(setq javascript-tab-width 2)
(setq ruby-indent-tabs-mode nil)
(setq ruby-deep-indent-paren '(t))

(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook (lambda () (set-buffer-file-coding-system 'unix)))

(setq interprogram-paste-function
      (lambda ()
        (shell-command-to-string "xsel -b -o")))
(setq interprogram-cut-function
      (lambda (text &optional rest)
        (let* ((process-connection-type nil)
               (proc (start-process "xsel" "*Massages*" "xsel" "-b" "-i")))
          (process-send-string proc text)
          (process-send-eof proc))))

(defun make-file-executable ()
  "Make the file of this buffer executable"
  (save-restriction
    (widen)
    (if (string= "#!" (buffer-substring-no-properties 1 (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))

(add-hook 'after-save-hook 'make-file-executable)
(setq vc-follow-symlinks t)
(setq auto-revert-check-vc-info t)
(menu-bar-mode 0)
(defalias 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)
(setq kill-whole-line t)
(global-set-key "\C-h" 'delete-backward-char)
(custom-set-faces
 '(flymake-errline ((((class color)) (:background "red" :foreground "white") )))
 '(flymake-warnline ((((class color)) (:background "gray")))))

(add-hook 'before-save-hook 'gofmt-before-save)
;(setq flymake-coffee-coffeelint-configuration-file "~/config/coffeelint.json")
