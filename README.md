# Dmytro's NixOS ISO

A NixOS ISO image with my SSH public keys. Using this ISO allowes me to boot a
computer (or a VM) and ssh into it right away without first setting up a user
password and running `ssh-copy-id`.

## Usage

Build the image:
```
nix build .#install-iso
```

Serve the image so that it could be downloaded (e.g. by Proxmox):
```
nix-shell -p python3 --command 'python3 -m http.server --directory result/iso'
```
