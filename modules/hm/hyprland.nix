{...}: {
  hydenix.hm.hyprland = {
    keybindings = {
      enable = true;
      extraConfig = ''
        ${builtins.readFile ./../../Configs/.config/hypr/unbinds.conf}
        ${builtins.readFile ./../../Configs/.config/hypr/keybinds.conf}
      '';
    };

    animations = {
      preset = "minimal-1";
    };

    shaders.enable = false;
  };
}
