{ pkgs, inputs, ... }:
let
  treesitter-ignis-grammar = pkgs.tree-sitter.buildGrammar {
    language = "ignis";
    version = "0.2.4";
    src = inputs.tree-sitter-ignis;
  };
  treesitter-ion-grammar = pkgs.tree-sitter.buildGrammar {
    language = "ion";
    version = "0.1.0";
    src = inputs.tree-sitter-ion;
  };
in
{
  extraPlugins = [
    treesitter-ignis-grammar
    treesitter-ion-grammar
  ];

  plugins.treesitter = {
    enable = true;
    nixGrammars = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
      treesitter-ignis-grammar
      treesitter-ion-grammar
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
  };

  # Register filetypes for custom grammars
  # Grammars are already installed via grammarPackages
  extraConfigLua = ''
    vim.treesitter.language.register('ignis', { 'ignis', 'ign' })
    vim.treesitter.language.register('ion', { 'ion' })
  '';
}
