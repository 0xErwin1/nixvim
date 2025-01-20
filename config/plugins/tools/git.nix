{ pkgs, ... }:
{
  extraPackages = [
    pkgs.git
  ];

  plugins = {
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        signs = {
          add = {
            text = " ";
          };
          change = {
            text = " ";
          };
          delete = {
            text = " ";
          };
          untracked = {
            text = "";
          };
          topdelete = {
            text = "󱂥 ";
          };
          changedelete = {
            text = "󱂧 ";
          };
        };
      };
      lazyLoad = {
        settings = {
          cmd = "Neogit";
          keys = [
            "<leader>gg"
          ];
          options = {
            desc = "Open Neogit";
            silent = true;
            nowait = true;
          };
        };
      };
    };

    neogit = {
      enable = true;
      settings.integrations.diffview = true;
    };
    diffview.enable = true;
  };
}
