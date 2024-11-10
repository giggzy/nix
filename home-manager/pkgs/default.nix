# pkgs/default.nix
{ pkgs ? import <nixpkgs> { } }:

{
  zellij = pkgs.callPackage ./zellij.nix { };
}
