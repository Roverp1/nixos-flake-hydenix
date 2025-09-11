{ config, pkgs, lib, ... }:

{
  imports = [
    # ./example.nix - add your modules here
  ];

  environment.systemPackages = with pkgs; [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
    spice
    spice-vdagent
  ];

  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;

  systemd.user.services.spice-vdagent = {
    description = "spice-vdagent user session agent";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.spice-vdagent}/bin/spice-vdagent -x";
      Restart = "on-failure";
      RestartSec = "5";
    };
  };
}
