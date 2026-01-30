{ pkgs, ... }:
{
  plugins.lz-n.enable = true;

  imports = [
    ./ui
    ./lsp
    ./tools
  ];

  editorconfig.enable = true;
  luaLoader.enable = true;
  extraPlugins = [ pkgs.vimPlugins.plenary-nvim ];
}
