{ pkgs, inputs, ... }:
{
  plugins.transparent.enable = true;

  colorschemes = {
    kanagawa = {
      enable = false;
      settings = {
        compile = true;
        undercurl = true;
        commentStyle = {
          italic = true;
        };
        functionStyle = {
          italic = true;
          bold = true;
        };
        keywordStyle = {
          italic = true;
        };
        statementStyle = {
          bold = true;
        };
        typeStyle = {
          italic = true;
          bold = true;
        };
        transparent = true;
        theme = "lotus";
      };
    };

    ayu = {
      enable = true;
      settings = {
        mirage = false;
      };
    };

    tokyonight = {
      enable = false;
      settings = {
        style = "storm";
        transparent = true;
      };
    };

    gruvbox = {
      enable = false;
      settings = {
        terminalColors = true;
        undercurl = true;
        underline = true;
        bold = true;
        italic = {
          strings = true;
          emphasis = true;
          comments = true;
          operators = false;
          folds = true;
        };
        strikethrough = true;
        invertSelection = false;
        invertSigns = false;
        invertTabline = false;
        invertIntend_guides = false;
        inverse = true;
      };
    };

  };
}
