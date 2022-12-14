{
  nixpkgs  ? null
, compiler ? "ghc822"
}:

let

  nixpkgs1 =
    if nixpkgs == null
      then let
             bootstrap = import <nixpkgs> { };
             location = builtins.fromJSON (builtins.readFile ./nixpkgs.json);
             src = bootstrap.fetchFromGitHub {
               owner = "NixOS";
               repo  = "nixpkgs";
               inherit (location) rev sha256;
             };
           in
            import src
      else nixpkgs;

  pkgs = nixpkgs1 { };

  hleap = ((import ./release.nix) {nixpkgs = nixpkgs1; compiler = compiler;}).hleap;

  haskellPackages = pkgs.haskell.packages."${compiler}";

in

  pkgs.lib.overrideDerivation hleap.env (old: {
    buildInputs = old.buildInputs ++ [
      haskellPackages.cabal-install
    # haskellPackages.ghc-mod
      haskellPackages.ghcid
    # haskellPackages.hasktags
      haskellPackages.hdevtools
      haskellPackages.hindent
      haskellPackages.hlint
      haskellPackages.pointfree
      haskellPackages.pointful
    ];
})
