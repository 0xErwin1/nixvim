{ pkgs, ... }:
{
  plugins.lz-n.enable = true;

  imports = [
    ./ui
    ./lsp
    ./tools
  ];

  performance.byteCompileLua.enable = true;
  editorconfig.enable = true;
  luaLoader.enable = true;
  extraPlugins = [ pkgs.vimPlugins.plenary-nvim ];
}
