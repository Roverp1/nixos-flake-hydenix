{
  config,
  lib,
  ...
}: let
  cfg = config.roverp.programs.fzf;
in {
  options = {
    roverp.programs.fzf.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.roverp.shell.zsh.enable;
      description = "Enable fzf module";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;

      enableZshIntegration = config.roverp.shell.zsh.enable;
    };
  };
}
