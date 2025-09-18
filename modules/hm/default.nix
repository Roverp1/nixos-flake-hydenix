{pkgs, ...}: {
  imports = [
    ./devPrograms

    ./hyprland.nix
    ./neovim.nix
    ./zen-browser.nix
    ./kitty.nix
  ];

  # home-manager options go here
  home.packages = with pkgs; [
    userPkgs.opencode
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

    editors.default = "nvim";

    git.enable = false;
    firefox.enable = false;
    editors.neovim = false;
    terminals.enable = false;
    terminals.kitty.enable = false;

    theme = {
      active = "Another World";
      themes = ["AbyssGreen" "Another World" "BlueSky" "Cat Latte" "Oxo Carbon" "Vanta Black"];
    };
  };
}
