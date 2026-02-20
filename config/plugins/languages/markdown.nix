{ pkgs, ... }:
let
  lazyLoad = {
    enable = true;
    settings = {
      ft = "markdown";
    };
  };
in
{
  extraPackages = [
    pkgs.python312Packages.pylatexenc
  ];

  plugins = {
    render-markdown = {
      enable = true;
      autoLoad = true;
      inherit lazyLoad;
      settings = {
        latex = {
          enabled = false;
        };
        checkbox = {
          enabled = true;
          custom = {
            started = {
              raw = "[>]";
              rendered = "";
              highlight = "RenderMarkdownTableHead";
            };
            deleted = {
              raw = "[~]";
              rendered = "";
              highlight = "RenderMarkdownError";
            };
            waiting = {
              raw = "[@]";
              rendered = "󰥔 ";
              highlight = "RenderMarkdownInfo";
            };
          };
        };
      };
    };
    lsp.servers.ltex = {
      enable = true;

      settings = {
        enabled = [
          "latex"
          "tex"
          "bib"
          "markdown"
          "gitcommit"
          "text"
          "org"
          "norg"
        ];
        language = "auto";
        dictionary = {
          "es" = [ ":/home/iperez/.config/nvim/dict/es" ];
        };
      };
    };

    none-ls.sources.diagnostics.markdownlint.enable = true;

    obsidian = {
      enable = false;
      settings = {
        completion = {
          min_chars = 2;
          nvim_cmp = true;
        };
        workspaces = [
          {
            name = "personal";
            path = "~/.tabularium/";
          }
          {
            name = "work";
            path = "~/.officium/";
          }
        ];
      };
    };
  };
}
