{ pkgs ? import <nixpkgs> {}
}:

pkgs.rstudioWrapper.override {
  packages = with pkgs.rPackages; [ bslib dplyr ggplot2 partitions shiny ];
}
