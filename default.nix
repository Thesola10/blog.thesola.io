{ pkgs ? import <nixpkgs> {}
, pelicanTheme ? fetchGit "https://github.com/thesola10/pelican-thesola.io"
}:

pkgs.stdenv.mkDerivation {
  name = "blog.thesola.io";
  dontInstall = true;
  src = ./.;

  nativeBuildInputs = with pkgs; [
    python3Packages.pelican
    python3Packages.markdown
  ];

  buildPhase = ''
    pelican $src/content -t ${pelicanTheme} -o $out -s $src/pelicanconf.py
  '';
}
