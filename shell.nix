with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ 
    python3Packages.qtile 
    python3Packages.dbus-python
  ];
}
