{
  plugins = {
    lsp.servers.pyright = {
      enable = true;
    };

    conform-nvim = {
      settings.formatters_by_ft.python = [
        "isort"
        "black"
      ];
    };
  };
}
