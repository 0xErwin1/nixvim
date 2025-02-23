{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    perlPackages.PerlTidy
  ];

  plugins = {
    lsp.servers.perlpls = {
      enable = true;
      settings = {
        perlcritic.enable = true;
        syntax.enable = true;
        singleFileSupport = true;
      };
    };

    conform-nvim = {
      settings.formatters_by_ft.perl = [ "perltidy" ];
    };
  };
}
