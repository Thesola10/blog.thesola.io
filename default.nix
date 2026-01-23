{ pkgs ? import <nixpkgs> {}
, pelicanTheme ? fetchGit "https://github.com/thesola10/pelican-thesola.io"
, publish ? false
}:

let
  pelican-sitemap = with pkgs.python3Packages;
    buildPythonPackage rec {
      pname = "pelican_sitemap";
      version = "1.2.2";

      buildInputs = [
        pelican
      ];

      pyproject = true;
      build-system = [ pdm-backend ];

      src = fetchPypi
      { inherit pname version;
        sha256 = "sha256-k/ctA13Q7C9c7jiydmu9f2pUvxhmNa4SYaberEItz7c=";
      };

      doCheck = false;
    };

  pelican-alias = with pkgs.python3Packages;
    buildPythonPackage rec {
      pname = "pelican-alias";
      version = "1.1";

      buildInputs = [
        pelican
      ];

      pyproject = true;
      build-system = [ setuptools ];

      src = fetchPypi
      { inherit pname version;
        sha256 = "sha256-5UjIJFEnvVQNU9mxqVyPtpWBhPgZ0T+ZbyCPRfcjfE8=";
      };
    };

in pkgs.stdenv.mkDerivation {
  name = "blog.thesola.io";
  dontInstall = true;
  src = ./.;

  nativeBuildInputs = with pkgs.python3Packages; [
    pelican
    markdown
    pelican-sitemap
    pelican-alias
  ];

  buildPhase = ''
    pelican $src/content -t ${pelicanTheme} -o $out -s $src/${if publish then "publishconf.py" else "pelicanconf.py"}
  '';
}
