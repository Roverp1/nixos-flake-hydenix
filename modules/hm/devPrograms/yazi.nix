{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.roverp.programs.yazi;
in {
  options = {
    roverp.programs.yazi.enable = lib.mkOption {
      default = true;
      description = "Enable yazi module";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs;
      [
        file
        ffmpeg
        p7zip
        jq
        poppler
        fd
        ripgrep
        resvg
        imagemagick
        wl-clipboard
      ]
      ++ lib.optional config.roverp.programs.fzf.enable fzf
      ++ lib.optional config.roverp.shell.zoxide.enable zoxide;

    programs.yazi = {
      enable = true;
      package = pkgs.userPkgs.yazi;

      enableZshIntegration = true;
    };
  };
}
