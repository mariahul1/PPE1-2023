#!/bin/bash
bash ex1_5_exsupplementaires_HUL.sh candide_3.txt

if [ "$#" -lt 1 ]||[ "$#" -gt 2 ]; then
    echo "Usage: $0 candide_3.txt [nombre_de_mots]"
    exit 1
fi


fichier_3="$1"

nombre_de_mots=${2:-25}

resultat=$(cat "$fichier_3" | tr ' ' '\n' | sort | uniq -c | sort -rn)
echo "Les $nombre_de_mots mots les plus fréquents dans le fichier $fichier_3 sont :"
echo "$resultat" | head -n "$nombre_de_mots"

echo "Si le nombre de mots n'est pas spécifié, les 25 mots les plus fréquents seront affichés par défaut :"
echo "$resultat" | head -n 25