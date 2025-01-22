{
  plugins = {
    lsp.servers.zls.enable = true;

    conform-nvim = {
      settings.formatters_by_ft.zig = [ "zigfmt" ];
    };
  };
}
