{ pkgs, ... }:
{

  extraPackages = with pkgs; [
    clang
    clang-tools
    cmake
    cmake-format
    checkmake
    nasm
    gcc
    gdb
  ];

  keymaps = [
    {
      key = "<leader>Cb";
      action = "<cmd>CMakeBuild<cr>";
      mode = [
        "n"
        "v"
      ];
      options = {
        desc = "Build";
        silent = true;
      };
    }
    {
      key = "<leader>Cc";
      action = "<cmd>CMakeClean<cr>";
      mode = [
        "n"
        "v"
      ];
      options = {
        desc = "Clean";
        silent = true;
      };
    }
    {
      key = "<leader>Cf";
      action = "<cmd>CMakeGenerate<cr>";
      mode = [
        "n"
        "v"
      ];
      options = {
        desc = "Generate";
        silent = true;
      };
    }
  ];

  plugins = {
    lsp.servers.clangd.enable = true;
    cmake-tools = {
      enable = true;
      settings.cmake_build_directory = "build/\${variant:buildtype}";
    };

    conform-nvim = {
      settings.formatters_by_ft = {
        nasm = [ "asmfmt" ];
        asm = [ "asmfmt" ];
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        cmake = [ "cmake-format" ];
        make = [ "cmake-format" ];
      };
    };

    none-ls.sources.diagnostics = {
      checkmake.enable = true;
      cmake_lint.enable = true;
    };
  };
}
