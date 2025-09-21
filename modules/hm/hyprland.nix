{...}: {
  hydenix.hm.hyprland = {
    extraConfig = builtins.readFile ./../../Configs/.config/hypr/general.conf;

    keybindings = {
      enable = true;
      overrideConfig = builtins.readFile ./../../Configs/.config/hypr/keybinds.conf;
    };

    windowrules = {
      overrideConfig = builtins.readFile ./../../Configs/.config/hypr/windowrules.conf;
    };

    animations = {
      preset = "minimal-2";
    };

    shaders.enable = false;
  };
}
