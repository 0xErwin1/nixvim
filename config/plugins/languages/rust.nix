{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    rust-analyzer
    rustfmt
    lldb
  ];

  plugins = {
    rustaceanvim.enable = true;

    conform-nvim = {
      settings.formatters_by_ft = {
        rust = [ "rustfmt" ];
        toml = [ "rustfmt" ];
      };
    };
  };
}
