# Journal de Maria  
## Séance du 20 septembre

Nouvelle définitions : 
- Arborescence - une structure hiérarchique utilisée pour organiser des données, des fichiers ou des éléments de manière ordonnée et structurée 
- Chemin absolu - une référence à un emplacement spécifique dans un système de fichiers qui commence à partir de la racine du système de fichiers 
- Chemin relatif - st une référence à un emplacement dans un système de fichiers qui est basée sur la position actuelle de l'utilisateur ou du programme

Nouvelle commandes : 
- cd - change directory
- cp - copy
- mv - move
- rm - remove
- mkdir - make directory

## Séance du 27 septembre

Nouvelles commandes :
- git add - utilisée pour préparer des modifications de fichiers pour la prochaine validation (commit)
- git commit - utilisée pour créer un instantané (commit) des modifications qui ont été ajoutées avec git add.
- git push - utilisé pour envoyer les commits locaux vers un dépôt distant(GitHub) 
- git log - affiche l'historique des commits dans un dépôt

## Séance du 4 octobre

Nouvelles commandes :
- git reset HEAD - utilisée pour retirer des fichiers de la zone de staging area après les avoir ajoutés avec git add
- git reset --soft HEAD - annule le dernier commit tout en conservant les modifications dans la zone de préparation
- git reset - réinitialise l'index à un commit spécifique tout en conservant les modifications locales dans vos fichiers de travail
- git reset --hard - réinitialise l'index, le répertoire de travail et votre copie locale des fichiers à un commit spécifique

## Séance du 11 octobre

Nouvelles informations :
- Il y a une nouvelle espace pour ajouter des devoirs sur Moodle de Sorbonne Nouvelle 
- Espace Issues - l'outil de communication sur GitHub

Nouvelles commandes :
- git tag -a - utilisée pour ajouter des tags
- stdin - l'entrée standard
- stdout - la sortie standard
- sterr - la sortie d'erreurs standard 

## Séance du 18 octobre

Conditions possibles :
- -f fichier - vrai si le fichier existe
- -d dossier - vrai si le dossier existe
- -s fichier - vrai si le fichier existe et n'est pas vide

Les boucles FOR et WHILE :
- FOR :
    for ELEMENT in a b c
    do
        echo "message"
    done
- WHILE :
    while [condition];
    do  
        echo "message";
    done
    
## Séance du 25 octobre

- Le mini projet (à faire)
	- Contenu instructions sur le mini-projet : 
	début de la chaîne de traitement à effectuer en groupe 
	- Ressources : 
	slides : 05-miniprojet.pdf 
	- script de base et fichier d'URL exercices : 
	exercices 1 et 2 dans les slides (lecture du fichier d'URL, récupération des codes HTTP et de l'encodage de la page)

- Les étapes :
	- lecture des fichiers de données en entrée + nom du fichier en sortie
	- (pour chacun des fichiers) lecture du fichier ligne à ligne


## Séance du 7 novembre

- Le mini projet (solution du devoir):
    #!/usr/bin/env bash 
	URLS=$1
	
	lineno=1
	while read -r URL;
	do 
		response=$(curl -s -I -w "%{http_code}"-o $URL) 
		echo -e "$lineno\t$URL\t$response"
		lineno=$(expr $lineno + 1)
	done < $URL 

Le reste se trouve sur GitHub. 

Nouvelles commandes :
- grep -o '\w*' - affiche tous les mots d'un fichier ligne par ligne

HTML:
3 types des balises:
- Ouvrantes <balise>
- Fermantes </balise>
- Autofermantes ou vides <balise/>

Les attributs d'une balise sont des valeurs renseignés sur la balise ouvrante ou autofermante.

Les tableaux en HTML - commandes :
- table : la balise racine du tableau
- tr : table row, une ligne
- th : table header, une cellule d'en-tête
- td : table data, une cellule classique

## Séance du 15 novembre

Les commandes importantes utilisées dans le devoir :
- tr -d '[:punct:]' - supprime la ponctuation du fichier texte
- tr '[:upper:]' '[:lower:]' - affiche tous les caractères en majuscules ou minuscules 
- tr ' ' '\n' - remplace toutes les occurrences de l'espace (' ') par des caractères de saut de ligne ('\n') dans l'entrée.
- tr -s '[:space:]' '\n' - transforme une séquence de caractères d'espacement (tels que l'espace et la tabulation) en un seul caractère de saut de ligne. 

Nouvelles commandes : 
- <nom du fichier> sort | uniq -c | sort -nr | less
- <nom du fichier> sort | uniq -c | sort -nr | head -n 4
- [[ "$TOPN" =~ ^0*[1-9][0-9]*$ ]]
- echo 'abc' | tr 'ab' 'de' >>> dec 

## Séance du 22 novembre

Projet en groupe : lancement du travail
