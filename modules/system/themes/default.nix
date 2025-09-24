{pkgs, ...}: let
  themePath = themeName: "${pkgs.base16-schemes}/share/themes/${themeName}.yaml";
in {
  oxocarbon-dark = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/oxocarbon-dark.yaml";
    wallpaper = ./wallpapers/apcolyplse-neon-forest.png;
  };

  ayu-dark = {
    base16Scheme = themePath "ayu-dark";
  };

  gruvbox-dark-hard = {
    base16Scheme = themePath "gruvbox-dark-hard";
  };

  rebecca = {
    base16Scheme = themePath "rebecca";
  };
}
