{ pkgs, mcphub, ... }:
{
  extraPackages = [
    pkgs.python312Packages.uv
  ];

  extraPlugins = [
    mcphub
  ];

  extraConfigLua = ''
    require("mcphub").setup({
      extensions = {
        avante = {
          make_slash_commands = true,
          enabled = true,
        }
      }
    })
  '';

  plugins = {
    dressing = {
      enable = true;
    };

    copilot-lua = {
      enable = true;
      settings = {
        panel = {
          enabled = false;
        };
        suggestion = {
          enabled = false;
        };
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

    avante = {
      enable = true;
      settings = {
        provider = "copilot";
        mode = "agentic";
        system_prompt = ''
          function()
            local hub = require("mcphub").get_hub_instance()
            return hub and hub:get_active_servers_prompt() or ""
          end
        '';
        behaviour = {
          auto_suggestions = false;
          auto_set_highlight_group = true;
          auto_set_keymaps = true;
          auto_apply_diff_after_generation = false;
          support_paste_from_clipboard = false;
          minimize_diff = true;
          enable_token_counting = true;
        };
        # custom_tools = ''
        #   function()
        #     return {
        #       require("mcphub.extensions.avante").mcp_tool(),
        #     }
        #   end
        # '';
        disabled_tools = [
          "list_files"
          "search_files"
          "read_file"
          "create_file"
          "rename_file"
          "delete_file"
          "create_dir"
          "rename_dir"
          "delete_dir"
          "bash"
        ];
      };
    };
  };
}
