{
  plugins.codesnap = {
    enable = true;
    autoLoad = false;
    lazyLoad = {
      settings = {
        cmd = "CodeSnapHighlight";
        keys = [
          {
            __unkeyed-1 = "<leader>sc";
            __unkeyed-3 = "<CMD>CodeSnapHighlight<CR>";
            desc = "Take a code snapshot and copy to clipboard";
            mode = "v";
          }
          {
            __unkeyed-1 = "<leader>ss";
            __unkeyed-3 = "<CMD>CodeSnapSaveHighlight<CR>";
            desc = "Take a code snapshot and save to file";
            mode = "v";
          }
        ];
      };
    };
    settings = {
      breadcrumbs_separator = "/";
      has_breadcrumbs = true;
      has_line_number = true;
      mac_window_bar = false;
      save_path = "~/Pictures/Screenshots/";
      bg_padding = 0;
    };
  };
}
