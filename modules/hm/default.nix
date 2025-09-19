{pkgs, ...}: {
  imports = [
    ./devPrograms

    ./hyprland.nix
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

      # XDG Base Directories (redundant?)
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
      XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
      XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";

      ZDOTDIR = "${config.xdg.configHome}/zsh";

      # Development tools
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      GOPATH = "${config.xdg.dataHome}/go";
      GOBIN = "${config.xdg.dataHome}/go/bin";
      GOMODCACHE = "${config.xdg.cacheHome}/go/mod";
      NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";

      # Other programs
      LESSHISTFILE = "${config.xdg.cacheHome}/less_history";
      PYTHON_HISTORY = "${config.xdg.dataHome}/python/history";
      WGETRC = "${config.xdg.configHome}/wget/wgetrc";
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";

      # FZF configuration
      FZF_DEFAULT_OPTS = "--style minimal --color 16 --layout=reverse --height
30%";
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

  # hydenix home-manager options go here
  hydenix.hm = {
    enable = true;

    editors.default = "nvim";

    git.enable = false;
    firefox.enable = false;
    editors.neovim = false;
    terminals.enable = false;
    terminals.kitty.enable = false;
    shell.enable = false;

    theme = {
      active = "Another World";
      themes = ["AbyssGreen" "Another World" "BlueSky" "Cat Latte" "Oxo Carbon" "Vanta Black"];
    };
  };
}
