{
  plugins = {
    lsp.servers.gopls.enable = true;

    conform-nvim = {
      settings.formatters_by_ft = {
        go = [ "gofmt" ];
      };
    };

    none-ls = {
      sources = {
        diagnostics.golangci_lint.enable = true;
      };
    };
  };
}
