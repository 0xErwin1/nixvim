{
  plugins.toggleterm = {
    enable = true;

    settings = {
      winbar.enabled = false;
      size = 20;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>t";
      action = "<cmd>ToggleTerm<cr>";
    }
  ];
}
