{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkOption types optionalAttrs;

  cfg = config.roverp.stylix;
in {
  options.roverp.stylix = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = !config.hydenix.hm.theme.enable;
      description = "Enable stylix theming";
    };

    activeTheme = lib.mkOption {
      type = types.enum ["oxocarbon-dark"];
      default = "oxocarbon-dark";
      description = "Active theme name";
    };

    themes = mkOption {
      type = types.attrsOf (types.submodule {
        options = {
          base16Scheme = mkOption {
            type = types.nullOr (types.either types.path types.attrs);
            default = null;
            description = "Base16 color scheme";
          };

          wallpaper = mkOption {
            type = types.nullOr types.path;
            default = null;
            description = "Wallpaper path";
          };

          polarity = mkOption {
            type = types.nullOr (types.enum ["dark" "light"]);
            default = null;
            description = "Theme polarity for auto-generation";
          };
        };
      });

      default = {};
      description = "Available themes";
    };
  };

  config = lib.mkIf cfg.enable (
    let
      activeTheme = cfg.themes.${cfg.activeTheme};
    in {
      stylix =
        {
          enable = true;

          fonts = {
            monospace = {
              package = pkgs.nerd-fonts.jetbrains-mono;
              name = "JetBrainsMono NF Regular";
            };
          };
        }
        // (optionalAttrs (activeTheme.base16Scheme != null) {
          base16Scheme = activeTheme.base16Scheme;
        })
        // (optionalAttrs (activeTheme.wallpaper != null) {
          image = activeTheme.wallpaper;
        })
        // (optionalAttrs (activeTheme.polarity != null) {
          polarity = activeTheme.polarity;
        });
    }
  );
}
