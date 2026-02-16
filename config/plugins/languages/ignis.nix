{
  extraConfigLua = ''
    local lspconfig_util = require('lspconfig.util')
    local ignisCommand = vim.env.IGNIS_LSP_PATH

    if ignisCommand == nil or ignisCommand == "" then
      ignisCommand = vim.fn.exepath("ignis")
    end

    if ignisCommand == nil or ignisCommand == "" then
      vim.notify(
        "ignis command not found in PATH. Install ignis or set IGNIS_LSP_PATH",
        vim.log.levels.ERROR
      )
      return
    end

    require('lspconfig.configs').ignis = {
      default_config = {
        cmd = { ignisCommand, "lsp" },
        filetypes = { "ignis", "ign" },
        root_dir = lspconfig_util.root_pattern("ignis.toml", ".git"),
        settings = {},
      },
    }

    require('lspconfig').ignis.setup({})
  '';
}
