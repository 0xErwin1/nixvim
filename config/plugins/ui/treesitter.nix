{ pkgs, inputs, ... }:
let
  treesitter-ignis-grammar = pkgs.tree-sitter.buildGrammar {
    language = "ignis";
    version = "0.2.4";
    src = inputs.tree-sitter-ignis;
  };
in
{
  extraPlugins = [
    treesitter-ignis-grammar
  ];

  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;
    nixGrammars = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
      treesitter-ignis-grammar
    ];
    settings = {
      # In Nix, grammars are pre-compiled via grammarPackages
      auto_install = false;
      highlight = {
        additional_vim_regex_highlighting = true;
        enable = true;
      };
      indent.enable = true;
    };
    languageRegister = {
      ignis = [
        "ignis"
        "ign"
      ];
    };
  };
}
