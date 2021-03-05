;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


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

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)
