{pkgs, ...}: {
  programs.neovim = let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";

    userPlugins = pkgs.userPkgs.vimPlugins;
  in {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      pkgs.userPkgs.yazi

      gcc
      nodejs

      ripgrep
      fd

      lua-language-server
      nixd

      stylua
      alejandra
      prettierd
      gotools
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = telescope-nvim;
        config = toLua "require(\"telescope\").setup()";
      }

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./../../Configs/.config/nvim/lua/plugins/lspconfig.lua;
      }

      {
        plugin = userPlugins.blink-cmp;
        config = toLuaFile ./../../Configs/.config/nvim/lua/plugins/blink.lua;
      }

      {
        plugin = luasnip;
        config = toLuaFile ./../../Configs/.config/nvim/lua/plugins/luasnip.lua;
      }

      {
        plugin = conform-nvim;
        config = toLuaFile ./../../Configs/.config/nvim/lua/plugins/conform.lua;
      }

      {
        plugin = yazi-nvim;
        config = toLuaFile ./../../Configs/.config/nvim/lua/plugins/yazi.lua;
      }

      vim-tmux-navigator

      telescope-fzf-native-nvim

      nvim-web-devicons
      plenary-nvim

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-lua
        ]);
        config = toLuaFile ./../../Configs/.config/nvim/lua/plugins/treesitter.lua;
      }
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./../../Configs/.config/nvim/init.lua}
      ${builtins.readFile ./../../Configs/.config/nvim/lua/config/keymaps.lua}
      ${builtins.readFile ./../../Configs/.config/nvim/lua/config/options.lua}
      ${builtins.readFile ./../../Configs/.config/nvim/lua/plugins/init.lua}
    '';
  };
}
