{
  config,
  lib,
  ...
}: let
  cfg = config.roverp.shell.zoxide;
in {
  options = {
    roverp.shell.zoxide.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.roverp.shell.zsh.enable;
      description = "Enable zoxide module";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;

      enableZshIntegration = config.roverp.shell.zsh.enable;

      options = ["--cmd cd"];
    };
  };
}
