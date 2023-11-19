#!/usr/bin/env bash

if [[ $# -ne 1 ]];
then
    echo "On veut exactement un argument au script."
    exit 1
fi

OUTPUT_FILE=$1


echo "<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Programmation et Projet encadré - Hul Maria</title>
    <!-- Include Bulma CSS from CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>

<body>
    <section class="section">
        <div class="container">
            <h1 class="title has-text-info">Mini projet - Hul Maria</h1>
            <p>Le mini projet du cours PPE m'a permis de voir les différentes étapes du projet de groupe, mais individuellement.
                J'ai démarré avec une liste d'URL déjà faite, récupérée sur le dépôt git.
                Mon script fait plusieurs choses :
                récupère les URL contenues dans un fichier texte,
                écrit sur le terminal des informations séparées par des tabulations,
                les transforme en page web.
            </p>
            <p>Veuillez cliquer sur le lien ci-dessous pour accéder au tableau :</p>
            <a class="has-text-primary" href="https://mariahul1.github.io/PPE1-2023/mini-projet/tableaux/tableau-fr.html">https://mariahul1.github.io/PPE1-2023/mini-projet/tableaux/tableau-fr.html</a>
        </div>
    </section>
    <footer class="footer">
        <div class="content has-text-centered">
            <p>PPE Hul Maria 2023, All rights reserved.</p>
        </div>
    </footer>
</body>
</html>" > "$OUTPUT_FILE"






