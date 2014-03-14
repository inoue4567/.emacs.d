(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/twittering-mode-3.0.0")
(add-to-list 'load-path "~/.emacs.d/auto-install")

(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

(require 'open-junk-file)
(require 'twittering-mode)
(setq twittering-timer-interval 300)

(setq eshell-cmpl-ignore-case t)

(when (eq window-system 'ns)

;  (load-theme 'wombat t)

  (load-theme 'molokai t)
;  (enable-theme 'molokai)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  
;;  Monaco 12pt をデフォルトにする
  (set-face-attribute 'default nil
		      :family "Andale mono"
		      :height 150)
;;日本語をヒラギノ角ゴProNにする
  (set-fontset-font "fontset-default"
		    'japanese-jisx0208
		    '("Hiragino Mincho ProN"))
;;半角カナをヒラギノ角ゴProNにする
  (set-fontset-font "fontset-default"
		    'katakana-jisx0201
		    '("Hiragino Maru Gothic ProN"))
  ;;for Japanese
  (set-language-environment 'Japanese)
  (set-default-coding-systems 'utf-8-unix)
  (set-terminal-coding-system 'utf-8-unix)
  (set-keyboard-coding-system 'sjis-mac)
  (set-clipboard-coding-system 'sjis-mac)
  (setq-default buffer-file-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (add-to-list 'default-frame-alist '(font . "fontset-default"))

  )




					;(require 'anything-startup)
(require 'auto-install)
(require 'twit)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)
;;(auto-install-compatibility-setup)             ; 互換性確保

(setq open-junk-file-format "~/program/junk/%Y/%m/%Y-%m-%d-%H%M%S.")
(global-set-key (kbd "C-x j") 'open-junk-file)

(defun baz nil
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key [backtab] 'execute-extended-command)
(global-set-key (kbd "C-a") 'beginning-of-line)
(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)

(define-key minibuffer-local-map (kbd "C-t") 'previous-history-element)
(define-key minibuffer-local-map (kbd "C-h") 'next-history-element)

(define-key shell-mode-map (kbd "C-S-t") 'comint-previous-input)
(define-key shell-mode-map (kbd "C-S-h") 'comint-next-input)




(global-unset-key [tab])
(global-unset-key (kbd "M-c"))
(global-unset-key (kbd "C-x C-f"))
(global-set-key (kbd "C-b") 'delete-backward-char)
(global-set-key "\C-z" nil)
(global-set-key [f2] 'foo)
(global-set-key [f3] 'other-window)
(global-set-key [f6] 'shell)
(global-set-key [f9] 'save-buffer)
(global-set-key [f4] 'baz)
(global-set-key [tab] 'execute-extended-command)
(global-set-key [left] 'backward-char)
(global-set-key [right] 'forward-char)
(global-set-key (kbd "S-<left>") 'backward-kill-word)
(global-set-key [up] 'previous-line)
(global-set-key [down] 'next-line)


(global-set-key (kbd "C-r") 'delete-char)
(global-set-key (kbd "C-S-r") 'kill-word)
(global-set-key (kbd "C-d") 'backward-char)
(global-set-key (kbd "C-S-d") 'backward-word)
(global-set-key (kbd "C-h") 'next-line)
(global-set-key (kbd "C-t") 'previous-line)
(global-set-key (kbd "C-n") 'forward-char)
(global-set-key (kbd "M-o") 'find-file)
(global-set-key (kbd "C-S-d") 'backward-word)
(global-set-key (kbd "C-S-n") 'forward-word)
(global-unset-key (kbd "C-S-h"))
(global-unset-key (kbd "C-S-t"))
(global-set-key (kbd "M-o") 'find-file)


;;(global-set-key (kbd "C-N") 'forward-word)

(global-set-key (kbd "C-S-w") 'save-buffers-kill-terminal)
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-_"))
(global-unset-key (kbd "C-p"))
(global-unset-key (kbd "C-f"))


(defalias 'dk 'describe-key)
(defalias 'ir 'indent-region)


					;(aset keyboard-translate-table ?\<tab> ?\M-x)
					;(if window-system
					;  )

(setq scroll-step 1)
(setq inhibit-startup-message t)
 

;;
;; YaTeX
;;

(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
		("\\.ltx$" . yatex-mode)
		("\\.cls$" . yatex-mode)
		("\\.sty$" . yatex-mode)
		("\\.clo$" . yatex-mode)
		("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
					;(setq YaTeX-dvi2-command-ext-alist nil)
(setq YaTeX-dvi2-command-ext-alist
      '(("Preview\\|TeXShop\\|TeXworks\\|Skim\\|mupdf\\|xpdf\\|Firefox\\|Adobe" . ".pdf")))
(setq tex-command "/usr/texbin/platex -synctex=1")
(setq dviprint-command-format "dvpd.sh %s")
					;(setq dviprint-command-format "dvipdfmx %s")
(setq dvi2-command "open -a Preview")
					;(setq tex-command "/usr/texbin/ptex2pdf -l -ot '-synctex=1'")
					;(setq tex-command "/usr/texbin/ptex2pdf -l -u -ot '-synctex=1'")
					;(setq tex-command "/usr/texbin/pdflatex -synctex=1")
					;(setq tex-command "/usr/texbin/lualatex -synctex=1")
					;(setq tex-command "/usr/texbin/luajitlatex -synctex=1")
					;(setq tex-command "/usr/texbin/xelatex -synctex=1")
					;(setq tex-command "/usr/texbin/latexmk")
					;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/platex %O -synctex=1 %S/' -e '$bibtex=q/pbibtex %O %B/' -e '$makeindex=q/mendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
					;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/platex %O -synctex=1 %S/' -e '$bibtex=q/pbibtex %O %B/' -e '$makeindex=q/mendex %O -o %D %S/' -e '$dvips=q/dvips %O -z -f %S | convbkmk -g > %D/' -e '$ps2pdf=q/ps2pdf %O %S %D/' -norc -gg -pdfps")
					;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$makeindex=q/mendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
					;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$makeindex=q/mendex %O -o %D %S/' -e '$dvips=q/dvips %O -z -f %S | convbkmk -u > %D/' -e '$ps2pdf=q/ps2pdf %O %S %D/' -norc -gg -pdfps")
					;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/pdflatex %O -synctex=1 %S/' -e '$bibtex=q/bibtex %O %B/' -e '$makeindex=q/makeindex %O -o %D %S/' -norc -gg -pdf")
					;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/lualatex %O -synctex=1 %S/' -e '$bibtex=q/bibtexu %O %B/' -e '$makeindex=q/texindy %O -o %D %S/' -norc -gg -lualatex")
					;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/luajitlatex %O -synctex=1 %S/' -e '$bibtex=q/bibtexu %O %B/' -e '$makeindex=q/texindy %O -o %D %S/' -norc -gg -lualatex")
					;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/xelatex %O -synctex=1 %S/' -e '$bibtex=q/bibtexu %O %B/' -e '$makeindex=q/texindy %O -o %D %S/' -norc -gg -xelatex")
(setq bibtex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/upbibtex")
			   ((string-match "platex" tex-command) "/usr/texbin/pbibtex")
			   ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/bibtexu")
			   ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/bibtex")
			   (t "/usr/texbin/pbibtex")))
(setq makeindex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/mendex")
			      ((string-match "platex" tex-command) "/usr/texbin/mendex")
			      ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/texindy")
			      ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/makeindex")
			      (t "/usr/texbin/mendex")))
(setq dvi2-command "/usr/bin/open -a Preview")
					;(setq dvi2-command "/usr/bin/open -a Skim")
					;(setq dvi2-command "/usr/bin/open -a TeXShop")
					;(setq dvi2-command "/usr/bin/open -a TeXworks")
					;(setq dvi2-command "/usr/bin/open -a Firefox")
					;(setq dviprint-command-format "/usr/bin/open -a \"Adobe Reader\" `echo %s | sed -e \"s/\\.[^.]*$/\\.pdf/\"`")

(defun skim-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process  
      "displayline"
      nil
      "/Applications/Skim.app/Contents/SharedSupport/displayline"
      (number-to-string (save-restriction
			  (widen)
			  (count-lines (point-min) (point))))
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
					     (save-excursion
					       (YaTeX-visit-main t)
					       buffer-file-name)))
	       ".pdf"))
      buffer-file-name))))

(add-hook 'yatex-mode-hook
	  '(lambda ()
	     (define-key YaTeX-mode-map (kbd "C-c s") 'skim-forward-search)))

(add-hook 'yatex-mode-hook
	  '(lambda ()
	     (auto-fill-mode -1)))

;;
;; RefTeX with YaTeX
;;
					;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
	  '(lambda ()
	     (reftex-mode 1)
	     (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
	     (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))



(defun foo nil
  (interactive)
  (buffer-menu-other-window)
  (other-window 0))

(add-to-list 'load-path "~/.emacs.d/elisp/")

(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
(global-font-lock-mode 1)
(setq default-frame-alist (append '(
					;  (foreground-color . "gray")  ;
					;  (background-color . "black") ;
					;  (cursor-color     . "blue")  ;
				    )
				  default-frame-alist))

;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; rubydb
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)


;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)

;; ミニバッファに表示し, かつ, オーバレイする.
(setq ruby-block-highlight-toggle t)

(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

(require 'smart-compile)
(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))

(require 'linum)
(global-linum-mode)

