{
  plugins.obsidian = {
    enable = true;
    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      workspaces = [
        {
          name = "personal";
          path = "~/.tabularium/";
        }
        {
          name = "work";
          path = "~/.officium/";
        }
      ];
    };
  };
}
