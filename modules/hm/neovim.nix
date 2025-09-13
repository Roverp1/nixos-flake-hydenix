{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    extraLuaConfig = builtins.readFile ./../../Configs/.config/nvim/init.lua;

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
  };
}
