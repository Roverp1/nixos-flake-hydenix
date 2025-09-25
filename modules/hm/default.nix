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
      # important?
      # Essential Qt theming (if you use Qt apps)
      # libsForQt5.qt5ct
      # libsForQt5.qtstyleplugin-kvantum
      # kdePackages.qt6ct
      #
      # # Essential for GTK apps
      gsettings-desktop-schemas
      gnome-settings-daemon
      #
      # # Icon fallbacks
      adwaita-icon-theme
      kdePackages.breeze-icons
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

  stylix = {
    targets = {
      # qt.enable = false;
      # gtk.enable = false;
      # vscode.enable = false;
      # xresources.enable = false;

      zen-browser.profileNames = ["default"];
    };
  };

  # hydenix home-manager options go here
  hydenix.hm = {
    enable = true;

    editors = {
      default = "nvim";
      vscode.enable = false;
    };

    git.enable = false;
    firefox.enable = false;
    editors.neovim = false;
    terminals.enable = false;
    terminals.kitty.enable = false;
    shell.enable = !config.roverp.shell.zsh.enable;
    xdg.enable = false;
    gtk.enable = false;
    qt.enable = false;

    theme = {
      enable = false;
      active = "Another World";
      themes = ["AbyssGreen" "Another World" "BlueSky" "Cat Latte" "Oxo Carbon" "Vanta Black"];
    };
  };
}
