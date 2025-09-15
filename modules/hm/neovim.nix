{pkgs, ...}: {
  programs.neovim = let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      ripgrep
      fd

      lua-language-server
      nil
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
        plugin = pkgs.userPkgs.vimPlugins.blink-cmp;
        config = toLuaFile ./../../Configs/.config/nvim/lua/plugins/blink.lua;
      }

      {
        plugin = luasnip;
        config = toLuaFile ./../../Configs/.config/nvim/lua/plugins/luasnip.lua;
      }

      vim-tmux-navigator

      telescope-fzf-native-nvim

      nvim-web-devicons
      plenary-nvim
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./../../Configs/.config/nvim/init.lua}
      ${builtins.readFile ./../../Configs/.config/nvim/lua/config/keymaps.lua}
      ${builtins.readFile ./../../Configs/.config/nvim/lua/config/options.lua}
      ${builtins.readFile ./../../Configs/.config/nvim/lua/plugins/init.lua}
    '';
  };
}
