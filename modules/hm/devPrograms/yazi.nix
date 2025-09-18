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
    home.packages = with pkgs; [
      file
      ffmpeg
      p7zip
      jq
      poppler
      fd
      ripgrep
      fzf
      zoxide
      resvg
      imagemagick
      wl-clipboard
    ];

    programs.yazi = {
      enable = true;
      package = pkgs.userPkgs.yazi;
    };
  };
}
