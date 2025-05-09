{
  plugins.which-key = {
    enable = true;

    settings = {
      preset = "helix";

      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffer";
        }
        {
          __unkeyed-1 = "<leader>g";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "Diagnostic";
        }
        {
          __unkeyed-1 = "<leader>D";
          group = "Debug";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Find";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Code";
        }
        {
          __unkeyed-1 = "<leader>C";
          group = "Compile";
          icon = " ";
        }
        {
          __unkeyed-1 = "<M-t>";
          group = "Terminal";
        }
        {
          __unkeyed-1 = "<leader>r";
          group = "Request";
          icon = " ";
        }
      ];
    };
  };
}
