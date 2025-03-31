# shell.nix

{ pkgs ? import <nixpkgs> {} 

}:

let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-24.11.tar.gz") {};
in pkgs.mkShell {

  packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here
      # collections # collections is base library so already exists
      # itertools   # itertools is base library so already exists
      # math        # math is base library so already exists  
      matplotlib
      numpy
      pandas
    ]))
    
    (pkgs.rstudioWrapper.override {
      packages = with pkgs.rPackages; [
      # bslib
      comprehenr
      partitions
      # rstudio doesnt need to be be here because rstudio is in the wrapper
      shiny
      ];
    })
  
  ];
  

    
  GREETING = "Hello this environment has Python and R!";
  
  shellHook = ''
  echo $GREETING
  '';

}

# this should work in NixOS but there are janky grpahics driveres issues on ubuntu 
# could be a fix for ubuntu at https://github.com/numtide/nix-gl-host

