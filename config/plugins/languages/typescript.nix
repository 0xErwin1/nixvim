{ pkgs, lib, ... }:
let
  formatters = lib.nixvim.mkRaw ''
    function(bufnr)
      if require("conform").get_formatter_info("biome", bufnr).available then
        return {
          "biome",
          timeout_ms = 2000,
          stop_after_first = true,
        }
      else
        return {
          "prettierd",
          "prettier",
          timeout_ms = 2000,
          stop_after_first = true,
        }
      end
    end
  '';
in
{
  extraPackages = with pkgs; [
    prettierd
    eslint_d
    biome
  ];

  plugins = {
    lsp.servers = {
      ts_ls.enable = true;
      biome.enable = true;
      astro.enable = true;
    };

    conform-nvim = {
      settings.formatters_by_ft = {
        javascript = formatters;
        typescript = formatters;
        astro = formatters;
        vue = formatters;
      };
    };
  };
}
