{
  config,
  lib,
  ...
}: let
  cfg = config.roverp.shell.ohMyPosh;
in {
  options = {
    roverp.shell.ohMyPosh.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable oh-my-posh module";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;

      enableZshIntegration = true;

      useTheme = "pure";
    };
  };
}
