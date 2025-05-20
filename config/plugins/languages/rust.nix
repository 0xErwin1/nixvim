{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    rust-analyzer
    rustfmt
    lldb
    rustup
  ];

  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        server = {
          extraEnv = {
            CARGO_TARGET_DIR = "target/analyzer";
          };
          checkOnSave = true;
          check = {
            command = "clippy";
            extraArgs = [ "--all" "--all-targets" ];
          };
        };
        inlayHints = {
          enable = true;
          typeHints = true;
          parameterHints = true;
          chainingHints = true;
        };
        hover = {
          actions = {
            enable = true;
            debug = true;
            run = true;
          };
        };
        lens = {
          enable = true;
          implementations = true;
          references = true;
          run = true;
          debug = true;
        };
      };
    };

    conform-nvim = {
      settings.formatters_by_ft = {
        rust = [ "rustfmt" ];
        toml = [ "rustfmt" ];
      };
    };
  };
}
