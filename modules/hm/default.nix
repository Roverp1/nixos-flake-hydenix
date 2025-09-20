{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./devPrograms

    ./hyprland.nix
    ./xdg.nix
    ./neovim.nix
    ./zen-browser.nix
    # ./kitty.nix
  ];

  # home-manager options go here
  home = {
    packages = with pkgs; [
      # --- packages ---
    ];

    sessionVariables = {
      # Default programs
      EDITOR = "nvim";
      BROWSER = "zen";
    };
  };

  programs = {
    git = {
      enable = true;
      userName = "Roverp";
      userEmail = "yar.zubaha@proton.me";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };

  roverp.shell.zsh.enable = false;

  # hydenix home-manager options go here
  hydenix.hm = {
    enable = true;

    editors.default = "nvim";

    git.enable = false;
    firefox.enable = false;
    editors.neovim = false;
    terminals.enable = false;
    terminals.kitty.enable = false;
    # shell.enable = false;
    xdg.enable = false;

    theme = {
      active = "Another World";
      themes = ["AbyssGreen" "Another World" "BlueSky" "Cat Latte" "Oxo Carbon" "Vanta Black"];
    };
  };
}
