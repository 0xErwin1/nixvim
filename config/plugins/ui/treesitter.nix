{ pkgs, inputs, ... }:
let
  treesitter-ignis-grammar = pkgs.tree-sitter.buildGrammar {
    language = "ignis";
    version = "0.2.4";
    src = inputs.tree-sitter-ignis;
  };

  # The grammar repository also carries `queries/brasa/`, which buildGrammar
  # copies into the derivation, so the highlight, indent, fold and locals
  # queries arrive with the parser instead of needing a separate plugin.
  treesitter-brasa-grammar = pkgs.tree-sitter.buildGrammar {
    language = "brasa";
    version = "0.1.0";
    src = inputs.tree-sitter-brasa;
  };
in
{
  extraPlugins = [
    treesitter-ignis-grammar
    treesitter-brasa-grammar
  ];

  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;
    nixGrammars = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
      treesitter-ignis-grammar
      treesitter-brasa-grammar
    ];
    settings = {
      # In Nix, grammars are pre-compiled via grammarPackages
      auto_install = false;
    };
    languageRegister = {
      ignis = [
        "ignis"
        "ign"
      ];
      brasa = [
        "brasa"
      ];
    };
  };
}
