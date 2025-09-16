{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../default.nix
  ];

  services.qemuGuest.enable = true;
}
