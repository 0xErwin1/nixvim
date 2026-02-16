{
  description = "My nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Custom plugins
    plugin-treesitter = {
      url = "github:0xErwin1/nvim-treesitter";
      flake = false;
    };
    tree-sitter-ignis = {
      url = "github:Ignis-lang/tree-sitter-ignis";
      flake = false;
    };
    tree-sitter-ion = {
      url = "github:Ignis-lang/tree-sitter-ion";
      flake = false;
    };
    plugin-surround = {
      url = "github:ur4ltz/surround.nvim";
      flake = false;
    };
    plugin-tokyodark = {
      url = "github:tiagovla/tokyodark.nvim";
      flake = false;
    };
  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, system, ... }:
        let
          nixvim' = nixvim.legacyPackages.${system};

          mkNvim = module: nixvim'.makeNixvimWithModule {
            inherit pkgs;
            inherit module;
            extraSpecialArgs = {
              inherit inputs;
            };
          };

          basic = mkNvim (import ./config/basic.nix);
          work = mkNvim (import ./config/work.nix);
          personal = mkNvim (import ./config);

          # Wrapper that selects profile based on NVIM_PROFILE or directory rules
          nvim-context = pkgs.writeShellScriptBin "nvim" ''
            # Priority: NVIM_PROFILE env var > directory rules > default
            profile="''${NVIM_PROFILE:-}"

            if [ -z "$profile" ]; then
              cwd="$(pwd)"
              case "$cwd" in
                */work/*|*/.work/*|~/work/*)
                  profile="work"
                  ;;
                */personal/*|~/personal/*|~/dev/personal/*)
                  profile="personal"
                  ;;
                *)
                  profile="basic"
                  ;;
              esac
            fi

            case "$profile" in
              work)
                exec ${work}/bin/nvim "$@"
                ;;
              personal)
                exec ${personal}/bin/nvim "$@"
                ;;
              *)
                exec ${basic}/bin/nvim "$@"
                ;;
            esac
          '';
        in
        {
          packages = {
            default = nvim-context;
            inherit basic work personal;
            nvim-context = nvim-context;
          };
        };

      flake = {
        # Home Manager module
        homeManagerModules.default = { config, lib, pkgs, ... }:
          let
            cfg = config.programs.nixvim-context;
          in
          {
            options.programs.nixvim-context = {
              enable = lib.mkEnableOption "nixvim with context-aware profile selection";

              defaultProfile = lib.mkOption {
                type = lib.types.enum [ "basic" "work" "personal" ];
                default = "basic";
                description = "Default profile when no context is detected";
              };

              workDirs = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = [ "~/work" "~/.work" ];
                description = "Directories that trigger 'work' profile";
              };

              personalDirs = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = [ "~/personal" "~/dev/personal" ];
                description = "Directories that trigger 'personal' profile";
              };
            };

            config = lib.mkIf cfg.enable {
              home.packages = [
                # This needs to be overridden in the actual home-manager config
                # since we can't access perSystem packages from here directly
              ];
            };
          };
      };
    };
}
