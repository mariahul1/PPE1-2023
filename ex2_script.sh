import csv
from collections import defaultdict

# Définir le fichier de données
fichier_données = 'votre_fichier_de_données.csv'  # Remplacez par le nom de votre fichier

# Créer un dictionnaire pour compter les lieux
lieux_count = defaultdict(int)

# Lire le fichier de données
with open(fichier_données, 'r', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    
    for row in reader:
        lieu = row['Lieu']  # Remplacez 'Lieu' par le nom de la colonne correspondant au lieu dans votre fichier
        lieux_count[lieu] += 1

# Trier les lieux par nombre de citations
lieux_sorted = sorted(lieux_count.items(), key=lambda x: x[1], reverse=True)

# Afficher le classement des lieux
print("Classement des lieux les plus cités :")
for i, (lieu, count) in enumerate(lieux_sorted, start=1):
    print(f"{i}. {lieu}: {count} citations")


    ##################

    import csv
from collections import defaultdict
import argparse

# Fonction pour établir le classement des lieux les plus cités
def classement_lieux(fichier_données, année, mois, top_n):
    lieux_count = defaultdict(int)

    with open(fichier_données, 'r', newline='') as csvfile:
        reader = csv.DictReader(csvfile)

        for row in reader:
            date = row['Date']  # Colonne contenant la date
            lieu = row['Lieu']  # Colonne contenant le lieu

            # Vous pouvez adapter cette condition pour filtrer par année et mois
            if date.startswith(f"{année}-{mois}"):
                lieux_count[lieu] += 1

    lieux_sorted = sorted(lieux_count.items(), key=lambda x: x[1], reverse=True)
    
    print(f"Classement des {top_n} lieux les plus cités en {mois}-{année}:")
    for i, (lieu, count) in enumerate(lieux_sorted[:top_n], start=1):
        print(f"{i}. {lieu}: {count} citations")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Classement des lieux les plus cités")
    parser.add_argument("fichier_données", type=str, help="Fichier de données (CSV)")
    parser.add_argument("année", type=str, help="Année (AAAA)")
    parser.add_argument("mois", type=str, help="Mois (MM)")
    parser.add_argument("top_n", type=int, help="Nombre de lieux à afficher dans le classement")

    args = parser.parse_args()
    classement_lieux(args.fichier_données, args.année, args.mois, args.top_n)



####################


import csv
from collections import defaultdict
import argparse

# Fonction pour établir le classement des lieux les plus cités
def classement_lieux(fichier_données, année, mois, top_n):
    lieux_count = defaultdict(int)

    with open(fichier_données, 'r', newline='') as csvfile:
        reader = csv.DictReader(csvfile)

        for row in reader:
            date = row['Date']  # Colonne contenant la date
            lieu = row['Lieu']  # Colonne contenant le lieu

            # Filtrer par année et mois
            if (année == '*' or date.startswith(année)) and (mois == '*' or date.endswith(mois)):
                lieux_count[lieu] += 1

    lieux_sorted = sorted(lieux_count.items(), key=lambda x: x[1], reverse=True)
    
    print(f"Classement des {top_n} lieux les plus cités en {mois}-{année}:")
    for i, (lieu, count) in enumerate(lieux_sorted[:top_n], start=1):
        print(f"{i}. {lieu}: {count} citations")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Classement des lieux les plus cités")
    parser.add_argument("fichier_données", type=str, help="Fichier de données (CSV)")
    parser.add_argument("année", type=str, help="Année (AAAA) ou '*' pour toutes les années")
    parser.add_argument("mois", type=str, help="Mois (MM) ou '*' pour tous les mois")
    parser.add_argument("top_n", type=int, help="Nombre de lieux à afficher dans le classement")

    args = parser.parse_args()
    classement_lieux(args.fichier_données, args.année, args.mois, args.top_n)