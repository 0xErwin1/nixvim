{
  plugins = {
    dressing = {
      enable = true;
    };

    copilot-lua = {
      enable = true;
      settings = {
        panel = {
          enabled = false;
          auto_refresh = true;
          keymap = {
            accept = "<CR>";
            next = "<M-]>";
            prev = "<M-[>";
            refresh = "<M-r>";
            jump_prev = "[[";
            jump_next = "]]";
            dismiss = "<C-]>";
          };
        };
        suggestion = {
          enabled = false;
          auto_trigger = true;
          keymap = {
            accept = "<M-l>";
            next = "<M-]>";
            prev = "<M-[>";
            dismiss = "<C-]>";
          };
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
        provider = "openai";
        auto_suggestions_provider = "openai";
        mode = "agentic";
        openai = {
          endpoint = "https://api.openai.com/v1";
          model = "gpt-4o-mini";
        };
        dual_boost = {
          enabled = true;
          provider = "openai";
          model = "gpt-4.1";
        };
        behaviour = {
          auto_suggestions = false;
          auto_set_highlight_group = true;
          auto_set_keymaps = true;
          auto_apply_diff_after_generation = false;
          support_paste_from_clipboard = false;
          minimize_diff = true;
        };
        windows = {
          position = "right";
          wrap = true;
          width = 50;
          sidebar_header = {
            enabled = true;
            align = "center";
            rounded = true;
          };
        };
        web_search_engine = {
          provider = "tavily";
          proxy = null;
        };
      };
    };
  };
}
