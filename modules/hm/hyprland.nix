{...}: {
  hydenix.hm.hyprland = {
    keybindings = {
      enable = true;
      overrideConfig = ''
        ${builtins.readFile ./../../Configs/.config/hypr/keybinds.conf}
      '';
    };

    animations = {
      preset = "minimal-2";
    };

    shaders.enable = false;
  };
}
