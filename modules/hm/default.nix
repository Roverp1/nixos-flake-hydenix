{ ... }:

{
  imports = [
    # ./example.nix - add your modules here
  ];

  programs.git = {
    enable = true;
    userName = "Roverp";
    userEmail = "yar.zubaha@proton.me";
    
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # home-manager options go here
  home.packages = [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
  ];

  # hydenix home-manager options go here
  hydenix.hm = {
    enable = true;

    git.enable = false;
  };
  # Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
}
