{pkgs, ...}: {
  imports = [
    # ./example.nix - add your modules here
    ./hyprland.nix
    ./neovim.nix
    ./zen-browser.nix
  ];

  # home-manager options go here
  home.packages = with pkgs; [
    userPkgs.yazi
    userPkgs.opencode

    file
    ffmpeg
    p7zip
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    resvg
    imagemagick
    wl-clipboard
  ];

  programs = {
    git = {
      enable = true;
      userName = "Roverp";
      userEmail = "yar.zubaha@proton.me";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    opencode = {
      enable = true;
      package = pkgs.userPkgs.opencode;

      # might be proble because of schema declaration duplication
      settings = builtins.fromJSON (builtins.readFile ./../../Configs/.config/opencode/opencode.json);
    };
  };

  # hydenix home-manager options go here
  hydenix.hm = {
    enable = true;

    git.enable = false;
    firefox.enable = false;
    editors.neovim = false;
    editors.default = "nvim";

    theme = {
      active = "AbyssGreen";
      themes = ["AbyssGreen" "AncientAliens" "Another World" "BlueSky" "Cat Latte" "Decay Green" "Ever Blushing" "Greenify" "Oxo Carbon" "Peace Of Mind" "Vanta Black"];
    };
  };
}
