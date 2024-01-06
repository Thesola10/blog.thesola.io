{ description = "My personal blog";

  inputs.nixpkgs.url = github:nixos/nixpkgs;
  inputs.pelicanTheme.url = github:thesola10/pelicantheme;
  inputs.pelicanTheme.flake = false;

  outputs = { self, nixpkgs, flake-utils, pelicanTheme, ... }:
  flake-utils.lib.eachDefaultSystem
    (system:
    let pkgs = import nixpkgs { inherit system; };
    in rec
    { packages.default = pkgs.callPackage ./. { inherit pelicanTheme; };
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [ darkhttpd ];

        inputsFrom = [ packages.default ];
      };
    }
    );
}
