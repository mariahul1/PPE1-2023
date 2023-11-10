#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 candide_3.txt"
    exit 1
fi

input_fichier="$1"

resultat=$(cat "$input_fichier" | tr -s '[:space:]' '\n' | paste -d' ' - - | sort | uniq -c | sort -rn)

echo "$resultat"