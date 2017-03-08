let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
  res.pkgs = [(pkgs.callPackage (import ./res.nix) {})];
  mytexlive = (pkgs.texlive.combine {
     inherit (pkgs.texlive)
     datetime
     psnfss
     amsmath
     fmtcount
     hyperref
     url
     oberdiek
     metafont
     zapfding
     collection-xetex;
     inherit res;
  });
in rec {
  cvEnv = stdenv.mkDerivation {
    name = "cvbuilder";
    buildInputs = [
        mytexlive
    ];
    shellHook = ''
      alias build="xelatex george_whewell_cv.tex"
    '';
  };
}
