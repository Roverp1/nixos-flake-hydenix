{
  config,
  lib,
  ...
}: let
  cfg = config.roverp.shell.ohMyPosh;
in {
  options = {
    roverp.shell.ohMyPosh.enable = lib.mkOption {
      default = config.roverp.shell.zsh.enable;
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
