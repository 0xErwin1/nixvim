{
  # Brasa has no language server or formatter yet, so this module carries only
  # what an ftplugin would: `#` comments, and the two-space indentation the
  # language's own sources use. Comment.nvim reads its own filetype table, but
  # `commentstring` is what every other consumer looks at.
  extraFiles."ftplugin/brasa.lua".text = ''
    vim.bo.commentstring = "# %s"

    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.tabstop = 2
  '';
}
