#!/bin/bash

EXECUTAVEIS=("autodocker" "bower" "composer" "dep" "node" "php" "phpunit" "phpcs" "phpmd" "phpcbf");

PATHS=("/usr/bin" "/usr/bin" "/usr/local/bin" "/usr/local/bin" "/usr/bin" "/usr/bin" "/usr/local/bin" "/usr/local/bin" "/usr/local/bin" "/usr/local/bin");

PATHBINS=$PWD/bin

for i in 0 1 2 3 4 5 6 7 8 9
do
    cp "$PATHBINS/${EXECUTAVEIS[$i]}.sh"  "${PATHS[$i]}/${EXECUTAVEIS[$i]}"
    chmod +x "$PATHBINS/${EXECUTAVEIS[$i]}.sh"  "${PATHS[$i]}/${EXECUTAVEIS[$i]}"
done