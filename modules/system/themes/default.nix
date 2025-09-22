{pkgs, ...}: {
  roverp.stylix.themes = {
    oxocarbon-dark = {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/oxocarbon-dark.yaml";
      wallpaper = ./wallpapers/apcolyplse-neon-forest.png;
    };
  };
}
