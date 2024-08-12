{ pkgs, ... }:
{
  imports = [
    ./lualine.nix
    ./bufferline.nix
    ./treesitter.nix
    ./noice.nix
    ./notify.nix
    ./themes.nix
  ];

  extraPlugins = with pkgs.vimPlugins; [
    nvim-web-devicons
  ];

  extraConfigLua = ''
    require("nvim-web-devicons").setup({
      color_icons = true,
      override_by_extension = {
        ["ign"] = {
          icon = "󰈸",
          color = "#702963",
          name = "Ignis",
        },
        ["ion"] = {
          icon = "",
          color = "#702963",
          name = "Ion",
        }
      },
    })
  '';
}
