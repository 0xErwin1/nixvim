{ pkgs, ... }:
{
  extraPackages = [ pkgs.statix ];

  plugins = {
    lsp = {
      servers = {
        nixd.enable = true;
      };
    };

    lint.lintersByFt.nix = [ "statix" ];
  };
}
