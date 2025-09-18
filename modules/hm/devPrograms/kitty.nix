{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.roverp.programs.kitty;
in {
  options = {
    roverp.programs.kitty.enable = lib.mkOption {
      default = true;
      description = "Enable kitty module";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kitty
    ];

    home.file = {
      ".config/kitty/kitty.conf" = {
        source = ./../../../Configs/.config/kitty/kitty.conf;
        force = true;
      };
    };
  };
}
