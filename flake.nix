{
  description = "Build my cv";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        tex = pkgs.texlive.combined.scheme-full;
      in {
        devShells.default = nixpkgs.mkShell {
          buildInputs = [ tex nixpkgs.gnumake ];
        };

        packages.default = pkgs.writeShellScriptBin "build" ''
          #!/bin/sh
          export PATH=${tex}/bin:$PATH
          make
        '';

        apps.default = flake-utils.lib.mkApp {
          drv = self.packages.${system}.default;
        };
      }
    );
}
