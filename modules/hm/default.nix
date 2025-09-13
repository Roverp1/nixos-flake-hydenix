{pkgs, ...}: {
  imports = [
    # ./example.nix - add your modules here
    ./hyprland.nix
    ./neovim.nix
    ./zen-browser.nix
  ];

  # home-manager options go here
  home.packages = with pkgs; [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version

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

    git.enable = false;
    firefox.enable = false;
    editors.neovim = false;
    editors.default = "nvim";
  };
  # Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
}
