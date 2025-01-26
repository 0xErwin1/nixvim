{
  plugins = {
    trouble = {
      enable = true;
      autoLoad = true;
      lazyLoad = {
        enable = true;
        settings = {
          cmd = "Trouble";
          keys = [
            {
              __unkeyed-1 = "<leader>dl";
              __unkeyed-3 = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
              desc = "Buffer Diagnostics (Trouble)";
            }
          ];
        };
      };
    };
  };
}
