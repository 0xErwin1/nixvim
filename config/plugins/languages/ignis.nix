{
  extraConfigLua = ''
    local lspconfig_util = require('lspconfig.util')

    require('lspconfig.configs').ignis = {
      default_config = {
        cmd = { "ignis", "lsp" },
        filetypes = { "ignis", "ign" },
        root_dir = lspconfig_util.root_pattern("ignis.toml", ".git"),
        settings = {},
      },
    }

    require('lspconfig').ignis.setup({})
  '';
}
