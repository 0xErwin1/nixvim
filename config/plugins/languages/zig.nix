{
  plugins = {
    lsp.servers.zls.enable = false;

    conform-nvim = {
      settings.formatters_by_ft.zig = [ "zigfmt" ];
    };
  };
}
