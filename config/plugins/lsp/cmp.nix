{ pkgs, ... }:
{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "enter";
        "<C-j>" = [ "select_next" "fallback" ];
        "<C-k>" = [ "select_prev" "fallback" ];
        "<Tab>" = [ "select_next" "fallback" ];
        "<S-Tab>" = [ "select_prev" "fallback" ];
        "<CR>" = [ "accept" "fallback" ];
        "<C-Space>" = [ "show" "show_documentation" "hide_documentation" ];
        "<C-e>" = [ "hide" "fallback" ];
        "<C-u>" = [ "scroll_documentation_up" "fallback" ];
        "<C-d>" = [ "scroll_documentation_down" "fallback" ];
        "<C-b>" = [ "scroll_documentation_up" "fallback" ];
        "<C-f>" = [ "scroll_documentation_down" "fallback" ];
      };

      appearance = {
        nerd_font_variant = "mono";
        kind_icons = {
          Supermaven = " ";
          Copilot = " ";
          Array = "󰕤 ";
          Boolean = " ";
          Class = " ";
          Color = " ";
          Constant = " ";
          Constructor = " ";
          Enum = " ";
          EnumMember = " ";
          Event = "󱐋";
          Field = " ";
          File = " ";
          Folder = " ";
          Function = "󰘧";
          Interface = " ";
          Key = " ";
          Keyword = " ";
          Method = " ";
          Module = " ";
          Namespace = " ";
          Null = "󰟢";
          Number = " ";
          Object = " ";
          Operator = " ";
          Package = " ";
          Property = "󱕴";
          Reference = " ";
          Snippet = " ";
          String = "󰅳 ";
          Struct = " ";
          Text = "󰦪";
          TypeParameter = "󰡱 ";
          Unit = " ";
          Value = " ";
          Variable = "󰫧 ";
          Macro = "󱃖 ";
        };
      };

      completion = {
        menu = {
          border = "rounded";
          scrollbar = true;
          draw = {
            treesitter = [ "lsp" ];
            columns = [
              { __unkeyed-1 = "kind_icon"; }
              { __unkeyed-1 = "label"; __unkeyed-2 = "label_description"; gap = 1; }
              { __unkeyed-1 = "kind"; }
            ];
          };
        };
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 100;
          window.border = "rounded";
        };
        ghost_text.enabled = true;
      };

      fuzzy.implementation = "lua";

      sources.default = [ "lsp" "path" "snippets" "buffer" ];

      signature = {
        enabled = true;
        window.show_documentation = true;
      };
    };
  };
}
