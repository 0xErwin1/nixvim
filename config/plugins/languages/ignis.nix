{
  extraConfigLua = ''
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

    vim.lsp.config("ignis", {
      cmd = { ignisCommand, "lsp" },
      filetypes = { "ignis", "ign" },
      root_markers = { "ignis.toml", ".git" },
      settings = {},
    })

    vim.lsp.enable("ignis")
  '';
}
