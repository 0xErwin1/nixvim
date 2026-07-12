{ pkgs, ... }:
{
  extraPackages = [
    pkgs.stylua
    pkgs.selene
    pkgs.lua-language-server
    pkgs.lua5_4
  ];

  extraPlugins = with pkgs.vimPlugins; [
    neodev-nvim
    neoconf-nvim
  ];

  extraConfigLuaPre = ''
    require('neoconf').setup()
    require('neodev').setup()
  '';

  plugins = {
    lsp.servers.lua_ls.enable = true;
    lint.lintersByFt.lua = [ "selene" ];
  };
}
