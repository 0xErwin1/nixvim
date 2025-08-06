{
  imports = [
    ./ai.nix
    ./autopairs.nix
    ./comment.nix
    ./conform.nix
    ./escape.nix
    ./fzf-lua.nix
    ./git.nix
    ./hover.nix
    ./neoscroll.nix
    ./oil.nix
    ./request.nix
    ./surround.nix
    ./snapshots.nix
    ./telescope.nix
    ./terminal.nix
    ./trouble.nix
    ./which-key.nix
  ];

  plugins = {
    hex.enable = true;
  };
}
