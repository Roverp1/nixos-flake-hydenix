{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../configuration.nix
  ];

  serices.xserver = {
    resolutionAuto = false;
    virtualScreen = "1920x1080";
  };

  services.qemuGuest.enable = true;
}
