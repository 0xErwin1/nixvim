{
  plugins = {
    lz-n = {
      enable = true;
    };
    toggleterm = {
      enable = true;

      settings = {
        winbar.enabled = false;
        size = 20;
      };
      lazyLoad = {
        settings = {
          cmd = "ToggleTerm";
          keys = [
            "<M-t>"
          ];
        };
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "t"
      ];
      key = "<M-t>";
      action = "<cmd>ToggleTerm<cr>";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<M-q>";
      action = "<cmd>q!<cr>";
    }
  ];
}
