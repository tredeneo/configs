;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;;; ativar preenchimento para arquivos c(sem projeto)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)
;;configuração para o clangd
(after! lsp-mode
  (setq lsp-clients-clangd-args '(
                                "--clang-tidy"
                                "--suggest-missing-includes"
                                "--compile_args_from=filesystem"
                                "--compile-commands-dir=/home/tredeneo/.config/"
                                "--completion-style=detailed"
                                "--fallback-style=microsoft"
                                "--header-insertion=iwyu"))
  (setq lsp-rust-server 'rust-analyzer
        lsp-rust-analyzer-server-display-inlay-hints t)
  (setq lsp-ui-doc-enable t
        lsp-ui-imenu-auto-refresh t ))
;;erro na linah lateral
;(setq lsp-ui-sideline-show-diagnostics 't)
;(setq lsp-ui-sideline-show-hover t)
;atualizar menu
;(setq lsp-ui-imenu-auto-refresh t)
;;diretorio do flutter
;(setq lsp-dart-sdk-dir "/usr/lib/dart/bin")
(setq lsp-dart-flutter-sdk-dir "~/snap/flutter/common/flutter")

;;erros na margem a esquerda
(add-hook 'flycheck-mode-hook
              #'(lambda () (flycheck-set-indication-mode 'left-margin)))

;;config rust
;;user rls sobre rust-analyzer
;(after! rustic
 ; (setq rustic-lsp-server 'rls))
(global-set-key (kbd "C-x q") 'kill-this-buffer)
(global-set-key (kbd "C-x l") 'next-buffer )
(global-set-key (kbd "C-x h") 'revious-buffer )
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-fon (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
