{ pkgs, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins.supermaven-nvim
  ];

  extraConfigLua = ''
    require("supermaven-nvim").setup({ })
  '';

  plugins = {
    dressing = {
      enable = true;
    };

    copilot-lua = {
      enable = false;
      settings = {
        panel.enabled = false;
        suggestion.enabled = false;
        filetypes = {
          "." = true;
          yaml = true;
          markdown = true;
          help = false;
          gitcommit = true;
          gitrebase = false;
          hgcommit = false;
          svn = false;
          cvs = false;
        };
      };
    };
  };
}
