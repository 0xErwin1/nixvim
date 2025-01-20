{
  pkgs,
  ...
}:
{
  extraPackages = [
    pkgs.fd
    pkgs.ripgrep
  ];
  plugins.telescope = {
    enable = false;
    settings.defaults = {
      width = 0.85;
      prompt_position = "top";
      preview_cutoff = 120;
      horizontal = {
        mirror = false;
      };
      vertical = {
        mirror = false;
      };
    };
    extensions = {
      fzf-native.enable = true;
    };
  };
}
