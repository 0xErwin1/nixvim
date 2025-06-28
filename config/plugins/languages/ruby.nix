{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    rubocop
    ruby
    ruby-lsp
  ];

  plugins = {
    lsp.servers.ruby_lsp.enable = true;
    none-ls.sources.diagnostics = {
      rubocop.enable = true;
    };

    conform-nvim = {
      settings.formatters_by_ft = {
        ruby = [
          "rubocop"
        ];
      };
    };
  };
}
