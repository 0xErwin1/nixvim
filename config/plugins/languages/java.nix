{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    jdk21
  ];

  plugins.lsp.servers.jdtls.enable = true;
}
