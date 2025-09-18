{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.roverp.programs.opencode;
in {
  options = {
    roverp.programs.opencode.enable = lib.mkOption {
      default = true;
      description = "Enable opencode module";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.opencode = {
      enable = true;
      package = pkgs.userPkgs.opencode;

      # might be problem because of schema declaration duplication
      settings = builtins.fromJSON (builtins.readFile ./../../../Configs/.config/opencode/opencode.json);
    };
  };
}
