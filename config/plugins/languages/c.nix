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
        c = [ "clang_format" ];
        cpp = [ "clang_format" ];
        cmake = [ "cmake_format" ];
        make = [ "cmake_format" ];
      };
    };

    lint = {
      lintersByFt = {
        make = [ "checkmake" ];
        cmake = [ "cmake_lint" ];
      };

      # cmake-lint ships with cmakelang (the cmake-format package) and is not a
      # built-in nvim-lint linter, so its diagnostic output is parsed manually.
      customLinters.cmake_lint = {
        cmd = "cmake-lint";
        stdin = false;
        args = [ ];
        stream = "stdout";
        ignore_exitcode = true;
        parser.__raw = ''
          require("lint.parser").from_pattern(
            "([^:]+):(%d+),(%d+): %[(%w+)%] (.+)",
            { "file", "lnum", "col", "code", "message" },
            nil,
            { source = "cmake-lint" }
          )
        '';
      };
    };
  };
}
