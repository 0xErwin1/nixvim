{ pkgs, ... }:
let
  defaultFormatters = [
    "squeeze_blanks"
    "trim_whitespace"
    "trim_newlines"
  ];
  jsFormatters = [
    "biome"
    "prettierd"
    "prettier"
  ];
in
{
  extraPackages = with pkgs; [
    prettierd
    jq
    stylua
    shellcheck
    shfmt
    nixfmt
    black
    isort
    biome
    clang-tools
  ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        "_" = defaultFormatters;
        ignis = defaultFormatters;

        # Lua
        lua = [ "stylua" ];

        # Nix
        nix = [ "nixfmt" ];

        # JSON/Markdown
        json = [ "prettierd" "jq" ];
        markdown = [ "prettierd" ];

        # Python
        python = [ "isort" "black" ];

        # Rust/TOML
        rust = [ "rustfmt" ];
        toml = [ "rustfmt" ];

        # Zig
        zig = [ "zigfmt" ];

        # C/C++
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        cmake = [ "cmake-format" ];

        # Shell
        bash = [ "shfmt" ];
        sh = [ "shfmt" ];
        shell = [ "shfmt" ];

        # JavaScript/TypeScript (definidos en typescript.nix con logica inteligente)
        javascriptreact = jsFormatters;
        typescriptreact = jsFormatters;
      };

      formatters = {
        biome = {
          condition.__raw = ''
            require("conform.util").root_file({
              "biome.json",
              "biome.jsonc",
              "biome.config.js",
              "biome.config.cjs",
              "biome.config.mjs",
              "biome.config.ts",
              "biome.config.cts",
              "biome.config.mts",
            })
          '';
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<CR>";
      options.desc = "Format code";
    }
  ];
}
