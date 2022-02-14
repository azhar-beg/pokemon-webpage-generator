#! /bin/bash

cd src/scripts ; source generate_site.sh ; cd ../..

arrange_sources src/images src/styles.css html

main src/data/pokemon.csv

open html/all.html