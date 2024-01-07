{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs
    , nixos-generators
    , ...
    }: {
      packages.x86_64-linux = {
        install-iso = nixos-generators.nixosGenerate {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
          ];
          format = "install-iso";
        };
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.pkgs.alejandra;
    };
}
