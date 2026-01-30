{
  keymaps = [
    # Smart j/k navigation with count
    {
      mode = "n";
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        expr = true;
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        expr = true;
        noremap = true;
        silent = true;
      };
    }

    # Quit
    {
      mode = [ "n" "v" ];
      key = "<C-q>";
      action = "<CMD>q<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Visual mode indentation
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Paste without yanking in visual mode
    {
      mode = "v";
      key = "p";
      action = "\"_dP";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Buffer navigation
    {
      mode = "n";
      key = "<S-h>";
      action = ":bprevious<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Previous buffer";
      };
    }
    {
      mode = "n";
      key = "<S-l>";
      action = ":bnext<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Next buffer";
      };
    }

    # Clear search highlight
    {
      mode = "n";
      key = "<ESC>";
      action = ":nohlsearch<Bar>:echo<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Window navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Fast scroll
    {
      mode = "n";
      key = "<M-j>";
      action = "10<C-e>";
      options.noremap = true;
    }
    {
      mode = "n";
      key = "<M-k>";
      action = "10<C-y>";
      options.noremap = true;
    }

    # Save
    {
      mode = [ "n" "v" ];
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "<C-S>";
      action = "<cmd>wa<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Close buffer
    {
      mode = [ "n" "v" "t" ];
      key = "<M-q>";
      action = "<cmd>bd<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Resize windows
    {
      mode = [ "n" "v" ];
      key = "<C-M-k>";
      action = "<cmd>resize -2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-M-j>";
      action = "<cmd>resize +2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-M-h>";
      action = "<cmd>vertical resize -2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-M-l>";
      action = "<cmd>vertical resize +2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Move lines in visual mode
    {
      mode = "x";
      key = "K";
      action = ":move '<-2<CR>gv-gv";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "x";
      key = "J";
      action = ":move '>+1<CR>gv-gv";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Split windows
    {
      mode = "n";
      key = "<S-M-v>";
      action = "<C-w>v";
      options = {
        noremap = true;
        silent = true;
        desc = "Vertical split";
      };
    }
    {
      mode = "n";
      key = "<S-M-h>";
      action = "<C-w>s";
      options = {
        noremap = true;
        silent = true;
        desc = "Horizontal split";
      };
    }
  ];
}
