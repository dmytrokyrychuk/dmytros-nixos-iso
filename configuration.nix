{ pkgs
, ...
}:
let
  dmytrokyrychukKeys =
    let
      content = pkgs.fetchurl {
        url = "https://github.com/dmytrokyrychuk.keys";
        sha256 = "sha256-D45/lJ76om8VioV7uyCl19JbbArkqXCztyDLNlfW52g=";
      };
    in
    pkgs.lib.splitString "\n" (builtins.readFile content);
in
{
  # Mainly needed to see the VM IP in Proxmox VM summary page.
  services.qemuGuest.enable = true;

  # Allow passwordless ssh access during installation from my machines.
  users.users.root.openssh.authorizedKeys.keys = dmytrokyrychukKeys;
  users.users.nixos.openssh.authorizedKeys.keys = dmytrokyrychukKeys;
}
