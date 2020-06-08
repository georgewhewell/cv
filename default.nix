{ pkgs ? (import <nixpkgs> { })}:

with pkgs;

let
  resume = stdenv.mkDerivation rec {
    version = "2.09";
    pname = "res";
    name = "${pname}-${version}";
    tlType = "run";
    phases = [ "installPhase" ];
    src = fetchurl {
      url = "http://mirror.ox.ac.uk/sites/ctan.org/macros/latex/contrib/resume/res.cls";
      sha256 = "07gk74hvzpzf5n0cjw69pwmjn8fv39vfz2dzdsms06j867r4qp9n";
    };
    installPhase = "
      mkdir -p $out/tex/latex/res
      cp $src $out/tex/latex/res/res.cls
    ";
  };
in {
  george-cv = stdenv.mkDerivation {
    name = "george-whewell-cv";
    src = ./.;
    phases = [ "unpackPhase" "buildPhase" ];
    buildInputs = [
      (texlive.combine {
         inherit (texlive)
           datetime
           psnfss
           amsmath
           fmtcount
           hyperref
           url
           oberdiek
           metafont
           zapfding
           collection-xetex
           lm
           etoolbox
           hycolor
           atveryend
           xkeyval;
         resume.pkgs = [resume];
      })
    ];

    buildPhase = ''
      mkdir $out
      xelatex -output-directory=$out george_whewell_cv.tex
    '';

  };
}
