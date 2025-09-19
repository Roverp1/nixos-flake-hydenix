{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.roverp.programs.zsh;
in {
  options = {
    roverp.programs.zsh.enable = lib.mkOption {
      default = true;
      description = "Enable zsh module";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      plugins = with pkgs; [
        {
          name = zsh-syntax-highlighting.pname;
          src = zsh-syntax-highlighting.src;
        }
      ];

      initContent = let
        zshConfig = lib.mkOrder 1000 (builtins.readFile ./../../../Configs/.config/zsh/.zshrc);
      in
        lib.mkMerge [zshConfig];
    };
  };
}
