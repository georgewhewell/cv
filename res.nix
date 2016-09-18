{stdenv, fetchurl}:
stdenv.mkDerivation rec {
  version = "2.09";
  pname = "res";
  name = "${pname}-${version}";
  tlType = "run";
  src = fetchurl {
    url = "http://mirror.ox.ac.uk/sites/ctan.org/macros/latex/contrib/resume/res.cls";
    sha256 = "07gk74hvzpzf5n0cjw69pwmjn8fv39vfz2dzdsms06j867r4qp9n";
  };
  phases = ["installPhase"];
  installPhase = "
    mkdir -p $out/tex/latex/res
    cp $src $out/tex/latex/res/res.cls
  ";
}
