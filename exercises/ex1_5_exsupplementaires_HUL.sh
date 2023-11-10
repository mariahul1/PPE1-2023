#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 candide.txt"
    exit 1
fi

input_file="$1"

if [ ! -f candide.txt ]; then
    echo "Le fichier input_file n'existe pas."
    exit 1
fi

tr -d '[:punct:]' < $input_file > candide_2.txt
tr '[:upper:]' '[:lower:]' < candide_2.txt > candide_3.txt

echo "Le traitement a été effectué. Le résultat est enregistré dans candide_3.txt."


rm candide_2.txt
