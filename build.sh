#!/bin/bash

docker run -v $PWD:/cv nixos/nix /bin/sh -c "nix-channel --update && cd /cv && nix-shell --command \"xelatex george_whewell_cv.tex\""
