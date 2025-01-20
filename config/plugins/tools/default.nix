{
  imports = [
    ./ai.nix
    ./autopairs.nix
    ./comment.nix
    ./conform.nix
    ./dap.nix
    ./escape.nix
    ./fzf-lua.nix
    ./git.nix
    ./glow.nix
    ./hover.nix
    ./neoscroll.nix
    ./oil.nix
    ./outline.nix
    ./request.nix
    ./surround.nix
    ./telescope.nix
    ./terminal.nix
    ./which-key.nix
    ./obsidian.nix
  ];

  plugins = {
    hex.enable = true;
  };
}
