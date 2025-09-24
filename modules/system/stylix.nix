{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) optionalAttrs;

  selectTheme = "rebecca";

  themes = import ./themes/default.nix {inherit pkgs;};
  theme = themes.${selectTheme};
in {
  stylix = {
    enable = true;

    base16Scheme = theme.base16Scheme;
    # image = theme.wallpaper;
    # polarity = theme.polarity;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NF Regular";
      };
    };
  };
}
