#!/bin/bash

## Exercice1
## 1. Dans ce cas, c'est mieux d'utiliser la boucle while au lieu de la commande cat parce que la commande cat lit l'intégralité du fichier en mémoire en une seule fois, cela pourrait poser des problèmes si le fichier est trop grand pour tenir en mémoire pendant que la boucle while lit le fichier ligne par ligne.
## 2. En utilisant 'if' on vérifie si le fichie a une valeur et s'il existe, si la condition est remplie, on effectue la boucle while, sinon on s'arrête.

if [[ $# -ne 1 ]];
then
	echo "On veut exactement un argument au script."
	exit
fi

URLS=$1

if [ ! -f $URLS ]
then
	echo "On attend un fichier, pas un dossier"
	exit
fi

lineno=1
while read -r URL
do
	response=$(curl -s -I -L -w "%{http_code}" -o /dev/null $URL)
	encoding=$(curl -s -I -L -w "%{content_type}" -o /dev/null $URL | grep -P -o "charset=\S+" | cut -d"=" -f2 | tail -n 1)
	echo -e "$lineno\t$URL\t$response\t$encoding"
	lineno=$(expr $lineno + 1)
done < "$URLS"
## 3. On ajoute 'ligne_numero=1', une variable pour compter les lignes. Après qu'on affiche une ligne avec la commande 'echo', on introduit la variable ligne_numero et on ajoute '1' pour passer au numéro de ligne suivant.

## Exercice2
## 1. On ajoute 'status_code' avec la commande 'curl' effectuer une requête HTTP vers l'URL.
