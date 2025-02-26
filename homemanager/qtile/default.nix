{pkgs, ...}:
{
  home.packages = with pkgs;[
    mypy
    python3Packages.pip
    python3Packages.qtile
    python3Packages.pycparser
  ];
}
