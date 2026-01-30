{ pkgs, ... }:
{
  imports = [ ./cmp.nix ];

  plugins = {
    fidget.enable = true;
    luasnip.enable = true;

    lsp = {
      enable = true;
      keymaps = {
        extra = [
          {
            key = "<leader>ca";
            action = "<cmd>FzfLua lsp_code_actions<CR>";
            mode = [ "n" "v" ];
            options = {
              desc = "Code actions";
              silent = true;
            };
          }
          {
            key = "<leader>cd";
            action = "<cmd>lua vim.diagnostic.open_float()<CR>";
            mode = [ "n" ];
            options.desc = "Line diagnostics";
          }
          {
            key = "<leader>cr";
            action = "<cmd>lua vim.lsp.buf.rename()<cr>";
            mode = [ "n" ];
            options.desc = "Rename";
          }
          {
            key = "<leader>dD";
            action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
            options.desc = "Next diagnostic";
          }
          {
            key = "<leader>dE";
            action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>";
            options.desc = "Next Error";
          }
          {
            key = "<leader>dW";
            action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>";
            options.desc = "Next Warning";
          }
          {
            key = "<leader>dd";
            action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
            options.desc = "Previous Diagnostic";
          }
          {
            key = "<leader>de";
            action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>";
            options.desc = "Previous Error";
          }
          {
            key = "<leader>dw";
            action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>";
            options.desc = "Previous Warning";
          }
          {
            key = "<leader>fr";
            action = "<cmd>FzfLua lsp_references<CR>";
            options.desc = "Find References";
          }
          {
            key = "<leader>fi";
            action = "<cmd>FzfLua lsp_implementations<CR>";
            options.desc = "Go to Implementation";
          }
          {
            key = "<leader>fs";
            action = "<cmd>FzfLua lsp_live_workspace_symbols<CR>";
            options.desc = "Workspace Symbols";
          }
          {
            key = "<leader>fD";
            action = "<cmd>FzfLua lsp_workspace_diagnostics<CR>";
            options.desc = "Workspace Diagnostics";
          }
          {
            key = "<leader>fd";
            action = "<cmd>FzfLua lsp_document_diagnostics<CR>";
            options.desc = "Document Diagnostics";
          }
        ];
        lspBuf = {
          gr = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      inlayHints = true;
    };

    none-ls = {
      enable = true;
      sources = {
        code_actions = {
          gitsigns.enable = true;
          gitrebase.enable = true;
          refactoring.enable = true;
        };
      };
    };
  };
}
