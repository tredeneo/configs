{ ... }:
{

  programs.helix =
    {
      enable = true;
      settings = {
        theme = "onedark";
        editor = {
          line-number = "relative";
          cursor-shape = {
            insert = "bar";
            select = "underline";
          };
          lsp = {
            display-messages = true;
          };

        };
      };

      languages =
        [{
          name = "python";
          scope = "source.python";
          injection-regex = "python";
          file-types = [ "py" ];
          shebangs = [ "python" ];
          roots = [ ];
          comment-token = "#";
          language-server = { command = "pylsp"; };

          config = {
            plugins = {
              flake8 = {
                enabled = false;
              };
            };
            configurationSources = [ "flake8" ];
            # plugins={rope_completion={eager=true}}
            # TODO: pyls needs utf-8 offsets
            indent = { tab-width = 4; unit = "    "; };
          };
        }
          {
            name = "rust";
            scope = "source.rust";
            injection-regex = "rust";
            file-types = [ "rs" ];
            roots = [ ];
            auto-format = true;
            comment-token = "//";
            language-server = { command = "rust-analyzer"; };
            indent = { tab-width = 4; unit = "    "; };
            config = {
              cargo = { loadOutDirsFromCheck = true; };
              procMacro = { enable = false; };
              diagnostics = { disabled = [ "unresolved-proc-macro" ]; };
              inlayHints = { parameterHints = true; typeHints = true; };
            };
          }
        {
          name= "lua";
          auto-format = true;
        }
        ];
    };

}
