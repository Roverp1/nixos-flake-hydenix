{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
    ];

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-nvim

      telescope-fzf-native-nvim

      nvim-web-devicons
      vim-tmux-navigator
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./../../Configs/.config/nvim/init.lua}
      ${builtins.readFile ./../../Configs/.config/nvim/lua/config/keymaps.lua}
      ${builtins.readFile ./../../Configs/.config/nvim/lua/config/options.lua}
      ${builtins.readFile ./../../Configs/.config/nvim/lua/plugins/init.lua}
    '';
  };
}
