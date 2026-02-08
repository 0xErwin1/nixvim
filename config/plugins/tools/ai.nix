{ pkgs, ... }:
{
  extraPackages = [
    pkgs.python312Packages.uv
  ];

  opts.autoread = true;

  plugins = {
    opencode = {
      enable = true;
      settings = {
        provider = {
          enabled = "terminal";
        };
      };
    };
  };

  keymaps = [
    {
      mode = [ "n" "x" ];
      key = "<leader>oa";
      action.__raw = ''function() require("opencode").ask("@this: ") end'';
      options.desc = "Ask opencode";
    }
    {
      mode = [ "n" "x" ];
      key = "<leader>os";
      action.__raw = ''function() require("opencode").select() end'';
      options.desc = "Select opencode action";
    }
    {
      mode = [ "n" "t" ];
      key = "<leader>ot";
      action.__raw = ''function() require("opencode").toggle() end'';
      options.desc = "Toggle opencode";
    }
    {
      mode = [ "n" "x" ];
      key = "<leader>oo";
      action.__raw = ''function() return require("opencode").operator("@this ") end'';
      options = {
        desc = "Send to opencode";
        expr = true;
      };
    }
  ];
}
