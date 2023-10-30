#!/bin/bash

## Exercice1
## 1. Dans ce cas, c'est mieux d'utiliser la boucle while au lieu de la commande cat parce que la commande cat lit l'intégralité du fichier en mémoire en une seule fois, cela pourrait poser des problèmes si le fichier est trop grand pour tenir en mémoire pendant que la boucle while lit le fichier ligne par ligne.
## 2. En utilisant 'if' on vérifie si le fichie a une valeur et s'il existe, si la condition est remplie, on effectue la boucle while, sinon on s'arrête.

if [ ! -f "fr.txt" ]; then
    echo "Le fichier fr.txt n'existe pas.";
    exit 1
fi

ligne_numero=1

while read -r line;
do
    status_code=$(curl -s -I -o /dev/null -w "%{http_code}" "fr.txt")
    encodage=$(curl -s -I "fr.txt")
    encodage_site=$(echo "encodage" | grep -i "Content-Type")
	echo ${ligne_numero}    ${line}    ${status_code}   ${encodage_site};
    ligne_numero=$((ligne_numero + 1));
done < "fr.txt"
## 3. On ajoute 'ligne_numero=1', une variable pour compter les lignes. Après qu'on affiche une ligne avec la commande 'echo', on introduit la variable ligne_numero et on ajoute '1' pour passer au numéro de ligne suivant.

## Exercice2
## 1. On ajoute 'status_code' avec la commande 'curl' effectuer une requête HTTP vers l'URL.
